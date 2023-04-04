; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-msg)


;//! \htmlinclude QRCode.msg.html

(cl:defclass <QRCode> (roslisp-msg-protocol:ros-message)
  ((raw_value
    :reader raw_value
    :initarg :raw_value
    :type cl:string
    :initform "")
   (position
    :reader position
    :initarg :position
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint))
   (nature
    :reader nature
    :initarg :nature
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (ngz_radius
    :reader ngz_radius
    :initarg :ngz_radius
    :type cl:fixnum
    :initform 0)
   (dsb_status
    :reader dsb_status
    :initarg :dsb_status
    :type cl:boolean
    :initform cl:nil)
   (dsb_code
    :reader dsb_code
    :initarg :dsb_code
    :type cl:string
    :initform "")
   (contact_dsb
    :reader contact_dsb
    :initarg :contact_dsb
    :type cl:boolean
    :initform cl:nil)
   (dsb_vector
    :reader dsb_vector
    :initarg :dsb_vector
    :type cl:string
    :initform "")
   (other
    :reader other
    :initarg :other
    :type cl:string
    :initform ""))
)

(cl:defclass QRCode (<QRCode>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QRCode>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QRCode)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-msg:<QRCode> is deprecated: use cohoma_detection-msg:QRCode instead.")))

(cl:ensure-generic-function 'raw_value-val :lambda-list '(m))
(cl:defmethod raw_value-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:raw_value-val is deprecated.  Use cohoma_detection-msg:raw_value instead.")
  (raw_value m))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:position-val is deprecated.  Use cohoma_detection-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'nature-val :lambda-list '(m))
(cl:defmethod nature-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:nature-val is deprecated.  Use cohoma_detection-msg:nature instead.")
  (nature m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:id-val is deprecated.  Use cohoma_detection-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'ngz_radius-val :lambda-list '(m))
(cl:defmethod ngz_radius-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:ngz_radius-val is deprecated.  Use cohoma_detection-msg:ngz_radius instead.")
  (ngz_radius m))

(cl:ensure-generic-function 'dsb_status-val :lambda-list '(m))
(cl:defmethod dsb_status-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:dsb_status-val is deprecated.  Use cohoma_detection-msg:dsb_status instead.")
  (dsb_status m))

(cl:ensure-generic-function 'dsb_code-val :lambda-list '(m))
(cl:defmethod dsb_code-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:dsb_code-val is deprecated.  Use cohoma_detection-msg:dsb_code instead.")
  (dsb_code m))

(cl:ensure-generic-function 'contact_dsb-val :lambda-list '(m))
(cl:defmethod contact_dsb-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:contact_dsb-val is deprecated.  Use cohoma_detection-msg:contact_dsb instead.")
  (contact_dsb m))

(cl:ensure-generic-function 'dsb_vector-val :lambda-list '(m))
(cl:defmethod dsb_vector-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:dsb_vector-val is deprecated.  Use cohoma_detection-msg:dsb_vector instead.")
  (dsb_vector m))

(cl:ensure-generic-function 'other-val :lambda-list '(m))
(cl:defmethod other-val ((m <QRCode>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:other-val is deprecated.  Use cohoma_detection-msg:other instead.")
  (other m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QRCode>) ostream)
  "Serializes a message object of type '<QRCode>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'raw_value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'raw_value))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'position) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nature))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nature))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ngz_radius)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'dsb_status) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dsb_code))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dsb_code))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'contact_dsb) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'dsb_vector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'dsb_vector))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'other))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'other))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QRCode>) istream)
  "Deserializes a message object of type '<QRCode>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'raw_value) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'raw_value) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'position) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nature) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nature) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'ngz_radius)) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'dsb_status) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dsb_code) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dsb_code) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'contact_dsb) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'dsb_vector) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'dsb_vector) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'other) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'other) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QRCode>)))
  "Returns string type for a message object of type '<QRCode>"
  "cohoma_detection/QRCode")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QRCode)))
  "Returns string type for a message object of type 'QRCode"
  "cohoma_detection/QRCode")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QRCode>)))
  "Returns md5sum for a message object of type '<QRCode>"
  "be24b4a75c8581625be18ca7834eef5f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QRCode)))
  "Returns md5sum for a message object of type 'QRCode"
  "be24b4a75c8581625be18ca7834eef5f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QRCode>)))
  "Returns full string definition for message of type '<QRCode>"
  (cl:format cl:nil "string raw_value #QR Code raw value~%geographic_msgs/GeoPoint position #Trap position when detected~%string nature     #Information about the trap signifacation in the real context~%uint16 id         #Identificator of the trap~%uint8 ngz_radius  #No Go Zone Radius around the trap~%bool dsb_status   #The trap can be disabled or not~%string dsb_code   #Code to transmit to disable the trap~%bool contact_dsb  #The trap should be disabled by contact or not~%string dsb_vector #Type of drone that can disable the trap~%string other      #Diverse complementary (miscellaneous) informations~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QRCode)))
  "Returns full string definition for message of type 'QRCode"
  (cl:format cl:nil "string raw_value #QR Code raw value~%geographic_msgs/GeoPoint position #Trap position when detected~%string nature     #Information about the trap signifacation in the real context~%uint16 id         #Identificator of the trap~%uint8 ngz_radius  #No Go Zone Radius around the trap~%bool dsb_status   #The trap can be disabled or not~%string dsb_code   #Code to transmit to disable the trap~%bool contact_dsb  #The trap should be disabled by contact or not~%string dsb_vector #Type of drone that can disable the trap~%string other      #Diverse complementary (miscellaneous) informations~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QRCode>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'raw_value))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'position))
     4 (cl:length (cl:slot-value msg 'nature))
     2
     1
     1
     4 (cl:length (cl:slot-value msg 'dsb_code))
     1
     4 (cl:length (cl:slot-value msg 'dsb_vector))
     4 (cl:length (cl:slot-value msg 'other))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QRCode>))
  "Converts a ROS message object to a list"
  (cl:list 'QRCode
    (cl:cons ':raw_value (raw_value msg))
    (cl:cons ':position (position msg))
    (cl:cons ':nature (nature msg))
    (cl:cons ':id (id msg))
    (cl:cons ':ngz_radius (ngz_radius msg))
    (cl:cons ':dsb_status (dsb_status msg))
    (cl:cons ':dsb_code (dsb_code msg))
    (cl:cons ':contact_dsb (contact_dsb msg))
    (cl:cons ':dsb_vector (dsb_vector msg))
    (cl:cons ':other (other msg))
))
