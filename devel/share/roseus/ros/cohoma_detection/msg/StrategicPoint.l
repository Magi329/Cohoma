;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::StrategicPoint)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'StrategicPoint (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::STRATEGICPOINT")
  (make-package "COHOMA_DETECTION::STRATEGICPOINT"))

(in-package "ROS")
;;//! \htmlinclude StrategicPoint.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(intern "*UNKNOWN*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*UNKNOWN* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*UNKNOWN* 0)
(intern "*HYBRID*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*HYBRID* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*HYBRID* 1)
(intern "*TERRESTRIAL*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*TERRESTRIAL* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*TERRESTRIAL* 2)
(intern "*AERIAL*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*AERIAL* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*AERIAL* 3)
(intern "*DEFUSED*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*DEFUSED* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*DEFUSED* 0)
(intern "*ACTIVE*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*ACTIVE* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*ACTIVE* 1)
(intern "*UNALTERABLE*" (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(shadow '*UNALTERABLE* (find-package "COHOMA_DETECTION::STRATEGICPOINT"))
(defconstant cohoma_detection::StrategicPoint::*UNALTERABLE* 2)

(defun cohoma_detection::StrategicPoint-to-symbol (const)
  (cond
        ((= const 0) 'cohoma_detection::StrategicPoint::*UNKNOWN*)
        ((= const 1) 'cohoma_detection::StrategicPoint::*HYBRID*)
        ((= const 2) 'cohoma_detection::StrategicPoint::*TERRESTRIAL*)
        ((= const 3) 'cohoma_detection::StrategicPoint::*AERIAL*)
        ((= const 0) 'cohoma_detection::StrategicPoint::*DEFUSED*)
        ((= const 1) 'cohoma_detection::StrategicPoint::*ACTIVE*)
        ((= const 2) 'cohoma_detection::StrategicPoint::*UNALTERABLE*)
        (t nil)))

(defclass cohoma_detection::StrategicPoint
  :super ros::object
  :slots (_id _position _type _status _radius _message ))

(defmethod cohoma_detection::StrategicPoint
  (:init
   (&key
    ((:id __id) "")
    ((:position __position) (instance geographic_msgs::GeoPoint :init))
    ((:type __type) 0)
    ((:status __status) 0)
    ((:radius __radius) 0.0)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _id (string __id))
   (setq _position __position)
   (setq _type (round __type))
   (setq _status (round __status))
   (setq _radius (float __radius))
   (setq _message (string __message))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; string _id
    4 (length _id)
    ;; geographic_msgs/GeoPoint _position
    (send _position :serialization-length)
    ;; uint8 _type
    1
    ;; uint8 _status
    1
    ;; float32 _radius
    4
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _id
       (write-long (length _id) s) (princ _id s)
     ;; geographic_msgs/GeoPoint _position
       (send _position :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; uint8 _status
       (write-byte _status s)
     ;; float32 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geographic_msgs/GeoPoint _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _radius
     (setq _radius (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get cohoma_detection::StrategicPoint :md5sum-) "3914a8b8468b58e16ddea332d23f34ee")
(setf (get cohoma_detection::StrategicPoint :datatype-) "cohoma_detection/StrategicPoint")
(setf (get cohoma_detection::StrategicPoint :definition-)
      "uint8 UNKNOWN=0
uint8 HYBRID=1
uint8 TERRESTRIAL=2
uint8 AERIAL=3
uint8 DEFUSED=0
uint8 ACTIVE=1
uint8 UNALTERABLE=2
string id
geographic_msgs/GeoPoint position
uint8 type
uint8 status
float32 radius
string message
================================================================================
MSG: geographic_msgs/GeoPoint
# Geographic point, using the WGS 84 reference ellipsoid.

# Latitude [degrees]. Positive is north of equator; negative is south
# (-90 <= latitude <= +90).
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is
# west (-180 <= longitude <= +180). At the poles, latitude is -90 or
# +90, and longitude is irrelevant, but must be in range.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).
float64 altitude

")



(provide :cohoma_detection/StrategicPoint "3914a8b8468b58e16ddea332d23f34ee")


