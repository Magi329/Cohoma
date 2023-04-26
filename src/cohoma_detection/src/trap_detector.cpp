#include <ros/ros.h>
#include <image_transport/image_transport.h> 	// for compressed image sub/pub
#include <cv_bridge/cv_bridge.h>		// headers constants and functions related to images encoding
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>	// openCV's image processing headers
#include <opencv2/highgui/highgui.hpp>	// GUI modules
#include <sensor_msgs/NavSatFix.h>		// GPS message
#include <geographic_msgs/GeoPoint.h>		// geolocalization for GUI
#include <geographic_msgs/GeoPoseStamped.h>	// geolocalization from Anafi
#include <numeric>   
#include <vector> 
#include <string>
#include "cohoma_detection/StrategicPoint.h"       


//#define HOUGH // For edge detection instead of bounding box
#define MEMORY // Keep track of previous traps
#define DISPLAY // Display red-masked stream with sliders for parameters

using namespace cv;

static const std::string OPENCV_WINDOW = "Trap detector";
// OpenCV use HSV in H:0-179, S:0-255, V:0-255
const int max_value_H = 360/2;
const int max_value = 255;
const int erosion_type = MORPH_RECT; // MORPH_RECT, or MORPH_CROSS, or MORPH_ELLIPSE
const int erosion_size = 0;
const int dilation_type = MORPH_RECT; // MORPH_RECT, or MORPH_CROSS, or MORPH_ELLIPSE
const int dilation_size = 0;
const int dilation_iterations = 2; // One might want to dilate more to inflate a bit the mask for a more efficient Hough transform
const int erosion_iterations = 4;
const bool edgeRefine = true; //if true use LSD_REFINE_STD method, if false use LSD_REFINE_NONE method
const int max_canny_thresh = 255;
// Gui display size
const int height = 480;
const int width = 854;

class TrapDetector
{
public:
  TrapDetector()
    : it_(nh_),
      pnh_("~")
  {
    pnh_.param<std::string>("img_topic", img_topic_, "img_topic");
    pnh_.param<std::string>("gps_topic", gps_topic_, "gps");
    pnh_.param<std::string>("poi_topic", poi_topic_, "mission/poi_data");

    pnh_.param<int>("low_H_value", low_H_, 8);
    pnh_.param<int>("low_S_value", low_S_, 60);
    pnh_.param<int>("low_V_value", low_V_, 80);
    pnh_.param<int>("high_H_value", high_H_, 160);
    pnh_.param<int>("high_S_value", high_S_, max_value);
    pnh_.param<int>("high_V_value", high_V_, max_value);
    pnh_.param<int>("canny_thresh_value", canny_thresh_, 100);

    pnh_.param<float>("min_dist_value", min_dist_, 5e-9);
    
    compteurRouge=0;
    ROS_INFO("Trap Detector: Start using img_topic = %s, gps_topic = %s, poi_topic = %s", img_topic_.c_str(), gps_topic_.c_str(), poi_topic_.c_str());
       
       
    // Subscribe to anafi input video and GPS
    image_sub_ = it_.subscribe(img_topic_, 1, &TrapDetector::imageCb, this); // "/usb_cam/image_raw" for test or "/anafi/image" or "/anafi/image_compressed"
    gps_sub_ = nh_.subscribe(gps_topic_, 1, &TrapDetector::nsfGpsCb, this);
    // Publish geoPoint of detected traps
    geopoint_trap_pub_ = nh_.advertise<cohoma_detection::StrategicPoint>(poi_topic_, 1);
    
    
    /* Initialize HSV limits
     * Note: experimental values for red boxes
     
    low_H_ = 8; // search from 0 to low_H_
    low_S_ = 60;
    low_V_ = 80;
    high_H_ = 160; // search from high_H_ to max_value_H
    high_S_ = max_value;
    high_V_ = max_value;
    canny_thresh_ = 100;
    */
#ifdef HOUGH    
    /* Initialize Hough transform parameters */
    hough_threshold_ = 50;
    hough_theta_deg_ = 1;
    hough_rho_ = 1;
    min_line_length_ = 50;
    max_line_gap_ = 10;
#endif

#ifdef DISPLAY    
    namedWindow(OPENCV_WINDOW); // OpenCV HighGUI calls to create (and destroy in destructor) a display window on start-up/shutdown.
    
    /* Trackbars to set thresholds for HSV values (red detection) */
    createTrackbar("Low H", OPENCV_WINDOW, &low_H_, max_value_H, on_low_H_thresh_trackbar, this);
    createTrackbar("High H", OPENCV_WINDOW, &high_H_, max_value_H, on_high_H_thresh_trackbar, this);
    createTrackbar("Low S", OPENCV_WINDOW, &low_S_, max_value, on_low_S_thresh_trackbar, this);
    createTrackbar("High S", OPENCV_WINDOW, &high_S_, max_value, on_high_S_thresh_trackbar, this);
    createTrackbar("Low V", OPENCV_WINDOW, &low_V_, max_value, on_low_V_thresh_trackbar, this);
    createTrackbar("High V", OPENCV_WINDOW, &high_V_, max_value, on_high_V_thresh_trackbar, this);
    /* Trackbars for edge detection */
    createTrackbar("Canny thresh", OPENCV_WINDOW, &canny_thresh_, max_canny_thresh, canny_thresh_trackbar, this);
    
  #ifdef HOUGH    
    /* Trackbars to set Hough transform parameters */
    createTrackbar("Hough threshold", OPENCV_WINDOW, &hough_threshold_, 200, hough_threshold_trackbar, this);
    createTrackbar("Hough theta (deg)", OPENCV_WINDOW, &hough_theta_deg_, 180, hough_theta_trackbar, this);
    createTrackbar("Hough rho", OPENCV_WINDOW, &hough_rho_, 100, hough_rho_trackbar, this);
    createTrackbar("Min line length", OPENCV_WINDOW, &min_line_length_, 500, max_line_length_trackbar, this);
    createTrackbar("Max line gap", OPENCV_WINDOW, &max_line_gap_, 100, max_line_gap_trackbar, this);
  #endif
#endif
  }

