#include <ros/ros.h>
#include "geometry_msgs/Vector3.h"
#include "cohoma_detection/CoordinateTransformation.h" 

using namespace std;

/*
    node : qrc_coor_transfo
    publisher: qrc_transfo_pub_topic
    objectif : definir et envoyer des message de type coordinateTransformation pour fournir au transformer qui réalise la transformation des coordonnées
*/


int main(int argc, char **argv)
{
    ros::init(argc, argv, "qrc_coor_transfo"); //define node name, introduce node parameters                                                                                                                                                                  
    ros::NodeHandle nh;  
    cohoma_detection::CoordinateTransformation transfo_msg;            
    geometry_msgs::Vector3 translation; 
    geometry_msgs::Vector3 rotation;
    geometry_msgs::Point img_point;
      

    //create publisher, tell ros how to publish on a topic(which message,what the topic name is, the maximum message length)
    ros::Publisher qrc_transfo_pub=nh.advertise<cohoma_detection::CoordinateTransformation>("qrc_coor_transfo_topic",1);
    ros::Rate loop_rate(1.0);   
    while (ros::ok())
    {
        translation.x = 10;
        translation.y = 20;
        translation.z = 30;
        transfo_msg.translation = translation; 
        cout<<"translation in transfo_msg\n"<<transfo_msg.translation<<endl;
        rotation.x = 1;
        rotation.y = 2;
        rotation.z = 3;
        transfo_msg.rotation = rotation;
        cout<<"rotation in transfo_msg\n"<<transfo_msg.rotation<<endl;
        img_point.x = 166;
        img_point.y = 66;
        img_point.z = 0;
        transfo_msg.coor_pixel = img_point;
        cout<<"coor_pixel in transfo_msg\n"<<transfo_msg.coor_pixel<<endl;

        cout<<"call in transfo_msg\n"<<transfo_msg<<endl;
        // publish the message
        qrc_transfo_pub.publish(transfo_msg); 
        ROS_INFO("Publishing CoordinateTransformation Info");
        loop_rate.sleep();  
    }
    return 0;


}
