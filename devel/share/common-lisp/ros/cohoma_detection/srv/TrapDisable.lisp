; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-srv)


;//! \htmlinclude TrapDisable-request.msg.html

(cl:defclass <TrapDisable-request> (roslisp-msg-protocol:ros-message)
  ((disable_index
    :reader disable_index
    :initarg :disable_index
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TrapDisable-request (<TrapDisable-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrapDisable-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrapDisable-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<TrapDisable-request> is deprecated: use cohoma_detection-srv:TrapDisable-request instead.")))

(cl:ensure-generic-function 'disable_index-val :lambda-list '(m))
(cl:defmethod disable_index-val ((m <TrapDisable-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:disable_index-val is deprecated.  Use cohoma_detection-srv:disable_index instead.")
  (disable_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrapDisable-request>) ostream)
  "Serializes a message object of type '<TrapDisable-request>"
  (cl:let* ((signed (cl:slot-value msg 'disable_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrapDisable-request>) istream)
  "Deserializes a message object of type '<TrapDisable-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'disable_index) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrapDisable-request>)))
  "Returns string type for a service object of type '<TrapDisable-request>"
  "cohoma_detection/TrapDisableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDisable-request)))
  "Returns string type for a service object of type 'TrapDisable-request"
  "cohoma_detection/TrapDisableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrapDisable-request>)))
  "Returns md5sum for a message object of type '<TrapDisable-request>"
  "6bf05e5158bcedad8548df9e0c97322b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrapDisable-request)))
  "Returns md5sum for a message object of type 'TrapDisable-request"
  "6bf05e5158bcedad8548df9e0c97322b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrapDisable-request>)))
  "Returns full string definition for message of type '<TrapDisable-request>"
  (cl:format cl:nil "int8 disable_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrapDisable-request)))
  "Returns full string definition for message of type 'TrapDisable-request"
  (cl:format cl:nil "int8 disable_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrapDisable-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrapDisable-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrapDisable-request
    (cl:cons ':disable_index (disable_index msg))
))
;//! \htmlinclude TrapDisable-response.msg.html

(cl:defclass <TrapDisable-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrapDisable-response (<TrapDisable-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrapDisable-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrapDisable-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<TrapDisable-response> is deprecated: use cohoma_detection-srv:TrapDisable-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <TrapDisable-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:success-val is deprecated.  Use cohoma_detection-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrapDisable-response>) ostream)
  "Serializes a message object of type '<TrapDisable-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrapDisable-response>) istream)
  "Deserializes a message object of type '<TrapDisable-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrapDisable-response>)))
  "Returns string type for a service object of type '<TrapDisable-response>"
  "cohoma_detection/TrapDisableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDisable-response)))
  "Returns string type for a service object of type 'TrapDisable-response"
  "cohoma_detection/TrapDisableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrapDisable-response>)))
  "Returns md5sum for a message object of type '<TrapDisable-response>"
  "6bf05e5158bcedad8548df9e0c97322b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrapDisable-response)))
  "Returns md5sum for a message object of type 'TrapDisable-response"
  "6bf05e5158bcedad8548df9e0c97322b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrapDisable-response>)))
  "Returns full string definition for message of type '<TrapDisable-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrapDisable-response)))
  "Returns full string definition for message of type 'TrapDisable-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrapDisable-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrapDisable-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrapDisable-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrapDisable)))
  'TrapDisable-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrapDisable)))
  'TrapDisable-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDisable)))
  "Returns string type for a service object of type '<TrapDisable>"
  "cohoma_detection/TrapDisable")