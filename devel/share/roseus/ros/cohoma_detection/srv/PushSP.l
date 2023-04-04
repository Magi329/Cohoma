;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::PushSP)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'PushSP (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::PUSHSP")
  (make-package "COHOMA_DETECTION::PUSHSP"))
(unless (find-package "COHOMA_DETECTION::PUSHSPREQUEST")
  (make-package "COHOMA_DETECTION::PUSHSPREQUEST"))
(unless (find-package "COHOMA_DETECTION::PUSHSPRESPONSE")
  (make-package "COHOMA_DETECTION::PUSHSPRESPONSE"))

(in-package "ROS")





(defclass cohoma_detection::PushSPRequest
  :super ros::object
  :slots (_strat_point ))

(defmethod cohoma_detection::PushSPRequest
  (:init
   (&key
    ((:strat_point __strat_point) (instance cohoma_detection::StrategicPoint :init))
    )
   (send-super :init)
   (setq _strat_point __strat_point)
   self)
  (:strat_point
   (&rest __strat_point)
   (if (keywordp (car __strat_point))
       (send* _strat_point __strat_point)
     (progn
       (if __strat_point (setq _strat_point (car __strat_point)))
       _strat_point)))
  (:serialization-length
   ()
   (+
    ;; cohoma_detection/StrategicPoint _strat_point
    (send _strat_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; cohoma_detection/StrategicPoint _strat_point
       (send _strat_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; cohoma_detection/StrategicPoint _strat_point
     (send _strat_point :deserialize buf ptr-) (incf ptr- (send _strat_point :serialization-length))
   ;;
   self)
  )

(defclass cohoma_detection::PushSPResponse
  :super ros::object
  :slots (_success ))

(defmethod cohoma_detection::PushSPResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cohoma_detection::PushSP
  :super ros::object
  :slots ())

(setf (get cohoma_detection::PushSP :md5sum-) "1cd191d0f737bee9234bff8f00139f4f")
(setf (get cohoma_detection::PushSP :datatype-) "cohoma_detection/PushSP")
(setf (get cohoma_detection::PushSP :request) cohoma_detection::PushSPRequest)
(setf (get cohoma_detection::PushSP :response) cohoma_detection::PushSPResponse)

(defmethod cohoma_detection::PushSPRequest
  (:response () (instance cohoma_detection::PushSPResponse :init)))

(setf (get cohoma_detection::PushSPRequest :md5sum-) "1cd191d0f737bee9234bff8f00139f4f")
(setf (get cohoma_detection::PushSPRequest :datatype-) "cohoma_detection/PushSPRequest")
(setf (get cohoma_detection::PushSPRequest :definition-)
      "cohoma_detection/StrategicPoint strat_point

================================================================================
MSG: cohoma_detection/StrategicPoint
uint8 UNKNOWN=0
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
---
bool success
")

(setf (get cohoma_detection::PushSPResponse :md5sum-) "1cd191d0f737bee9234bff8f00139f4f")
(setf (get cohoma_detection::PushSPResponse :datatype-) "cohoma_detection/PushSPResponse")
(setf (get cohoma_detection::PushSPResponse :definition-)
      "cohoma_detection/StrategicPoint strat_point

================================================================================
MSG: cohoma_detection/StrategicPoint
uint8 UNKNOWN=0
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
---
bool success
")



(provide :cohoma_detection/PushSP "1cd191d0f737bee9234bff8f00139f4f")


