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
#include "cohoma_detection/MissionContext.h"  
#include "cohoma_detection/QRCode.h"
#include "cohoma_detection/QRCodeList.h"
#include "cohoma_detection/StrategicPoint.h"   
#include "cohoma_detection/PushSP.h"
#include "cohoma_detection/TrapDelete.h"
#include "cohoma_detection/TrapDisable.h"
#include <vector>
#include <string>
#include <mutex>

using namespace cv;
using namespace std;

class qrcList
{
    public:
    qrcList()
    {
        nh.param<std::string>("qrc_topic",qrc_topic_str,"mission/qrc_data");
        qrc_sub = nh.subscribe(qrc_topic_str, 1000, &qrcList::qrc_cb,this);
        nh.param<std::string>("poi_topic",poi_topic_str,"mission/poi_data");
        poi_sub = nh.subscribe(poi_topic_str, 1000, &qrcList::poi_cb,this);
        mission_context_pub = nh.advertise<cohoma_detection::MissionContext>("mission/mission_context",1);
    }

    //Add a new dummy strategic point when a QRCode object is detected
    void qrc_cb(const cohoma_detection::StrategicPoint::ConstPtr& msg)
    {
        //mise en place de mutex pour assurer un bon ordonnancement des callbacks qrc_cb et poi_cb sur l'accès à la ressource mission_plan
        //std::unique_lock<std::mutex> lock(vector_mutex);
        newSP = true;
        //Check if the QRC has been seen or not
        for(int i=0;i<sp_list.size();i++)
        {
            //If the QRCode has already been seen, the GPS pose is update
            if(msg->message == sp_list[i].message)
            {
                newSP = false;
            }
        }

        //If the QRCode has not already been seen, it is add to the list
        if (newSP == true)
        {
            cout<<"new"<<endl;
            //Push the new SP to the HMI
            sp_list.push_back(*msg);
            ROS_INFO("%f", msg->position.latitude);

            //Publish on callback only if there is a new QR code
            mission_plan.strategic_points = sp_list;
            mission_context_pub.publish(mission_plan);
            display();
        }
        
    }

    //Add a new dummy strategic point when a red object is detected
    void poi_cb(const cohoma_detection::StrategicPoint::ConstPtr& msg)
    {
        //mise en place de mutex pour assurer un bon ordonnancement des callbacks qrc_cb et poi_cb sur l'accès à la ressource mission_plan
        //std::unique_lock<std::mutex> lock(vector_mutex);

        //Add the new SP to the HMI
        sp_list.push_back(*msg);

        //Publish on callback only if there is a new QR code
        mission_plan.strategic_points = sp_list;
        mission_context_pub.publish(mission_plan);
        display();
    }

    void display()
    {
        for(int i=0;i<sp_list.size();i++)
            {
                cout<<"id: "<<sp_list[i].id<<"  lat: "<<sp_list[i].position.latitude<<"   long: "<<sp_list[i].position.longitude<<endl;
            }
            cout<<endl<<endl;
    }

    void start()
    {   
        //loop rate : fréquence envoie data
        ros::Rate loop_rate(2);

        ROS_INFO("%s","QRC Manager: Start");

        while(ros::ok())
        {
            ros::spinOnce();
            loop_rate.sleep();
        }
        ROS_INFO("%s","QRC Manager: End");
    }

    private:
    //contexte de la mission
    cohoma_detection::MissionContext mission_plan;
    //tableau contenant le nombre de fois qu un Point Stratégique a été vue
    std::vector<unsigned long> sp_iteration;
    //liste des Points Stratégiques
    std::vector<cohoma_detection::StrategicPoint> sp_list;
    //subscriber de QRC
    ros::Subscriber qrc_sub; 
    //nom topic subscriber de QRC
    string qrc_topic_str;
    //subscriber de POI
    ros::Subscriber poi_sub;
    //nom topic subscriber de POI
    string poi_topic_str;
    //noeud ROS
    ros::NodeHandle nh;
    //publisher mission contexte
    ros::Publisher mission_context_pub;
    //variable pour le callback qrc_cb
    bool newSP;
    //mutex
    std::mutex vector_mutex;

};

int main(int argc, char** argv)
{
    //init ROS
    ros::init(argc, argv, "qrc_manager");

    qrcList qrc_list;
    qrc_list.start();
    return 0;
}