  ~TrapDetector()
  {
#ifdef DISPLAY
    destroyWindow(OPENCV_WINDOW);
#endif
  }

#ifdef DISPLAY
  /* Methods for GUI trackbars
   * Use object pointer to resolve 'this' call, as createTrackbar needs to call a static function
   */
#ifdef HOUGH     
  static void hough_threshold_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Hough threshold", OPENCV_WINDOW, image_converter->hough_threshold_);
  }
  static void hough_theta_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Hough theta (deg)", OPENCV_WINDOW, image_converter->hough_theta_deg_);
  }
  static void hough_rho_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Hough rho", OPENCV_WINDOW, image_converter->hough_rho_);
  }
  static void max_line_length_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Min line length", OPENCV_WINDOW, image_converter->min_line_length_);
  }
  static void max_line_gap_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Max line gap", OPENCV_WINDOW, image_converter->max_line_gap_);
  } 
#endif 
  static void on_low_H_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->low_H_ = min(image_converter->high_H_-1, image_converter->low_H_);
    setTrackbarPos("Low H", OPENCV_WINDOW, image_converter->low_H_);
  }
  static void on_high_H_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->high_H_ = max(image_converter->high_H_, image_converter->low_H_+1);
    setTrackbarPos("High H", OPENCV_WINDOW, image_converter->high_H_);
  }
  static void on_low_S_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->low_S_ = min(image_converter->high_S_-1, image_converter->low_S_);
    setTrackbarPos("Low S", OPENCV_WINDOW, image_converter->low_S_);
  }
  static void on_high_S_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->high_S_ = max(image_converter->high_S_, image_converter->low_S_+1);
    setTrackbarPos("High S", OPENCV_WINDOW, image_converter->high_S_);
  }
  static void on_low_V_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->low_V_ = min(image_converter->high_V_-1, image_converter->low_V_);
    setTrackbarPos("Low V", OPENCV_WINDOW, image_converter->low_V_);
  }
  static void on_high_V_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    image_converter->high_V_ = max(image_converter->high_V_, image_converter->low_V_+1);
    setTrackbarPos("High V", OPENCV_WINDOW, image_converter->high_V_);
  }
  static void canny_thresh_trackbar(int, void * object)
  {
    TrapDetector *image_converter = (TrapDetector*) object;
    setTrackbarPos("Canny thresh", OPENCV_WINDOW, image_converter->canny_thresh_);
  }  
