#! /usr/bin/env python3
# license removed for brevity
from argparse import Namespace
from email.policy import default
from unittest import case
import rospy
import cv2 as cv
from sensor_msgs.msg import Image, NavSatFix
from std_msgs.msg import Bool
from cv_bridge import CvBridge
import random

# define a video capture object
### vid = cv.VideoCapture(0)
    
def imagePub():
    rospy.init_node('image_pub', anonymous=True)
    br = CvBridge()
    rate = rospy.Rate(10) #hz

    pub_img = rospy.Publisher('image', Image, queue_size=10)
    pub_gps = rospy.Publisher('gps', NavSatFix, queue_size=10)
    pub_sat = rospy.Publisher('sat', Bool, queue_size=10)

    gps = NavSatFix()
    
    latitude = 48.711254
    longitude = 2.217728

    while not rospy.is_shutdown():
        
        rand = 1 #random.randint(1, 2)
        if rand == 1:
            path_qr =    '/home/chen/cohoma_ws/src/cohoma_detection/script/media/1.jpg'
            lat = 48.715
            long = 2.211
        elif rand == 2:
            path_qr =    '/home/chen/cohoma_ws/src/cohoma_detection/script/media/2.jpg'
            lat = 48.711
            long = 2.215
        else :
            path_qr =    '/home/chen/cohoma_ws/src/cohoma_detection/script/media/none.jpg'
        
        img_color = cv.imread(path_qr,cv.IMREAD_COLOR)
        
        

        ###ret, img_color = vid.read()

        #img_color = cv.flip(img_color, 1)


        gps.latitude = latitude +random.uniform(0,5e-10) 
        gps.longitude = longitude +random.uniform(0,5e-10) 

        pub_img.publish(br.cv2_to_imgmsg(img_color, "bgr8"))
        pub_gps.publish(gps)
        pub_sat.publish(True)

        rate.sleep()

    # After the loop release the cap object
    ### vid.release()

if __name__ == '__main__':
    try:
        imagePub()
    except rospy.ROSInterruptException:
        pass