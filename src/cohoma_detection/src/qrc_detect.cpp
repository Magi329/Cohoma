#include <ros/ros.h>
#include <image_transport/image_transport.h> 	// for compressed image sub/pub
#include <cv_bridge/cv_bridge.h>		// headers constants and functions related to images encoding
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>	// openCV's image processing headers
#include <opencv2/highgui/highgui.hpp>	// GUI modules
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>
#include <sensor_msgs/NavSatFix.h>		// GPS message
#include <geographic_msgs/GeoPoint.h>		// geolocalization for GUI
#include <geographic_msgs/GeoPoseStamped.h>	// geolocalization from Anafi
#include <iostream>
#include <stdio.h>
#include <algorithm>
#include <vector>
#include <string>
#include <zbar.h> //sudo apt-get install libzbar-dev
#include <sensor_msgs/CompressedImage.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/String.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Int8.h>
#include <cv_bridge/cv_bridge.h>
#include <random>
#include "cohoma_detection/MissionContext.h"
#include "cohoma_detection/QRCode.h"
#include "cohoma_detection/QRCodeList.h"
#include "cohoma_detection/StrategicPoint.h"   
#include "cohoma_detection/PushSP.h"
#include "cohoma_detection/TrapDelete.h"
#include "cohoma_detection/TrapDisable.h"
#include "cohoma_detection/CoordinateTransformation.h"
#include <bits/stdc++.h>
#include <boost/lexical_cast.hpp>
#include <ros/console.h>
#include <sstream>

using namespace std;
using namespace cv;
using namespace zbar;

//define a struture to hold the information about a barcode or QR code detected in an image
typedef struct
{
  string type;
  string data;
  float location[2];//x  y
} decodedObject;

// swith between drone camera and test camera
bool drone = false;

/*
Ce node (ici qui a pour nom qrc_detect et dans le launch qrc_detect) 

* subscriber : img_topic
  publisher : qrc_data_pub
  action : après réception de img ros envoyée par img_pub, on essaie de décoder les envtuels QRCode (infos, localisation)
            on envoie ensuite la liste des QRCodes detectés sur le topic qrc_topic
*/

