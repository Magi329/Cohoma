#include <iostream>
#include <sstream>
#include <time.h>
#include <stdio.h>
#include <fstream>
#include <cmath>

#include <opencv2/opencv.hpp>
#include <opencv2/core/core.hpp>   
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/calib3d/calib3d.hpp>
#include <opencv2/calib3d/calib3d_c.h>
#include <opencv2/core/core_c.h>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgcodecs/imgcodecs.hpp>

#include "ros/ros.h"
#include "geometry_msgs/Vector3.h"
#include "cohoma_detection/CoordinateTransformation.h" 


using namespace cv;
using namespace std;

/*
    subscriber : gps_topic, qrc_transfo_pub_topic
*/
Vec3f cameraToWorld(InputArray cameraMatrix, InputArray rV, InputArray tV, InputArray imgPoint)
{
    
    Mat invK64, invK;
    invK64 = cameraMatrix.getMat().inv();     
    invK64.convertTo(invK, CV_32F);
    Mat r, t, rMat;
    rV.getMat().convertTo(r, CV_32F);
    tV.getMat().convertTo(t, CV_32F);

    // invR * T
    Mat invR = r.inv();  

    Mat transPlaneToCam;
    
    if(t.size() == Size(1, 3)){
        transPlaneToCam = invR * t;//t.t();
    }
    else if(t.size() == Size(3, 1)){
        transPlaneToCam = invR * t.t();
    }
    else{
        return Vec3f(0, 0, 0);
    }
    
    float const Zconst = 0.0f;

    // à améliorer
       
        //[x,y,z] = invK * [u,v,1]
        Mat worldPtCam = invK * imgPoint.getMat();
        //[x,y,1] * invR
        Mat worldPtPlane = invR * worldPtCam;

        //zc 
        float scale = transPlaneToCam.at<float>(2) / worldPtPlane.at<float>(2);
        //cout << "scale:" << scale << endl;
        Mat scale_worldPtPlane(3, 1, CV_32F);
        //scale_worldPtPlane.at<float>(0, 0) = worldPtPlane.at<float>(0, 0) * scale;
        //zc * [x,y,1] * invR
        scale_worldPtPlane = scale * worldPtPlane;
        //cout << "scale_worldPtPlane:" << scale_worldPtPlane << endl;
        //[X,Y,Z]=zc*[x,y,1]*invR - invR*T
        Mat worldPtPlaneReproject = scale_worldPtPlane - transPlaneToCam;
        //cout << "worldPtPlaneReproject:" << worldPtPlaneReproject << endl;
        Vec3f worldPoint;
        worldPoint[0] = worldPtPlaneReproject.at<float>(0);
        worldPoint[1] = worldPtPlaneReproject.at<float>(1);
        worldPoint[2] = Zconst;
       
    return  worldPoint;
    
}




Mat eulerAnglesToRotationMatrix(Vec3f &theta)
{
    // Calculate rotation about x axis
    Mat R_x = (Mat_<double>(3,3) <<
        1,       0,              0,
        0,       cos(theta[0]),   -sin(theta[0]),
        0,       sin(theta[0]),   cos(theta[0])
    );
    // Calculate rotation about y axis
    Mat R_y = (Mat_<double>(3,3) <<
        cos(theta[1]),    0,      sin(theta[1]),
        0,               1,      0,
        -sin(theta[1]),   0,      cos(theta[1])
    );
    // Calculate rotation about z axis
    Mat R_z = (Mat_<double>(3,3) <<
        cos(theta[2]),    -sin(theta[2]),      0,
        sin(theta[2]),    cos(theta[2]),       0,
        0,               0,                  1
    );
    // Combined rotation matrix
    Mat R = R_z * R_y * R_x;
    return R;
}

void Callback(const cohoma_detection::CoordinateTransformation msg){
    // Rotation R
    Vec3f eulerAngles;
    eulerAngles[0]= msg.rotation.x;
    eulerAngles[1]= msg.rotation.y;
    eulerAngles[2]= msg.rotation.z;
    Mat rotationMatrix = eulerAnglesToRotationMatrix(eulerAngles);
    // Translation 
    Vec3f translation_vectors;
    translation_vectors[0] = msg.translation.x;
    translation_vectors[1] = msg.translation.y;
    translation_vectors[2] = msg.translation.z;
    // Coordonées pixel
    Vec3f imgPoint;
    imgPoint[0] = msg.coor_pixel.x;
    imgPoint[1] = msg.coor_pixel.y;
    imgPoint[2] = msg.coor_pixel.z;
    // Intrinsic Matrix
    Mat intrinsic_matrix = Mat::eye(3,3,CV_32FC1);  //unité um
    intrinsic_matrix.at<float>(0,2) = 1024;
    intrinsic_matrix.at<float>(1,2) = 512;

    Vec3f worldPoint = cameraToWorld(intrinsic_matrix, rotationMatrix, translation_vectors, imgPoint); 
    cout << "TROUVER coordonnées spacial:\n" << worldPoint << endl;
}


int main(int argc, char **argv){
    ros::init(argc,argv,"transformer");
    ros::NodeHandle nh;
    ros::Subscriber sub=nh.subscribe("qrc_coor_transfo_topic",1,Callback); 
    ros::spin();// activate callback func. If only use once ros：：spinOnce
    return 0;
}
