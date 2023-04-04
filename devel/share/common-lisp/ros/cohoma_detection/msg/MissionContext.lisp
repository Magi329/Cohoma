; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-msg)


;//! \htmlinclude MissionContext.msg.html

(cl:defclass <MissionContext> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (context_id
    :reader context_id
    :initarg :context_id
    :type cl:string
    :initform "")
   (strategic_points
    :reader strategic_points
    :initarg :strategic_points
    :type (cl:vector cohoma_detection-msg:StrategicPoint)
   :initform (cl:make-array 0 :element-type 'cohoma_detection-msg:StrategicPoint :initial-element (cl:make-instance 'cohoma_detection-msg:StrategicPoint))))
)

(cl:defclass MissionContext (<MissionContext>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MissionContext>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MissionContext)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-msg:<MissionContext> is deprecated: use cohoma_detection-msg:MissionContext instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MissionContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:header-val is deprecated.  Use cohoma_detection-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'context_id-val :lambda-list '(m))
(cl:defmethod context_id-val ((m <MissionContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:context_id-val is deprecated.  Use cohoma_detection-msg:context_id instead.")
  (context_id m))

(cl:ensure-generic-function 'strategic_points-val :lambda-list '(m))
(cl:defmethod strategic_points-val ((m <MissionContext>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:strategic_points-val is deprecated.  Use cohoma_detection-msg:strategic_points instead.")
  (strategic_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MissionContext>) ostream)
  "Serializes a message object of type '<MissionContext>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'context_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'context_id))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'strategic_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'strategic_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MissionContext>) istream)
  "Deserializes a message object of type '<MissionContext>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'context_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'context_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'strategic_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'strategic_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cohoma_detection-msg:StrategicPoint))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MissionContext>)))
  "Returns string type for a message object of type '<MissionContext>"
  "cohoma_detection/MissionContext")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MissionContext)))
  "Returns string type for a message object of type 'MissionContext"
  "cohoma_detection/MissionContext")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MissionContext>)))
  "Returns md5sum for a message object of type '<MissionContext>"
  "005f1c7be048bfb34caed7a413338cbd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MissionContext)))
  "Returns md5sum for a message object of type 'MissionContext"
  "005f1c7be048bfb34caed7a413338cbd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MissionContext>)))
  "Returns full string definition for message of type '<MissionContext>"
  (cl:format cl:nil "Header header~%string context_id~%cohoma_detection/StrategicPoint[] strategic_points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cohoma_detection/StrategicPoint~%uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MissionContext)))
  "Returns full string definition for message of type 'MissionContext"
  (cl:format cl:nil "Header header~%string context_id~%cohoma_detection/StrategicPoint[] strategic_points~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: cohoma_detection/StrategicPoint~%uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MissionContext>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:length (cl:slot-value msg 'context_id))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'strategic_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MissionContext>))
  "Converts a ROS message object to a list"
  (cl:list 'MissionContext
    (cl:cons ':header (header msg))
    (cl:cons ':context_id (context_id msg))
    (cl:cons ':strategic_points (strategic_points msg))
))
