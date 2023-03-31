#!/usr/bin/env python3

from math import cos, pi, sin
import pyzbar.pyzbar as pyzbar
import numpy as np
import rospy
from sensor_msgs.msg import CompressedImage, Image, NavSatFix
from std_msgs.msg import String, Bool, Float32, Int8
from geographic_msgs.msg import GeoPoint
from cv_bridge import CvBridge, CvBridgeError
from random import random
import cv2
import tf


from cohoma_detection.msg import *

drone = False

class QRCDetect:
    def __init__(self):
        # Params
        # self.image = None
        self.sat = False
        self.gps = NavSatFix()
        self.br = CvBridge()
        self.loop_rate = rospy.Rate(10)
        self.gimbal = 0.0 # Drones Gimbal pitch angle from 
        self.zoom = 0.0 # Zoom from the drone camera

        # QRC real world dimensions
        self.dim = rospy.get_param('~qrc_dim')

        # Subscribers
        rospy.Subscriber(rospy.get_param('~img_topic'), Image, self.image_cb)
        rospy.Subscriber(rospy.get_param('~gps_topic'), NavSatFix, self.gps_cb)
        rospy.Subscriber(rospy.get_param('~sat_topic'), Bool, self.sat_cb)
        rospy.Subscriber(rospy.get_param('~zoom_topic'), Int8, self.zoom_cb)
        rospy.Subscriber(rospy.get_param('~gimbal_topic'), Float32, self.gimbal_cb)

        self.image_pub = rospy.Publisher("image_qrc", Image, queue_size=1)

        # Publishers
        # SP and QRC are quite the same, SP is HMI oriented whereas QRC are the raw data
        self.qrc_data_pub = rospy.Publisher(rospy.get_param(
            '~qrc_topic'), StrategicPoint, queue_size=1, latch=True)


    def circularPermutation(self, L, deg):
        #Check if the deg is superior at the array length
        if deg > len(L):
            return L

        # initialisation de la liste obtenue via une permutation circulaire de L
        circlarList = []
        for i in range(len(L) - deg, len(L)):
            circlarList.append(L[i])
        for i in range(0, len(L) - deg):
            circlarList.append(L[i])

        return circlarList
    
    def reverseCircularPermutation(self,L, deg):
        #Check if the deg 
        if deg > len(L):
            return L

        # initialisation de la liste obtenue via une permutation circulaire de L
        circlarList = []
        for i in range(deg, len(L)):
            circlarList.append(L[i])
        for i in range(0, deg):
            circlarList.append(L[i])

        return circlarList

    # GPS callback function
    def gps_cb(self, msg):
        if self.sat:
            self.gps = msg

    # Sat coverage callback function
    def sat_cb(self, msg):
            self.sat = msg.data
    
    def zoom_cb(self, msg):
        self.zoom = msg.data

    def gimbal_cb(self, msg):
        self.gimbal = msg.data

    def image_cb(self, img):
        # rospy.loginfo('Image received...')
        cv_image = self.br.imgmsg_to_cv2(img, "bgr8")

         # Find barcodes and QR codes
        decodedObjects = pyzbar.decode(cv_image)
        print("attente")
        # Print results
        for obj in decodedObjects:
            print("detect")
            qrc_raw = (obj.data).decode('utf-8')

            
            # Find the position of a QR code on a frame (not tested)
            """
            # Find the corners of the QR code polygon
            points_camera = np.array([obj.polygon])
            #rospy.loginfo(obj.orientation)
            rospy.loginfo(obj.quality)

            #rospy.loginfo(obj)
            # Calculate the center of gravity of the polygon in order to find the center
            xb = 0
            yb = 0

            for i in obj.polygon:
                xb += i[0]
                yb += i[1]
            
            xb /= len(obj.polygon)
            yb /= len(obj.polygon)


            #rospy.loginfo(xb)
            #rospy.loginfo(yb)
            
            qrc_raw = (obj.data).decode('utf-8')

            #rospy.loginfo(obj)
            #rospy.loginfo(points_camera)
            
            # Add a polyline on the detected QR code and its COG to visualise it
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
                        ]

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
            
            normale_point2D, jacobian = cv2.projectPoints(np.array([(0.0, 0.0, 1000.0)]), vector_rotation, vector_translation, matrix_camera, dist_coeffs)
            
            for p in points_2D:
                cv2.circle(cv_image, (int(p[0]), int(p[1])), 3, (0,0,255), -1)

            point1 = ( int(points_2D[0][0]), int(points_2D[0][1]))

            point2 = ( int(normale_point2D[0][0][0]), int(normale_point2D[0][0][1]))

            cv_image = cv2.line(cv_image, point1, point2, (255,255,255), 4)
            
            # v1 is the vector representing the QRCode position from the camera base
            v1 = np.array([-vector_translation[0][0],-vector_translation[1][0],vector_translation[2][0]])

            # We need to multiply by the zoom value because the PnP do not take is in account
            v1 *= self.zoom

            # v0 s the vector representing the QRCode position from the drone base
            gimbal_rad = (self.gimbal*pi/180)
            v0 = np.array([cos(gimbal_rad)*v1[0] + sin(gimbal_rad)*v1[2],v1[1],-sin(gimbal_rad)*v1[0] + cos(gimbal_rad)*v1[2]])
            
            # Publishing QRCode TF
            brcst = tf.TransformBroadcaster()
            #rospy.loginfo(vector_translation)
            brcst.sendTransform((v0[0],v0[1],v0[2]),(0,0,0,1),rospy.Time.now(),"qrc","base")
            
            """


            try:
                # Split each element of the QR code data
                data_tab = str(qrc_raw).split('\r\n')

                # Change the value to the null element
                if data_tab[1] == "s/o":
                    data_tab[1] = 0

                if data_tab[2] == "s/o":
                    data_tab[2] = 0

                # Parse in the good format all the QR code data elements
                qrc_tab = QRCode(
                    qrc_raw,
                    GeoPoint(self.gps.latitude, self.gps.longitude, 0.0),
                    data_tab[0],
                    np.uint16(data_tab[1]).item(),
                    np.uint8(data_tab[2]).item(),
                    np.bool8(data_tab[3] == 'Oui').item(), #Return True or False
                    data_tab[4],
                    np.bool8(data_tab[5] == 'Oui').item(), #Return True or False
                    data_tab[6],
                    data_tab[7]
                )
                
                # Matching text with trap defusing vector
                if (data_tab[6] == "Terrestre et aérien") | (data_tab[6] == "Terrestre ou aérien"):
                    type = 1
                elif (data_tab[6] == "Terrestre") | (data_tab[6] == "Terrestres"):
                    type = 2
                elif (data_tab[6] == "Aérien"):
                    type = 3
                else:
                    type = 0

                # Matching text with trap defusing status
                if (data_tab[3] == 'Oui') | (data_tab[5] == 'Oui'):
                    status = 1
                elif ((data_tab[3] == 'Oui') & (data_tab[5] == 'Oui')) == False:
                    status = 2
                else:
                    status = 1

                # Parsing the QRC into strategic point elements
                qrc_tab = StrategicPoint(
                    data_tab[1],
                    GeoPoint(self.gps.latitude, self.gps.longitude, 0.0),
                    type,
                    status,
                    np.float32(data_tab[2]).item(),
                    "Nature: " + str(data_tab[0]) + " | Id: " + str(data_tab[1]) + " | Rayon: " + 
                    str(data_tab[2]) + " | Desactivation distance: " + str(data_tab[3]) + " | Code: " + 
                    str(data_tab[4]) + " | Desactivation contact: " + str(data_tab[5]) + " | Vecteur: " + 
                    str(data_tab[6]) + " | Divers: " + str(data_tab[7])
                    # qrc_raw
                )
                
                # Publishing is there is a satelite coverage
                if self.sat:
                    self.qrc_data_pub.publish(qrc_tab)
                    self.image_pub.publish(self.br.cv2_to_imgmsg(cv_image, "bgr8"))
                # Or it is displayed on the terminal
                else:
                    rospy.loginfo("Trap detected, no GPS info \n")
                    rospy.loginfo("Raw data: \n")
                    rospy.loginfo(qrc_raw)

            except:
                rospy.loginfo("Error reading \n")

    def start(self):

        rospy.loginfo("QRC Detect: Start")

        while not rospy.is_shutdown():
            self.loop_rate.sleep()

        rospy.loginfo("QR Detect: End")

if __name__ == '__main__':
    rospy.init_node("qrc_detect")
    qrc_detect = QRCDetect()
    qrc_detect.start()