#endif  

  /* GPS callbacks */
  void nsfGpsCb(const sensor_msgs::NavSatFixConstPtr& msg)
  {
    current_pos_.latitude = msg->latitude;
    current_pos_.longitude = msg->longitude;
    current_pos_.altitude = msg->altitude;
  }
  void GeoPoseGpsCb(const geographic_msgs::GeoPoseStampedConstPtr& msg)
  {
    current_pos_.latitude = msg->pose.position.latitude;
    current_pos_.longitude = msg->pose.position.longitude;
    current_pos_.altitude = msg->pose.position.altitude;
  }  
  
/****** Image callback ******/
  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
      /* Convert the ROS image message to a CvImage suitable for working with OpenCV
       * Note: if we plan to modify the image, we need a mutable copy of it, so we use toCvCopy()
       * Else, use toCvShare() to share without copy (more efficient)
       */
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8); // = bgr8
    }
    /* catch conversion errors as toCvCopy() / toCvShared() will not check for the validity of the data */
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }
    
    /* Blur the image to eliminate noises (image is convolved with a Gaussian kernel to produce the smoothed image) */
    Mat image_blurred; // Output 
    GaussianBlur(cv_ptr->image, image_blurred, Size(21, 21), 0);
    /* Converts the image from its color space to HSV (more robust to luminosity)
     * Note: image is currently published as "rgb8" (CV_8UC3, color image with red-green-blue color order) from Anafi
     * ROS interface.
     */
    Mat frame_HSV;
    cvtColor(image_blurred, frame_HSV, COLOR_BGR2HSV);
    
    /* Construct a mask for the color, then perform a series of dilations and erosions to remove any small
     * blobs left in the mask
     * Note: As red is around H:0 and H:180, we need to cover both ranges then merge masks
     */
    Mat mask1, mask2;
    Mat mask; // Output
    
    inRange(frame_HSV, Scalar(0, low_S_, low_V_), Scalar(low_H_, high_S_, high_V_), mask1);
    inRange(frame_HSV, Scalar(high_H_, low_S_, low_V_), Scalar(max_value_H, high_S_, high_V_), mask2);
    mask = mask1 | mask2;

    // Create a structuring element for eroding
    Mat erosion_element = getStructuringElement(erosion_type,
                                        Size( 2*erosion_size + 1, 2*erosion_size+1 ),
                                        Point( erosion_size, erosion_size ) );
    erode(mask, mask, erosion_element, Point(-1,-1), erosion_iterations);
    // Create a structuring element for dilating
    Mat dilation_element = getStructuringElement(dilation_type,
                                        Size( 2*dilation_size + 1, 2*dilation_size+1 ),
                                        Point( dilation_size, dilation_size ) );
    dilate(mask, mask, dilation_element, Point(-1,-1), dilation_iterations);
    
        
    /* Mask the source image. Warning, data must have the same size. As mask is 8 bits, source image
     * must be converted into grayscale, or split into 3 individual coolor channels, then merged.
     * Reminder: image_blurred is still in BGR
     */
    Mat masked_frame; // output
    
    //BGR spliting:
    std::vector<Mat> bgrChannels(3);
    split(cv_ptr->image, bgrChannels);
    
    //Mask every channel:
    bitwise_and( bgrChannels[0], mask, bgrChannels[0] ); //B
    bitwise_and( bgrChannels[1], mask, bgrChannels[1] ); //G
    bitwise_and( bgrChannels[2], mask, bgrChannels[2] ); //R
    
    //Merge back the channels
    merge(bgrChannels, masked_frame);

    /* Edge detection
     * Warning: canny only works on 8-bit input images
     */
    Mat gray_masked_frame;
    cvtColor(masked_frame, gray_masked_frame, COLOR_BGR2GRAY);
    
    Mat gray_canny_frame;
    Canny(gray_masked_frame, gray_canny_frame, canny_thresh_, canny_thresh_*2, 3);

