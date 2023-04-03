#!/usr/bin/env python3

import numpy as np
from math import cos, pi, sin

v1 = np.array([1,2,3])
print(v1)
v1 *= 1

gimbal_rad = (0*pi/180)
v0 = np.array([cos(gimbal_rad)*v1[0] + sin(gimbal_rad)*v1[2],v1[1],-sin(gimbal_rad)*v1[0] + cos(gimbal_rad)*v1[2]])

print(v0)


# Find the corners of the QR code polygon
points_camera = np.array([obj.polygon])
qrc_raw = (obj.data).decode('utf-8')
cv_image = cv2.circle(cv_image, (round(xb),round(yb)), 10, (0,0,250), -1)
cv_image = cv2.polylines(cv_image, points_camera, True, (250,0,0), 2)
# Display point in BGR
# Red
cv_image = cv2.circle(cv_image, points_camera[0][0], 10, (0,0,250), -1)
# Yellow
cv_image = cv2.circle(cv_image, points_camera[0][1], 10, (0,250,250), -1)
# Magenta# Red
cv_image = cv2.circle(cv_image, points_camera[0][0], 10, (0,0,250), -1)
# Yellow
cv_image = cv2.circle(cv_image, points_camera[0][1], 10, (0,250,250), -1)
# Magenta
cv_image = cv2.circle(cv_image, points_camera[0][2], 10, (250,0,250), -1)
# Green
cv_image = cv2.circle(cv_image, points_camera[0][3], 10, (0,250,0), -1)

# Uses PnP (Perspective-n-Point) from Open CV to compute distance between the camera and the QR Code
points_2D = [
    points_camera[0][0],  # Top left corner
    points_camera[0][1],  # Bot left corner 
    points_camera[0][2],  # Bot right corner
    points_camera[0][3]   # Top right corner
    ]

points_3D = [
    (0.0     ,  self.dim, 0.0),  # Top left corner
    (0.0     ,  0.0     , 0.0),  # Bot left corner 
    (self.dim,  0.0     , 0.0),  # Bot right corner
    (self.dim,  self.dim, 0.0)   # Top right corner
    ] # coordonnées dans le monde réel. L'origine se trouve sur "bot left corner (en face ?)". Not yet konw the orientation
            
# Permutte geometric positions of the 3D object depending on the rotation 
# Pyzbar is automaticly positionning the polygon points (see comments on the points_2D array)
# in order to match the correct point to the correct real world value it is mandatory to rearange de array with a circular permutation
if obj.orientation == "UP":
    pass
elif obj.orientation == "LEFT":
    points_3D = self.reverseCircularPermutation(points_3D,1)
elif obj.orientation == "BOTTOM":
    points_3D = self.reverseCircularPermutation(points_3D,2)
elif obj.orientation == "RIGHT":
    points_3D = self.reverseCircularPermutation(points_3D,3)

points_2D.insert(0, [xb, yb])
points_3D.insert(0, [self.dim/2 ,  self.dim/2,  0.0])


print(points_2D)
print(points_3D)


points_3D = np.array(points_3D)
points_2D = np.array(points_2D ,dtype = "double")

# Camera matrix parameters
# Switch between drone camera or the test camera 
if drone :
    fx = 969.534432
    fy = 964.847390
    cx = 634.036198
    cy = 377.592061
else :
    fx = 502.55419128
    fy = 502.04227557
    cx = 351.39874168
    cy = 246.11607977

matrix_camera = np.array(
     [[fx, 0,cx],
      [ 0,fy,cy],
      [ 0, 0, 1]], dtype = "double"
     )

dist_coeffs = np.zeros((4,1))

# Use Perspective n Points from OpenCV to covert 2D point on the camera to 3D point in the real world
success, vector_rotation, vector_translation = cv2.solvePnP(points_3D, points_2D, matrix_camera, dist_coeffs, flags=0)

rospy.loginfo("Rotation: ")
rospy.loginfo(vector_rotation)
rospy.loginfo("Translation: ")
rospy.loginfo(vector_translation)



"""  non pas utilisé dans qrc_detect
            /*
            std::string qrc_raw = std::string(obj.data.begin(), obj.data.end());
            
            Mat cv_image_mat = cv_image->image;
            //Add a polyline on the detected QR code and its COG to visualise it
            cv::circle(cv_image_mat, cv::Point(round(xb), round(yb)), 10, cv::Scalar(0,0,250), -1);
            std::vector<std::vector<cv::Point2f>> contours = { points_camera };
            cv::polylines(cv_image_mat, contours, true, cv::Scalar(250,0,0), 2);

            // Display point in BGR
            // Red
            cv::circle(cv_image_mat, points_camera[0], 10, cv::Scalar(0,0,250), -1);
            // Yellow
            cv::circle(cv_image_mat, points_camera[1], 10, cv::Scalar(0,250,250), -1);
            // Magenta
            cv::circle(cv_image_mat, points_camera[2], 10, cv::Scalar(250,0,250), -1);
            // Green
            cv::circle(cv_image_mat, points_camera[3], 10, cv::Scalar(0,250,0), -1);
            */

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
            // Define the camera matrix and distortion coefficients
            double k1=0, k2=0, k3=0, p1=0, p2=0, fx=0, cx=0, fy=0, cy=0;
            Mat camera_matrix = (Mat_<double>(3, 3) << fx, 0, cx, 0, fy, cy, 0, 0, 1);
             

            // Define the rotation and translation vectors
            Mat rvec, tvec;

            // Solve the PnP problem to compute the rotation and translation vectors
            cv::solvePnP(points_3D, points_2D, camera_matrix, distortion_coeffs, rvec, tvec);

            // Compute the distance between the camera and the QR code
            // double camera_qrcode_distance = cv::norm(tvec);
*/
            
/*          // in order to match the correct point to the correct real world value it is mandatory to rearrange de array with a circular permutation
            if (obj.orientation == "UP") {
                // do nothing
            }
            else if (obj.orientation == "LEFT") {
                points_3D = reverseCircularPermutation(points_3D, 1);
            }
            else if (obj.orientation == "BOTTOM") {
                points_3D = reverseCircularPermutation(points_3D, 2);
            }
            else if (obj.orientation == "RIGHT") {
                points_3D = reverseCircularPermutation(points_3D, 3);
            }
            error : orientation not exists
*/

"""