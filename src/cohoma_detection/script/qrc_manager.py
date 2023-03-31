#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image, NavSatFix
from std_msgs.msg import String
from geographic_msgs.msg import GeoPoint
from cv_bridge import CvBridge


from cohoma_detection.msg import *
from cohoma_detection.srv import *

class qrcList:
    def __init__(self):
        # Params
        self.br = CvBridge()
        self.loop_rate = rospy.Rate(1)

        self.image = None
        self.gps = NavSatFix()

        self.qrc_list = [] #List of different QR code seen
        self.qrc_iteration = [] #Number of iteration the QRC has been seen

        
        self.mission_plan = MissionContext() #Mission plan 
        self.sp_list = [] #List of different Strategic points seen
        self.sp_iteration = [] #Number of iteration the sp has been seen
        
        # Subscribers
        rospy.Subscriber(rospy.get_param('~qrc_topic'), StrategicPoint, self.qrc_cb)
        rospy.Subscriber(rospy.get_param('~poi_topic'), StrategicPoint, self.poi_cb)

        # Publishers
        self.mission_context_pub = rospy.Publisher('mission/mission_context', MissionContext ,queue_size=1, latch= True)

        # Services server
        #deleteTrap_srv = rospy.Service("mission/trap_delete", TrapDelete ,self.handle_delete_trap)
        #disableTrap_srv = rospy.Service("mission/trap_disable", TrapDisable ,self.handle_disable_trap)

        # Services client
        #rospy.wait_for_service("mission/push_sp")
        

    def qrc_cb(self, msg):
        newSP = True
        #Check if the QRC has been seen or not
        for i in range(0,len(self.sp_list)):
            #If the QRCode has already been seen, the GPS pose is update
            if msg.message == self.sp_list[i].message:
                #rospy.loginfo("SP Code already detected, add one to existing")
                #self.sp_list[i].position.latitude  = (self.sp_list[i].position.latitude *self.sp_iteration[i] + msg.position.latitude )/(self.sp_iteration[i]+1)
                #self.sp_list[i].position.longitude = (self.sp_list[i].position.longitude*self.sp_iteration[i] + msg.position.longitude)/(self.sp_iteration[i]+1)
                #self.sp_iteration[i] += 1

                newSP = False

        #If the QRCode has not already been seen, it is add to the list
        if newSP == True:
            #rospy.loginfo("New SP Code detected")

            #Push the new SP to the HMI
            #if self.push_new_wp(msg):
            #rospy.loginfo("yup")
            self.sp_list.append(msg)
            #self.sp_iteration.append(1)

            #Publish on callback only if there is a new QR code
            self.mission_plan.strategic_points = self.sp_list
            self.mission_context_pub.publish(self.mission_plan)
            #else:
            #    rospy.loginfo("nop")

    def poi_cb(self, msg):
            #Add a new dummy strategic point when a red object is detected

            rospy.loginfo("New POI detected")
            #dummy_point = StrategicPoint("-1", msg, 0, 1, 0, "Point d'interet")
            
            #Add the new SP to the HMI
 
            self.sp_list.append(msg)
            #self.sp_iteration.append(1)

            #Publish on callback only if there is a new QR code
            self.mission_plan.strategic_points = self.sp_list
            self.mission_context_pub.publish(self.mission_plan)

    def start(self):

        rospy.loginfo("QRC Manager: Start")

        while not rospy.is_shutdown():
            self.loop_rate.sleep()

        rospy.loginfo("QRC Manager: End")

if __name__ == '__main__':
    rospy.init_node("qrc_manager", anonymous=True)
    qrc_list = qrcList()
    qrc_list.start()