#ifdef HOUGH     
    /* Get segments */

    /* Runs the actual detection: Probalistic Hough Line Transform
     *		frame: Output of the edge detector. It should be a grayscale image (although in fact it is a binary one)
	 *      lines: A vector that will store the parameters (r,θ) of the detected lines
     *      rho : The resolution of the parameter r in pixels.
     *      theta: The resolution of the parameter θ in radians. We use 1 degree (CV_PI/180)
     *      threshold: The minimum number of intersections to "*detect*" a line
	 */
	
    std::vector<Vec4i> lines; // will hold the (r,θ) results of the detection
    // Just a little check on values used for HoughLines, as trackbar won't do it
    if (hough_rho_ == 0) hough_rho_ = 1;
    if (hough_theta_deg_ == 0) hough_theta_deg_ = 1;
    if (hough_threshold_ == 0) hough_threshold_ = 1;
    if (min_line_length_ == 0) min_line_length_ = 1;
    if (max_line_gap_ == 0) max_line_gap_ = 1;
    
    HoughLinesP(gray_canny_frame, lines, hough_rho_, hough_theta_deg_*CV_PI/180, hough_threshold_, min_line_length_, max_line_gap_ ); // runs the actual detection
  // HoughLinesP(gray_canny_frame, lines, 1, CV_PI/180, 50, 50, 10 ); // For test purpose

    // Draw the lines
    for( size_t i = 0; i < lines.size(); i++ )
    {
      line( masked_frame, Point(lines[i][0], lines[i][1]),
      Point( lines[i][2], lines[i][3]), Scalar(0,0,255), 3, 8 );
    }
#endif
    /* Get bounding box 
     * First try were very noisy on colored frame. Must be better directly on the binary mask !
     */
    // Finds contours and saves them to the vectors contours
    std::vector<std::vector<Point> > contours;
    // We use here CV_RETR_EXTERNAL mode to retrieve only the extreme outer contours.
    findContours(mask, contours,  CV_RETR_EXTERNAL, CHAIN_APPROX_SIMPLE );

    std::vector<std::vector<Point> > contours_poly( contours.size() );
    std::vector<Point> contours_centers;
    std::vector<Rect> boundRect( contours.size() );
       
    // For every found contour
    for( size_t i = 0; i < contours.size(); i++ )
    {
      // we apply approximation to polygons with accuracy +-3 and stating that the curve must be closed
      approxPolyDP( contours[i], contours_poly[i], 5, true );
      // find a bounding rect for every polygon and save it to boundRect
      boundRect[i] = boundingRect( contours_poly[i] );
      // Find the mean of all the points
      Point2d meanPoint;
      int totalPoints = 0;
      for (auto& p : contours_poly[i])
    {
      Point2d point(p.x, p.y);
      meanPoint += point;
      totalPoints++;
    }
      meanPoint /= totalPoints;
      std::cout << "Mean Point: " << meanPoint << std::endl;
      contours_centers.push_back(meanPoint);
    }




    /* Trap notification
     * We want to avoid two spam scenario : noise, and previously seen trap
     * Noise:  It would be better to track each contour according to object pose and drone velocity
     *		but let say that a noise is just a isolated one-frame detection. If two consecutive frames
     *		see contours, then it is no noise
     *		Possible variation: check with timing 
     * previous trap:	Localization ?
     * 
     */
    if (contours.size() > 0) 
    {
      // If a trap has been seen in (x) previous frames, it was no noise. Then continue process
      if (seen_ >= 1)
      {
        ROS_INFO("Trap detected at\n\tlat: %f\n\tlong: %f\n\talt: %f", current_pos_.latitude, current_pos_.longitude, current_pos_.altitude);
        
        /* If the position is similar to the last trap seen, then it's likely the same. Then don't spam the user with notification
         * Note: altitude doesn't count here.
         */
        float lat_error = current_pos_.latitude - last_trap_pos_.latitude;
        float long_error = current_pos_.longitude - last_trap_pos_.longitude;
        if ((lat_error*lat_error + long_error*long_error) >= 5e-11) // empirical value
        {

          compteurRouge++;

          cohoma_detection::StrategicPoint sp_;

          sp_.id = "R"+std::to_string(compteurRouge);
          sp_.type = 0;
          sp_.status = 1;
          sp_.radius = 0;
          sp_.message = "Point d'interet";
          sp_.position = current_pos_;

#ifdef MEMORY
    
          bool known_trap = false;
          // If memory is set, check all trap localization
          for(std::vector<geographic_msgs::GeoPoint>::iterator it = traps_geopoints_.begin(); it != traps_geopoints_.end(); ++it)
          {
            lat_error = current_pos_.latitude - (*it).latitude;
            long_error = current_pos_.longitude - (*it).longitude;
            
            // If one localization is similar, then it's a known trap. Notify not to publish it.
            if ((lat_error*lat_error + long_error*long_error) <= min_dist_) // empirical value. I would recommend less than 2e-8 to be sure
            {
              known_trap = true;
              break; // No need to check other localizations
            }
          }
          if (!known_trap)
          {
            geopoint_trap_pub_.publish(sp_);
            traps_geopoints_.push_back(current_pos_);
          }
#else     
          // If memory isn't set, just send a notification for a new Point of Interest
          geopoint_trap_pub_.publish(sp_);
#endif
        }

        last_trap_pos_ = current_pos_;        
      }
      seen_++;
    }
    else // = if no contour
    {
      seen_ = 0;
    }

