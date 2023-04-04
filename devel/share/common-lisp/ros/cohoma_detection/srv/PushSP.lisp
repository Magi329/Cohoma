; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-srv)


;//! \htmlinclude PushSP-request.msg.html

(cl:defclass <PushSP-request> (roslisp-msg-protocol:ros-message)
  ((strat_point
    :reader strat_point
    :initarg :strat_point
    :type cohoma_detection-msg:StrategicPoint
    :initform (cl:make-instance 'cohoma_detection-msg:StrategicPoint)))
)

(cl:defclass PushSP-request (<PushSP-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PushSP-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PushSP-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<PushSP-request> is deprecated: use cohoma_detection-srv:PushSP-request instead.")))

(cl:ensure-generic-function 'strat_point-val :lambda-list '(m))
(cl:defmethod strat_point-val ((m <PushSP-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:strat_point-val is deprecated.  Use cohoma_detection-srv:strat_point instead.")
  (strat_point m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PushSP-request>) ostream)
  "Serializes a message object of type '<PushSP-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'strat_point) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PushSP-request>) istream)
  "Deserializes a message object of type '<PushSP-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'strat_point) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PushSP-request>)))
  "Returns string type for a service object of type '<PushSP-request>"
  "cohoma_detection/PushSPRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushSP-request)))
  "Returns string type for a service object of type 'PushSP-request"
  "cohoma_detection/PushSPRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PushSP-request>)))
  "Returns md5sum for a message object of type '<PushSP-request>"
  "1cd191d0f737bee9234bff8f00139f4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PushSP-request)))
  "Returns md5sum for a message object of type 'PushSP-request"
  "1cd191d0f737bee9234bff8f00139f4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PushSP-request>)))
  "Returns full string definition for message of type '<PushSP-request>"
  (cl:format cl:nil "cohoma_detection/StrategicPoint strat_point~%~%================================================================================~%MSG: cohoma_detection/StrategicPoint~%uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PushSP-request)))
  "Returns full string definition for message of type 'PushSP-request"
  (cl:format cl:nil "cohoma_detection/StrategicPoint strat_point~%~%================================================================================~%MSG: cohoma_detection/StrategicPoint~%uint8 UNKNOWN=0~%uint8 HYBRID=1~%uint8 TERRESTRIAL=2~%uint8 AERIAL=3~%uint8 DEFUSED=0~%uint8 ACTIVE=1~%uint8 UNALTERABLE=2~%string id~%geographic_msgs/GeoPoint position~%uint8 type~%uint8 status~%float32 radius~%string message~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PushSP-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'strat_point))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PushSP-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PushSP-request
    (cl:cons ':strat_point (strat_point msg))
))
;//! \htmlinclude PushSP-response.msg.html

(cl:defclass <PushSP-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PushSP-response (<PushSP-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PushSP-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PushSP-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<PushSP-response> is deprecated: use cohoma_detection-srv:PushSP-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PushSP-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:success-val is deprecated.  Use cohoma_detection-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PushSP-response>) ostream)
  "Serializes a message object of type '<PushSP-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PushSP-response>) istream)
  "Deserializes a message object of type '<PushSP-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PushSP-response>)))
  "Returns string type for a service object of type '<PushSP-response>"
  "cohoma_detection/PushSPResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushSP-response)))
  "Returns string type for a service object of type 'PushSP-response"
  "cohoma_detection/PushSPResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PushSP-response>)))
  "Returns md5sum for a message object of type '<PushSP-response>"
  "1cd191d0f737bee9234bff8f00139f4f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PushSP-response)))
  "Returns md5sum for a message object of type 'PushSP-response"
  "1cd191d0f737bee9234bff8f00139f4f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PushSP-response>)))
  "Returns full string definition for message of type '<PushSP-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PushSP-response)))
  "Returns full string definition for message of type 'PushSP-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PushSP-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PushSP-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PushSP-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PushSP)))
  'PushSP-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PushSP)))
  'PushSP-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PushSP)))
  "Returns string type for a service object of type '<PushSP>"
  "cohoma_detection/PushSP")