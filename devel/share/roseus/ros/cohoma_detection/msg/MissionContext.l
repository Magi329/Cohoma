;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::MissionContext)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'MissionContext (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::MISSIONCONTEXT")
  (make-package "COHOMA_DETECTION::MISSIONCONTEXT"))

(in-package "ROS")
;;//! \htmlinclude MissionContext.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass cohoma_detection::MissionContext
  :super ros::object
  :slots (_header _context_id _strategic_points ))

(defmethod cohoma_detection::MissionContext
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:context_id __context_id) "")
    ((:strategic_points __strategic_points) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _context_id (string __context_id))
   (setq _strategic_points __strategic_points)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:context_id
   (&optional __context_id)
   (if __context_id (setq _context_id __context_id)) _context_id)
  (:strategic_points
   (&rest __strategic_points)
   (if (keywordp (car __strategic_points))
       (send* _strategic_points __strategic_points)
     (progn
       (if __strategic_points (setq _strategic_points (car __strategic_points)))
       _strategic_points)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _context_id
    4 (length _context_id)
    ;; cohoma_detection/StrategicPoint[] _strategic_points
    (apply #'+ (send-all _strategic_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _context_id
       (write-long (length _context_id) s) (princ _context_id s)
     ;; cohoma_detection/StrategicPoint[] _strategic_points
     (write-long (length _strategic_points) s)
     (dolist (elem _strategic_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _context_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _context_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; cohoma_detection/StrategicPoint[] _strategic_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _strategic_points (let (r) (dotimes (i n) (push (instance cohoma_detection::StrategicPoint :init) r)) r))
     (dolist (elem- _strategic_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cohoma_detection::MissionContext :md5sum-) "005f1c7be048bfb34caed7a413338cbd")
(setf (get cohoma_detection::MissionContext :datatype-) "cohoma_detection/MissionContext")
(setf (get cohoma_detection::MissionContext :definition-)
      "Header header
string context_id
cohoma_detection/StrategicPoint[] strategic_points
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

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

")



(provide :cohoma_detection/MissionContext "005f1c7be048bfb34caed7a413338cbd")