#ifdef DISPLAY    
    /* Display */
    // Draw rectangles
    for( size_t i = 0; i< contours.size(); i++ )
    {
        Scalar color = Scalar( 0, 0, 200); // dark red rectangles
        drawContours( masked_frame, contours_poly, (int)i, color );
        rectangle( masked_frame, boundRect[i].tl(), boundRect[i].br(), color, 2 );
    }    
    
    // Sometimes, I receive different resolution frames... Not easy for display, so we resize
    resize(masked_frame, masked_frame, Size(width, height), INTER_LINEAR);
    imshow(OPENCV_WINDOW, masked_frame);
    waitKey(3);
#endif

  }

private:
  // Note: trackbars variable must be integers
  // HSV red detection parameters
  int low_H_, high_H_, low_S_, high_S_, low_V_, high_V_;  
  int midx_;
  int midy_;
  int xoffset_;
  int yoffset_;
  int canny_thresh_;
  unsigned long compteurRouge;
#ifdef HOUGH
  // Hough transform parameters
  int hough_threshold_;	// Accumulator threshold parameter. Only those lines are returned that get enough votes ( >𝚝𝚑𝚛𝚎𝚜𝚑𝚘𝚕𝚍 ). 
  int hough_theta_deg_;	// Angle resolution of the accumulator in degrees (suitable for trackbar. Warning: houghLines uses rads)
  int hough_rho_; 		// Distance resolution of the accumulator in pixels.
  int min_line_length_; // Minimum line length. Line segments shorter than that are rejected. 
  int max_line_gap_;	// Maximum allowed gap between points on the same line to link them.
#endif  
  ros::NodeHandle nh_;
  ros::NodeHandle pnh_; // For parameters
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  ros::Subscriber gps_sub_;
  ros::Publisher geopoint_trap_pub_;
  geographic_msgs::GeoPoint current_pos_, last_trap_pos_;
  int seen_; // Counter for trap seen in consecutive previous frames
  std::string gps_topic_, img_topic_, poi_topic_;
  float min_dist_;
#ifdef MEMORY
  std::vector<geographic_msgs::GeoPoint> traps_geopoints_; // Stored trap locations to avoid redundancy
#endif
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "trap_detector");
  TrapDetector ic;
  ros::spin();
  return 0;
}
