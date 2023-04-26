#include <opencv2/core.hpp>
#include <opencv2/videoio.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <stdio.h>
#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/NavSatFix.h>
#include <std_msgs/Bool.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>
#include <random>
#include <string>

using namespace cv;
using namespace std;

//on utilise cv2 et cv_bridge

/*
Ce node (ici qui a pour nom topic_publisher mais dans le launch img_pub) a pour objetcif :
- publier une image (sous format ros msg) issue de la caméra (il faut faire une conversion entre OpneCV img et ROS msg)
- publier les coordonnées GPS du drone
- publier un booléen indiquant qu on publie une img satellite
*/

int main(int argc, char** argv)
{
    //init ROS
    ros::init(argc, argv, "topic_publisher");
    ros::NodeHandle nh;

    //récupération des paramètres
    string img_topic_str;
    string gps_sub_topic;
    string sat_sub_topic;
    nh.param<std::string>("img_topic",img_topic_str,"image");
    nh.param<std::string>("gps_topic",gps_sub_topic,"gps");
    nh.param<std::string>("sat_topic",sat_sub_topic,"sat");
    
    //définition publishers
    ros::Publisher pub_img = nh.advertise<sensor_msgs::Image>(img_topic_str, 10);
    ros::Publisher pub_gps = nh.advertise<sensor_msgs::NavSatFix>(gps_sub_topic, 10);
    ros::Publisher pub_sat = nh.advertise<std_msgs::Bool>(sat_sub_topic, 10);
    
    //messages des publishers
    sensor_msgs::NavSatFix gps;
    std_msgs::Bool pub_sat_msg;
    double latitude = 48.711254;
    double longitude = 2.217728;

    //fréquence d envoie
    ros::Rate loop_rate(2);

    //coordonnées aléatoires
    //normalement il faut recupérer les coordonées GPS avec un subscriber
    gps.latitude = 0.0;
    gps.longitude = 0.0;

    ROS_INFO("lat:%f    long:%f",gps.latitude,gps.longitude);

    //cv bridge : pointeur image
    //https://stackoverflow.com/questions/27080085/how-to-convert-a-cvmat-into-a-sensor-msgs-in-ros
    cv_bridge::CvImage img_bridge;
    //message ROS to be sent
    sensor_msgs::Image img_msg;
    std_msgs::Header header; // empty header
    

    //img openCv contenue ici
    Mat frame;


    //--- INITIALIZE VIDEOCAPTURE
    VideoCapture cap;
    // open the default camera using default API
    //cap.open(0);
    // OR advance usage: select any API backend
    int deviceID = 0;             // 0 = open default camera
    int apiID = cv::CAP_GSTREAMER;      // 0 = autodetect default API
    // open selected camera using selected API
    cap.open(deviceID, apiID);
    // check if we succeeded
    if (!cap.isOpened()) {
        ROS_INFO("%s","ERROR! Unable to open camera");
        return -1;
    }

    while(ros::ok())
    {
        // wait for a new frame from camera and store it into 'frame'
        cap.read(frame);
        // check if we succeeded
        if (frame.empty()) {
            ROS_INFO("%s","ERROR! blank frame grabbed");
        }

        pub_sat_msg.data=true;
        
        
        //ROS bridge
        header.seq++; // user defined counter
        header.stamp = ros::Time::now(); // time
        img_bridge = cv_bridge::CvImage(header,sensor_msgs::image_encodings::BGR8, frame);
        img_bridge.toImageMsg(img_msg); // from cv_bridge to sensor_msgs::Image
        
        
        pub_img.publish(img_msg); // ros::Publisher pub_img = node.advertise<sensor_msgs::Image>("topic", queuesize);
        pub_gps.publish(gps);
        pub_sat.publish(pub_sat_msg);
        
        ros::spinOnce();
    }
    
    // show live and wait for a key with timeout long enough to show images
    imshow("Live", frame);
}
