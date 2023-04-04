; Auto-generated. Do not edit!


(cl:in-package cohoma_detection-srv)


;//! \htmlinclude CoordinateTransformation-request.msg.html

(cl:defclass <CoordinateTransformation-request> (roslisp-msg-protocol:ros-message)
  ((translation
    :reader translation
    :initarg :translation
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (rotation
    :reader rotation
    :initarg :rotation
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (coor_pixel
    :reader coor_pixel
    :initarg :coor_pixel
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (gps_drone
    :reader gps_drone
    :initarg :gps_drone
    :type sensor_msgs-msg:NavSatFix
    :initform (cl:make-instance 'sensor_msgs-msg:NavSatFix)))
)

(cl:defclass CoordinateTransformation-request (<CoordinateTransformation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CoordinateTransformation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CoordinateTransformation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<CoordinateTransformation-request> is deprecated: use cohoma_detection-srv:CoordinateTransformation-request instead.")))

(cl:ensure-generic-function 'translation-val :lambda-list '(m))
(cl:defmethod translation-val ((m <CoordinateTransformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:translation-val is deprecated.  Use cohoma_detection-srv:translation instead.")
  (translation m))

(cl:ensure-generic-function 'rotation-val :lambda-list '(m))
(cl:defmethod rotation-val ((m <CoordinateTransformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:rotation-val is deprecated.  Use cohoma_detection-srv:rotation instead.")
  (rotation m))

(cl:ensure-generic-function 'coor_pixel-val :lambda-list '(m))
(cl:defmethod coor_pixel-val ((m <CoordinateTransformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:coor_pixel-val is deprecated.  Use cohoma_detection-srv:coor_pixel instead.")
  (coor_pixel m))

(cl:ensure-generic-function 'gps_drone-val :lambda-list '(m))
(cl:defmethod gps_drone-val ((m <CoordinateTransformation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:gps_drone-val is deprecated.  Use cohoma_detection-srv:gps_drone instead.")
  (gps_drone m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CoordinateTransformation-request>) ostream)
  "Serializes a message object of type '<CoordinateTransformation-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'translation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rotation) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'coor_pixel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gps_drone) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CoordinateTransformation-request>) istream)
  "Deserializes a message object of type '<CoordinateTransformation-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'translation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rotation) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'coor_pixel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gps_drone) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CoordinateTransformation-request>)))
  "Returns string type for a service object of type '<CoordinateTransformation-request>"
  "cohoma_detection/CoordinateTransformationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CoordinateTransformation-request)))
  "Returns string type for a service object of type 'CoordinateTransformation-request"
  "cohoma_detection/CoordinateTransformationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CoordinateTransformation-request>)))
  "Returns md5sum for a message object of type '<CoordinateTransformation-request>"
  "3064e8c447201208c1ba42ae35ce3d16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CoordinateTransformation-request)))
  "Returns md5sum for a message object of type 'CoordinateTransformation-request"
  "3064e8c447201208c1ba42ae35ce3d16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CoordinateTransformation-request>)))
  "Returns full string definition for message of type '<CoordinateTransformation-request>"
  (cl:format cl:nil "geometry_msgs/Vector3 translation             # entre le repère de la caméra et le repère du monde réel~%geometry_msgs/Vector3 rotation~%geometry_msgs/Point   coor_pixel             # x et y coordonnées en pixel, on n'utilise pas z~%sensor_msgs/NavSatFix gps_drone              # latitude longitude altitude ainsi que status header position_covariance du drone~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: sensor_msgs/NavSatFix~%# Navigation Satellite fix for any Global Navigation Satellite System~%#~%# Specified using the WGS 84 reference ellipsoid~%~%# header.stamp specifies the ROS time for this measurement (the~%#        corresponding satellite time may be reported using the~%#        sensor_msgs/TimeReference message).~%#~%# header.frame_id is the frame of reference reported by the satellite~%#        receiver, usually the location of the antenna.  This is a~%#        Euclidean frame relative to the vehicle, not a reference~%#        ellipsoid.~%Header header~%~%# satellite fix status information~%NavSatStatus status~%~%# Latitude [degrees]. Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is west.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid~%# (quiet NaN if no altitude is available).~%float64 altitude~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%#~%# Beware: this coordinate system exhibits singularities at the poles.~%~%float64[9] position_covariance~%~%# If the covariance of the fix is known, fill it in completely. If the~%# GPS receiver provides the variance of each measurement, put them~%# along the diagonal. If only Dilution of Precision is available,~%# estimate an approximate covariance from that.~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CoordinateTransformation-request)))
  "Returns full string definition for message of type 'CoordinateTransformation-request"
  (cl:format cl:nil "geometry_msgs/Vector3 translation             # entre le repère de la caméra et le repère du monde réel~%geometry_msgs/Vector3 rotation~%geometry_msgs/Point   coor_pixel             # x et y coordonnées en pixel, on n'utilise pas z~%sensor_msgs/NavSatFix gps_drone              # latitude longitude altitude ainsi que status header position_covariance du drone~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: sensor_msgs/NavSatFix~%# Navigation Satellite fix for any Global Navigation Satellite System~%#~%# Specified using the WGS 84 reference ellipsoid~%~%# header.stamp specifies the ROS time for this measurement (the~%#        corresponding satellite time may be reported using the~%#        sensor_msgs/TimeReference message).~%#~%# header.frame_id is the frame of reference reported by the satellite~%#        receiver, usually the location of the antenna.  This is a~%#        Euclidean frame relative to the vehicle, not a reference~%#        ellipsoid.~%Header header~%~%# satellite fix status information~%NavSatStatus status~%~%# Latitude [degrees]. Positive is north of equator; negative is south.~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is west.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid~%# (quiet NaN if no altitude is available).~%float64 altitude~%~%# Position covariance [m^2] defined relative to a tangential plane~%# through the reported position. The components are East, North, and~%# Up (ENU), in row-major order.~%#~%# Beware: this coordinate system exhibits singularities at the poles.~%~%float64[9] position_covariance~%~%# If the covariance of the fix is known, fill it in completely. If the~%# GPS receiver provides the variance of each measurement, put them~%# along the diagonal. If only Dilution of Precision is available,~%# estimate an approximate covariance from that.~%~%uint8 COVARIANCE_TYPE_UNKNOWN = 0~%uint8 COVARIANCE_TYPE_APPROXIMATED = 1~%uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2~%uint8 COVARIANCE_TYPE_KNOWN = 3~%~%uint8 position_covariance_type~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/NavSatStatus~%# Navigation Satellite fix status for any Global Navigation Satellite System~%~%# Whether to output an augmented fix is determined by both the fix~%# type and the last time differential corrections were received.  A~%# fix is valid when status >= STATUS_FIX.~%~%int8 STATUS_NO_FIX =  -1        # unable to fix position~%int8 STATUS_FIX =      0        # unaugmented fix~%int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation~%int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation~%~%int8 status~%~%# Bits defining which Global Navigation Satellite System signals were~%# used by the receiver.~%~%uint16 SERVICE_GPS =     1~%uint16 SERVICE_GLONASS = 2~%uint16 SERVICE_COMPASS = 4      # includes BeiDou.~%uint16 SERVICE_GALILEO = 8~%~%uint16 service~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CoordinateTransformation-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'translation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rotation))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'coor_pixel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gps_drone))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CoordinateTransformation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CoordinateTransformation-request
    (cl:cons ':translation (translation msg))
    (cl:cons ':rotation (rotation msg))
    (cl:cons ':coor_pixel (coor_pixel msg))
    (cl:cons ':gps_drone (gps_drone msg))
))
;//! \htmlinclude CoordinateTransformation-response.msg.html

(cl:defclass <CoordinateTransformation-response> (roslisp-msg-protocol:ros-message)
  ((gps_qrcode
    :reader gps_qrcode
    :initarg :gps_qrcode
    :type geographic_msgs-msg:GeoPoint
    :initform (cl:make-instance 'geographic_msgs-msg:GeoPoint)))
)

(cl:defclass CoordinateTransformation-response (<CoordinateTransformation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CoordinateTransformation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CoordinateTransformation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cohoma_detection-srv:<CoordinateTransformation-response> is deprecated: use cohoma_detection-srv:CoordinateTransformation-response instead.")))

(cl:ensure-generic-function 'gps_qrcode-val :lambda-list '(m))
(cl:defmethod gps_qrcode-val ((m <CoordinateTransformation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cohoma_detection-srv:gps_qrcode-val is deprecated.  Use cohoma_detection-srv:gps_qrcode instead.")
  (gps_qrcode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CoordinateTransformation-response>) ostream)
  "Serializes a message object of type '<CoordinateTransformation-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gps_qrcode) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CoordinateTransformation-response>) istream)
  "Deserializes a message object of type '<CoordinateTransformation-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gps_qrcode) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CoordinateTransformation-response>)))
  "Returns string type for a service object of type '<CoordinateTransformation-response>"
  "cohoma_detection/CoordinateTransformationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CoordinateTransformation-response)))
  "Returns string type for a service object of type 'CoordinateTransformation-response"
  "cohoma_detection/CoordinateTransformationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CoordinateTransformation-response>)))
  "Returns md5sum for a message object of type '<CoordinateTransformation-response>"
  "3064e8c447201208c1ba42ae35ce3d16")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CoordinateTransformation-response)))
  "Returns md5sum for a message object of type 'CoordinateTransformation-response"
  "3064e8c447201208c1ba42ae35ce3d16")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CoordinateTransformation-response>)))
  "Returns full string definition for message of type '<CoordinateTransformation-response>"
  (cl:format cl:nil "geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude~%~%# to modify completely!!!!~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CoordinateTransformation-response)))
  "Returns full string definition for message of type 'CoordinateTransformation-response"
  (cl:format cl:nil "geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude~%~%# to modify completely!!!!~%~%================================================================================~%MSG: geographic_msgs/GeoPoint~%# Geographic point, using the WGS 84 reference ellipsoid.~%~%# Latitude [degrees]. Positive is north of equator; negative is south~%# (-90 <= latitude <= +90).~%float64 latitude~%~%# Longitude [degrees]. Positive is east of prime meridian; negative is~%# west (-180 <= longitude <= +180). At the poles, latitude is -90 or~%# +90, and longitude is irrelevant, but must be in range.~%float64 longitude~%~%# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).~%float64 altitude~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CoordinateTransformation-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gps_qrcode))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CoordinateTransformation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CoordinateTransformation-response
    (cl:cons ':gps_qrcode (gps_qrcode msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CoordinateTransformation)))
  'CoordinateTransformation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CoordinateTransformation)))
  'CoordinateTransformation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CoordinateTransformation)))
  "Returns string type for a service object of type '<CoordinateTransformation>"
  "cohoma_detection/CoordinateTransformation")