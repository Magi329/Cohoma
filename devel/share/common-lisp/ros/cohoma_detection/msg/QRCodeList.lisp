; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-msg)


;//! \htmlinclude QRCodeList.msg.html

(cl:defclass <QRCodeList> (roslisp-msg-protocol:ros-message)
  ((qrc_list
    :reader qrc_list
    :initarg :qrc_list
    :type (cl:vector cohoma_detection-msg:QRCode)
   :initform (cl:make-array 0 :element-type 'cohoma_detection-msg:QRCode :initial-element (cl:make-instance 'cohoma_detection-msg:QRCode))))
)

(cl:defclass QRCodeList (<QRCodeList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QRCodeList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QRCodeList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-msg:<QRCodeList> is deprecated: use cohoma_detection-msg:QRCodeList instead.")))

(cl:ensure-generic-function 'qrc_list-val :lambda-list '(m))
(cl:defmethod qrc_list-val ((m <QRCodeList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-msg:qrc_list-val is deprecated.  Use cohoma_detection-msg:qrc_list instead.")
  (qrc_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QRCodeList>) ostream)
  "Serializes a message object of type '<QRCodeList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'qrc_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'qrc_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QRCodeList>) istream)
  "Deserializes a message object of type '<QRCodeList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'qrc_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'qrc_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cohoma_detection-msg:QRCode))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QRCodeList>)))
  "Returns string type for a message object of type '<QRCodeList>"
  "cohoma_detection/QRCodeList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QRCodeList)))
  "Returns string type for a message object of type 'QRCodeList"
  "cohoma_detection/QRCodeList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QRCodeList>)))
  "Returns md5sum for a message object of type '<QRCodeList>"
  "1c78061eb6384448d766f4bff956a1b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QRCodeList)))
  "Returns md5sum for a message object of type 'QRCodeList"
  "1c78061eb6384448d766f4bff956a1b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QRCodeList>)))
  "Returns full string definition for message of type '<QRCodeList>"
  (cl:format cl:nil "cohoma_detection/QRCode[] qrc_list~%================================================================================~%MSG: cohoma_detection/QRCode~%string raw_value #QR Code raw value~%geographic_msgs/GeoPoint position #Trap position when detected~%string nature     #Information about the trap signifacation in the real context~%uint16 id         #Identificator of the trap~%uint8 ngz_radius  #No Go Zone Radius around the trap~%bool dsb_status   #The trap can be disabled or not~%string dsb_code   #Code to transmit to disable the trap~%bool contact_dsb  #The trap should be disabled by contact or not~%string dsb_vector #Type of drone that can disable the trap~%string other      #Diverse complementary (miscellaneous) informations~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QRCodeList)))
  "Returns full string definition for message of type 'QRCodeList"
  (cl:format cl:nil "cohoma_detection/QRCode[] qrc_list~%================================================================================~%MSG: cohoma_detection/QRCode~%string raw_value #QR Code raw value~%geographic_msgs/GeoPoint position #Trap position when detected~%string nature     #Information about the trap signifacation in the real context~%uint16 id         #Identificator of the trap~%uint8 ngz_radius  #No Go Zone Radius around the trap~%bool dsb_status   #The trap can be disabled or not~%string dsb_code   #Code to transmit to disable the trap~%bool contact_dsb  #The trap should be disabled by contact or not~%string dsb_vector #Type of drone that can disable the trap~%string other      #Diverse complementary (miscellaneous) informations~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QRCodeList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'qrc_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QRCodeList>))
  "Converts a ROS message object to a list"
  (cl:list 'QRCodeList
    (cl:cons ':qrc_list (qrc_list msg))
))