class QRCDetect
{
    public:
    QRCDetect()
    {
        sat=false;

        //récupération des paramètres
        nh.param<std::string>("qrc_dim",dim,"8.25");
        nh.param<std::string>("img_topic",img_sub_topic,"image");
        nh.param<std::string>("gps_topic",gps_sub_topic,"gps");
        nh.param<std::string>("sat_topic",sat_sub_topic,"sat");
        nh.param<std::string>("zoom_topic",zoom_sub_topic,"control/cmd_zoom");
        nh.param<std::string>("gimbal_topic",gimbal_sub_topic,"control/cmd_cam");
        nh.param<std::string>("qrc_topic",qrc_data_pub_topic,"mission/qrc_data");
        //nh.param<std::string>("qrc_coor_transfo_service",coor_transfo_service,"transformation/qrc_coor");

        //Subscribers
        img_sub = nh.subscribe(img_sub_topic, 1000, &QRCDetect::img_cb,this);
        gps_sub = nh.subscribe(gps_sub_topic, 1000, &QRCDetect::gps_cb,this);
        sat_sub = nh.subscribe(sat_sub_topic, 1000, &QRCDetect::sat_cb,this);
        zoom_sub = nh.subscribe(zoom_sub_topic, 1000, &QRCDetect::zoom_cb,this);
        gimbal_sub = nh.subscribe(gimbal_sub_topic, 1000, &QRCDetect::gimbal_cb,this);
    
        //Publisher
        //SP and QRC are quite the same, SP is HMI oriented whereas QRC are the raw data
        //on publie SP sur topic mission/qrc_data
        qrc_data_pub=nh.advertise<cohoma_detection::StrategicPoint>(qrc_data_pub_topic,1);
        // on demande des coordonnées du qrcode sur service transformation/qrc_coor
        //ros::ServiceClient client = nh.serviceClient<cohoma_detection::CoordinateTransformation>(coor_transfo_service);
        //CV Bridge Initi
        cv_image=NULL;

        //init logger message
        if( ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug) ) 
        {
            ros::console::notifyLoggerLevelsChanged();
        }

    }

    void gps_cb(const sensor_msgs::NavSatFix::ConstPtr& msg)
    {
        if(sat)
        {
            gps = *msg;
        }
    }

    void sat_cb(const std_msgs::Bool::ConstPtr& msg)
    {
        sat = msg->data;
    }

    void zoom_cb(const std_msgs::Int8::ConstPtr& msg)
    {
        zoom=msg->data;
    }

    void gimbal_cb(const std_msgs::Float32::ConstPtr& msg)
    {
        gimbal=msg->data;
    }

    //décodage des QRCode dans l'image
    //attention on ne peut que lire certains QRCode
    //cf vidéo suivante pour plus d'explication : https://www.youtube.com/watch?v=KcHs_mj_XRc
    void img_cb(const sensor_msgs::ImageConstPtr &msg)
    {
        ROS_INFO("Image recieved. Starting to detect QR code...");
        // https://github.com/ros-drivers/zbar_ros/blob/ros2/include/zbar_ros/barcode_reader_node.hpp
        // https://github.com/mdrwiega/qr_detector/blob/master/src/qr_detector_nodelet.cpp

        //on peut jouer sur le mono8 en le remplacant par du BGR2GRAY ou autre chose RGB etc
        //conversion img ROS en img OpenCV
        cv_image = cv_bridge::toCvShare(msg,"mono8");
        
        // Create zbar scanner
    
        // Configure scanner
        scanner.set_config(zbar::ZBAR_NONE, zbar::ZBAR_CFG_ENABLE, 1);
        
        // Convert image to grayscale
        //Mat imGray;
        //cvtColor(cv_image, imGray,CV_BGR2GRAY);

        // Wrap image data in a zbar image
        zbar::Image image(cv_image->image.cols, cv_image->image.rows, "Y800", cv_image->image.data, cv_image->image.cols * cv_image->image.rows);
        ROS_INFO("Wrap image data in a zbar image done");
        // Scan the image for barcodes and QRCodes
        int n = scanner.scan(image);
        ROS_INFO("Scan done %d", n);
        // add code bar to the vector decodedObjects
        for(zbar::Image::SymbolIterator symbol = image.symbol_begin(); symbol != image.symbol_end(); ++symbol)
        {
            decodedObject obj;
            obj.type = symbol->get_type_name();
            obj.data = symbol->get_data();
            // Print type and data
            
            cout << "Type : " << obj.type << endl; //contient le type de code barre : QRCode etc
            cout << "Data : " << obj.data << endl; //contient les infos qui sont séparés par des retours à la ligne

            // Calculer le barycentre (en pixel) du qrcode
            int xb=0, yb=0;
            vector<Point2f> points_camera;   // à vérifier si il convient 0 0 ou pas
            for(int i = 0; i< symbol->get_location_size(); i++)   // size = 4 normallement 
            {
                //cout<<"x:"<<symbol->get_location_x(i)<<"   y:"<<symbol->get_location_y(i)<<endl;
                xb += symbol->get_location_x(i);
                yb += symbol->get_location_y(i);
                points_camera.push_back(Point2f(symbol->get_location_x(i),symbol->get_location_y(i)));
            }
            obj.location[0] = xb / symbol->get_location_size();
            obj.location[1] = yb / symbol->get_location_size();

            //we save the code bar just in case
            decodedObjects.push_back(obj);

            // Uses PnP (Perspective-n-Point) from Open CV to compute distance between the camera and the QR Code

            // Define the 2D and 3D points
            vector<Point2f> points_2D {
                points_camera[0],  // Top left corner
                points_camera[1],  // Bot left corner 
                points_camera[2],  // Bot right corner
                points_camera[3]   // Top right corner
            };
            float dim_f = stof(dim);
            vector<Point3f> points_3D {
                Point3f(0.0,    dim_f,  0.0),  // Top left corner
                Point3f(0.0,       0.0,     0.0),  // Bot left corner 
                Point3f(dim_f, 0.0,     0.0),  // Bot right corner
                Point3f(dim_f, dim_f, 0.0)   // Top right corner
            };
            // Coordinates in the real world. Origin is at "bot left corner (in front?)"
/*
            points_2D.insert(points_2D.begin(), Point2f(xb, yb));
            points_3D.insert(points_3D.begin(), Point3f(dim_f/2, dim_f/2, 0.0));
*/
            // définir la matrice de la caméra
            double fx, fy, cx, cy;
            if (drone) {
                fx = 969.534432;
                fy = 964.847390;
                cx = 634.036198;
                cy = 377.592061;
            } else { //webcam
                fx = 1480.41427;
                fy = 1474.89066;
                cx = 1147.40483;
                cy = 748.896047;
            }
            
            Mat matrix_camera = (Mat_<double>(3, 3) <<
                         fx, 0, cx,
                         0, fy, cy,
                         0, 0, 1);

            Mat dist_coeffs = (Mat_<double>(1, 5) << 0.22130993, -0.41389255,  0.00272609,  0.0008422,  0.58117634);
            
            // Use Perspective n Points from OpenCV to convert 2D point on the camera to 3D point in the real world
            Mat rotation, translation;
            bool success = solvePnP(points_3D, points_2D, matrix_camera, dist_coeffs, rotation, translation, false);

            ROS_INFO_STREAM("Rotation: " << rotation);
            ROS_INFO_STREAM("Translation: " << translation);
/*
            //envoyer un request
            cohoma_detection::CoordinateTransformation srv;
            geometry_msgs::Vector3 vector_rotation;
            vector_rotation.x = rotation.at<float>(0,0);
            vector_rotation.y = rotation.at<float>(1,0);
            vector_rotation.z = rotation.at<float>(2,0);
            geometry_msgs::Vector3 vector_translation;
            vector_translation.x = translation.at<float>(0,0);
            vector_translation.y = translation.at<float>(1,0);
            vector_translation.z = translation.at<float>(2,0);
            geometry_msgs::Point coor_px;                   
            coor_px.x = xb;
            coor_px.y = yb;
            coor_px.z = 0;
            srv.request.rotation = vector_rotation;           // rotation
            srv.request.translation = vector_translation;     // translation
            srv.request.coor_pixel = coor_px;                 // coor_pixel
            srv.request.gps_drone = gps;                      // gps_drone
            if (client.call(srv))
            {
                //la position GPS du QRCode 
                geographic_msgs::GeoPoint qrc_position = srv.response.gps_qrcode;    // puis l'ajouter dans StrategiePoint
                ROS_INFO_STREAM("Coordinates of the QRcode: " << qrc_position);
            }
            else
            {
                ROS_ERROR("Failed to call service qrc_coor_transfo_service");
  
            }
*/


            //make an action for the code bar  
            tokenize(obj.data,"\r\n");  
            if(qrcode_parse[1]=="s/o")
            {
                qrcode_parse[1]="0";
            }

            if(qrcode_parse[2]=="s/o")
            {
                qrcode_parse[2]="0";
            }
            
            //construction message contenant la position
            //pour avoir la position du QRCode il faut la position GPS du drone, ok
            // l orientation de la caméra,
            //les coordonnées du point dans la caméra. ok
            geographic_msgs::GeoPoint position;
            position.latitude = 0;
            position.longitude = 0;
            position.altitude = 0.0;

            //construction du message QRCode
            cohoma_detection::QRCode qrc_tab_msg;
            qrc_tab_msg.raw_value =obj.data;
            qrc_tab_msg.position=position;
            qrc_tab_msg.nature = qrcode_parse[0];
            qrc_tab_msg.id=stoui(qrcode_parse[1]);
            qrc_tab_msg.ngz_radius = stoui(qrcode_parse[2]);
            qrc_tab_msg.dsb_status = qrcode_parse[3]=="1";
            qrc_tab_msg.dsb_code = stoui(qrcode_parse[4]);
            qrc_tab_msg.contact_dsb = qrcode_parse[5]=="1";
            qrc_tab_msg.dsb_vector = stoui(qrcode_parse[6]);
            qrc_tab_msg.other = stoui(qrcode_parse[7]);

            //we save qrcode msg just in case 
            qrc_code_msg.push_back(qrc_tab_msg);

            //type de piège
            unsigned short type=0;
            if(qrcode_parse[6]=="Terrestre et aérien" || qrcode_parse[6] == "Terrestre ou aérien")
            {   type = 1;}
            else if (qrcode_parse[6] == "Terrestre" || qrcode_parse[6] == "Terrestres")
            {   type = 2;}
            else if (qrcode_parse[6] == "Aérien")
            {   type = 3;}
            else
            {   type = 0;}

            //statut de piège
            unsigned short status=0;
            if(qrcode_parse[3]=="Oui" || qrcode_parse[5] == "Oui")
            {   status = 1;}
            else if (!(qrcode_parse[3] == "Oui" && qrcode_parse[5] == "Oui"))
            {   status = 2;}
            else
            {   status = 1;}

            //construction message SP avec les informations du QRCode
            cohoma_detection::StrategicPoint qrc_SP;
            qrc_SP.id = qrcode_parse[1];
            qrc_SP.position=position;
            qrc_SP.type = type;
            qrc_SP.status = status;
            qrc_SP.radius = stof(qrcode_parse[2]);
            qrc_SP.message = "Nature: "+qrcode_parse[0] + " | Id: " + qrcode_parse[1] + " | Rayon: " + 
            qrcode_parse[2] + " | Desactivation distance: " + qrcode_parse[3] + " | Code: " +
            qrcode_parse[4] + " | Desactivation contact: " + qrcode_parse[5] + " | Vecteur: " +
            qrcode_parse[6] + " | Divers: " + qrcode_parse[7];
            
            //we save SP msg just in case
            qrc_code_sp.push_back(qrc_SP);

            //shit code a retirer 
            sat = true;
            //publishing if there is a satelite coverage
            if(sat)
            {
                qrc_data_pub.publish(qrc_SP);
            }
            else
            {
                ROS_INFO("Trap detected, no GPS info ");
                ROS_INFO("Raw data: ");
                cout<<obj.data<<endl;
            }

        }

        
    }

    //pour spliter une chaine de caractère avec le délimiteur \r\n
    void tokenize(string s, string del = "\r\n")
    {
        qrcode_parse.clear();
        int start, end = -1*del.size();
        do {
            start = end + del.size();
            end = s.find(del, start);
            qrcode_parse.push_back(s.substr(start, end - start));
        } while (end != -1);
    }   

    unsigned int stoui(string s)
    {
        stringstream uis(s);
        unsigned int S = 0;
        uis>>S;
        return S;
    } 

    void start()
    {
        //loop rate : fréquence envoie data 10 Hz
        ros::Rate loop_rate(10);

        ROS_INFO("%s","QRC Detect : Start");

        while(ros::ok())    
        {
            ros::spinOnce();
            loop_rate.sleep();
        }
        ROS_INFO("%s","QRC Detect : End");
    }
 

    private:
    //
    bool sat;
    //coordonnées GPS du drone
    sensor_msgs::NavSatFix gps;
    //Drones Gimbal pitch angle from 
    float gimbal = 0.0 ;
    //Zoom from the drone camera
    float zoom = 0.0;
    //QRC real world dimensions
    string dim;
    //Subscribers
    ros::Subscriber img_sub;
    string img_sub_topic;

    ros::Subscriber gps_sub;
    string gps_sub_topic;

    ros::Subscriber sat_sub;
    string sat_sub_topic;

    ros::Subscriber zoom_sub;
    string zoom_sub_topic;

    ros::Subscriber gimbal_sub;
    string gimbal_sub_topic;

    //Publisher
    ros::Publisher image_pub;
    ros::Publisher qrc_data_pub;
    string coor_transfo_service;
    string qrc_data_pub_topic;

    //noeud ROS
    ros::NodeHandle nh;

    //CV Bridge : ROS -> CV Bridge
    cv_bridge::CvImageConstPtr cv_image;

    // tableau contenant les données de tous les QRCode décodés
    vector<decodedObject> decodedObjects;
    // tableau contenant les données des QRCode décodés mis en forme de msg ROS QRCode.msg
    vector<cohoma_detection::QRCode> qrc_code_msg;
    // tableau contenant les données des QRCode décodés mis en forme de msg ROS StrategicPoint.msg
    vector<cohoma_detection::StrategicPoint> qrc_code_sp;


    zbar::ImageScanner scanner;

    //tableau contenant variable QRCode parsée
    vector<string> qrcode_parse;
    
};

int main(int argc, char** argv)
{
    //init ROS
    ros::init(argc, argv, "qrc_detect");

    QRCDetect qrc_detect;
    qrc_detect.start();
    return 0;
}