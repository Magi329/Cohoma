; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-msg)


;//! \htmlinclude StrategicPoint.msg.html

(cl:defclass <StrategicPoint> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0)
   (radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass StrategicPoint (<StrategicPoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StrategicPoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StrategicPoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-msg:<StrategicPoint> is deprecated: use cohoma_detection-msg:StrategicPoint instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:id-val is deprecated.  Use cohoma_detection-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:position-val is deprecated.  Use cohoma_detection-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:type-val is deprecated.  Use cohoma_detection-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:status-val is deprecated.  Use cohoma_detection-msg:status instead.")
  (status m))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:radius-val is deprecated.  Use cohoma_detection-msg:radius instead.")
  (radius m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <StrategicPoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:message-val is deprecated.  Use cohoma_detection-msg:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<StrategicPoint>)))
    "Constants for message type '<StrategicPoint>"
  '((:UNKNOWN . 0)
    (:HYBRID . 1)
    (:TERRESTRIAL . 2)
    (:AERIAL . 3)
    (:DEFUSED . 0)
    (:ACTIVE . 1)
    (:UNALTERABLE . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'StrategicPoint)))
    "Constants for message type 'StrategicPoint"
  '((:UNKNOWN . 0)
    (:HYBRID . 1)
    (:TERRESTRIAL . 2)
    (:AERIAL . 3)
    (:DEFUSED . 0)
    (:ACTIVE . 1)
    (:UNALTERABLE . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StrategicPoint>) ostream)
  "Serializes a message object of type '<StrategicPoint>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StrategicPoint>) istream)
  "Deserializes a message object of type '<StrategicPoint>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StrategicPoint>)))
  "Returns string type for a message object of type '<StrategicPoint>"
  "cohoma_detection/StrategicPoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StrategicPoint)))
  "Returns string type for a message object of type 'StrategicPoint"
  "cohoma_detection/StrategicPoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StrategicPoint>)))
  "Returns md5sum for a message object of type '<StrategicPoint>"
  "3914a8b8468b58e16ddea332d23f34ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StrategicPoint)))
  "Returns md5sum for a message object of type 'StrategicPoint"
  "3914a8b8468b58e16ddea332d23f34ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StrategicPoint>)))
  "Returns full string definition for message of type '<StrategicPoint>"
  (cl:format cl:nil "uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StrategicPoint)))
  "Returns full string definition for message of type 'StrategicPoint"
  (cl:format cl:nil "uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StrategicPoint>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     1
     1
     4
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StrategicPoint>))
  "Converts a ROS message object to a list"
  (cl:list 'StrategicPoint
    (cl:cons ':id (id msg))
    (cl:cons ':position (position msg))
    (cl:cons ':type (type msg))
    (cl:cons ':status (status msg))
    (cl:cons ':radius (radius msg))
    (cl:cons ':message (message msg))
))
