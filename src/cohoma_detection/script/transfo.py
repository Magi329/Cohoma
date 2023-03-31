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


#from cohoma_detection.msg import *

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
"""
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
"""





def transfo(self,img): #lon_drone,lat_drone,x,y,
    # rospy.loginfo('Image received...')
        cv_image = self.br.imgmsg_to_cv2(img, "bgr8")

         # Find barcodes and QR codes
        decodedObjects = pyzbar.decode(cv_image)
        print(decodedObjects)
        """
        for obj in decodedObjects:

            qrc_raw = (obj.data).decode('utf-8')
            # Find the corners of the QR code polygon
            points_camera = np.array([obj.polygon])
            #rospy.loginfo(obj.orientation)
            rospy.loginfo(obj.quality)
        """

def start(self):

        rospy.loginfo("QRC Detect: Start")

        while not rospy.is_shutdown():
            self.loop_rate.sleep()

        rospy.loginfo("QR Detect: End")


img = "~/catkin_ws/src/cohoma_detection/script/media/2.jpg"
transfo(self,img)


