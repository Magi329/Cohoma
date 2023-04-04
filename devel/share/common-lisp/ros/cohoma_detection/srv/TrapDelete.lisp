; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-srv)


;//! \htmlinclude TrapDelete-request.msg.html

(cl:defclass <TrapDelete-request> (roslisp-msg-protocol:ros-message)
  ((delete_index
    :reader delete_index
    :initarg :delete_index
    :type cl:fixnum
    :initform 0))
)

(cl:defclass TrapDelete-request (<TrapDelete-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrapDelete-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrapDelete-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<TrapDelete-request> is deprecated: use cohoma_detection-srv:TrapDelete-request instead.")))

(cl:ensure-generic-function 'delete_index-val :lambda-list '(m))
(cl:defmethod delete_index-val ((m <TrapDelete-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:delete_index-val is deprecated.  Use cohoma_detection-srv:delete_index instead.")
  (delete_index m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrapDelete-request>) ostream)
  "Serializes a message object of type '<TrapDelete-request>"
  (cl:let* ((signed (cl:slot-value msg 'delete_index)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrapDelete-request>) istream)
  "Deserializes a message object of type '<TrapDelete-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'delete_index) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrapDelete-request>)))
  "Returns string type for a service object of type '<TrapDelete-request>"
  "cohoma_detection/TrapDeleteRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDelete-request)))
  "Returns string type for a service object of type 'TrapDelete-request"
  "cohoma_detection/TrapDeleteRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrapDelete-request>)))
  "Returns md5sum for a message object of type '<TrapDelete-request>"
  "9dd0896216c2e4f68d45b72eb2896fe8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrapDelete-request)))
  "Returns md5sum for a message object of type 'TrapDelete-request"
  "9dd0896216c2e4f68d45b72eb2896fe8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrapDelete-request>)))
  "Returns full string definition for message of type '<TrapDelete-request>"
  (cl:format cl:nil "int8 delete_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrapDelete-request)))
  "Returns full string definition for message of type 'TrapDelete-request"
  (cl:format cl:nil "int8 delete_index~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrapDelete-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrapDelete-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TrapDelete-request
    (cl:cons ':delete_index (delete_index msg))
))
;//! \htmlinclude TrapDelete-response.msg.html

(cl:defclass <TrapDelete-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TrapDelete-response (<TrapDelete-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TrapDelete-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TrapDelete-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<TrapDelete-response> is deprecated: use cohoma_detection-srv:TrapDelete-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <TrapDelete-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:success-val is deprecated.  Use cohoma_detection-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TrapDelete-response>) ostream)
  "Serializes a message object of type '<TrapDelete-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TrapDelete-response>) istream)
  "Deserializes a message object of type '<TrapDelete-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TrapDelete-response>)))
  "Returns string type for a service object of type '<TrapDelete-response>"
  "cohoma_detection/TrapDeleteResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDelete-response)))
  "Returns string type for a service object of type 'TrapDelete-response"
  "cohoma_detection/TrapDeleteResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TrapDelete-response>)))
  "Returns md5sum for a message object of type '<TrapDelete-response>"
  "9dd0896216c2e4f68d45b72eb2896fe8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TrapDelete-response)))
  "Returns md5sum for a message object of type 'TrapDelete-response"
  "9dd0896216c2e4f68d45b72eb2896fe8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TrapDelete-response>)))
  "Returns full string definition for message of type '<TrapDelete-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TrapDelete-response)))
  "Returns full string definition for message of type 'TrapDelete-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TrapDelete-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TrapDelete-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TrapDelete-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TrapDelete)))
  'TrapDelete-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TrapDelete)))
  'TrapDelete-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TrapDelete)))
  "Returns string type for a service object of type '<TrapDelete>"
  "cohoma_detection/TrapDelete")