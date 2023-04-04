;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::CoordinateTransformation)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'CoordinateTransformation (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::COORDINATETRANSFORMATION")
  (make-package "COHOMA_DETECTION::COORDINATETRANSFORMATION"))
(unless (find-package "COHOMA_DETECTION::COORDINATETRANSFORMATIONREQUEST")
  (make-package "COHOMA_DETECTION::COORDINATETRANSFORMATIONREQUEST"))
(unless (find-package "COHOMA_DETECTION::COORDINATETRANSFORMATIONRESPONSE")
  (make-package "COHOMA_DETECTION::COORDINATETRANSFORMATIONRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass cohoma_detection::CoordinateTransformationRequest
  :super ros::object
  :slots (_translation _rotation _coor_pixel _gps_drone ))

(defmethod cohoma_detection::CoordinateTransformationRequest
  (:init
   (&key
    ((:translation __translation) (instance geometry_msgs::Vector3 :init))
    ((:rotation __rotation) (instance geometry_msgs::Vector3 :init))
    ((:coor_pixel __coor_pixel) (instance geometry_msgs::Point :init))
    ((:gps_drone __gps_drone) (instance sensor_msgs::NavSatFix :init))
    )
   (send-super :init)
   (setq _translation __translation)
   (setq _rotation __rotation)
   (setq _coor_pixel __coor_pixel)
   (setq _gps_drone __gps_drone)
   self)
  (:translation
   (&rest __translation)
   (if (keywordp (car __translation))
       (send* _translation __translation)
     (progn
       (if __translation (setq _translation (car __translation)))
       _translation)))
  (:rotation
   (&rest __rotation)
   (if (keywordp (car __rotation))
       (send* _rotation __rotation)
     (progn
       (if __rotation (setq _rotation (car __rotation)))
       _rotation)))
  (:coor_pixel
   (&rest __coor_pixel)
   (if (keywordp (car __coor_pixel))
       (send* _coor_pixel __coor_pixel)
     (progn
       (if __coor_pixel (setq _coor_pixel (car __coor_pixel)))
       _coor_pixel)))
  (:gps_drone
   (&rest __gps_drone)
   (if (keywordp (car __gps_drone))
       (send* _gps_drone __gps_drone)
     (progn
       (if __gps_drone (setq _gps_drone (car __gps_drone)))
       _gps_drone)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _translation
    (send _translation :serialization-length)
    ;; geometry_msgs/Vector3 _rotation
    (send _rotation :serialization-length)
    ;; geometry_msgs/Point _coor_pixel
    (send _coor_pixel :serialization-length)
    ;; sensor_msgs/NavSatFix _gps_drone
    (send _gps_drone :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _translation
       (send _translation :serialize s)
     ;; geometry_msgs/Vector3 _rotation
       (send _rotation :serialize s)
     ;; geometry_msgs/Point _coor_pixel
       (send _coor_pixel :serialize s)
     ;; sensor_msgs/NavSatFix _gps_drone
       (send _gps_drone :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _translation
     (send _translation :deserialize buf ptr-) (incf ptr- (send _translation :serialization-length))
   ;; geometry_msgs/Vector3 _rotation
     (send _rotation :deserialize buf ptr-) (incf ptr- (send _rotation :serialization-length))
   ;; geometry_msgs/Point _coor_pixel
     (send _coor_pixel :deserialize buf ptr-) (incf ptr- (send _coor_pixel :serialization-length))
   ;; sensor_msgs/NavSatFix _gps_drone
     (send _gps_drone :deserialize buf ptr-) (incf ptr- (send _gps_drone :serialization-length))
   ;;
   self)
  )

(defclass cohoma_detection::CoordinateTransformationResponse
  :super ros::object
  :slots (_gps_qrcode ))

(defmethod cohoma_detection::CoordinateTransformationResponse
  (:init
   (&key
    ((:gps_qrcode __gps_qrcode) (instance geographic_msgs::GeoPoint :init))
    )
   (send-super :init)
   (setq _gps_qrcode __gps_qrcode)
   self)
  (:gps_qrcode
   (&rest __gps_qrcode)
   (if (keywordp (car __gps_qrcode))
       (send* _gps_qrcode __gps_qrcode)
     (progn
       (if __gps_qrcode (setq _gps_qrcode (car __gps_qrcode)))
       _gps_qrcode)))
  (:serialization-length
   ()
   (+
    ;; geographic_msgs/GeoPoint _gps_qrcode
    (send _gps_qrcode :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geographic_msgs/GeoPoint _gps_qrcode
       (send _gps_qrcode :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geographic_msgs/GeoPoint _gps_qrcode
     (send _gps_qrcode :deserialize buf ptr-) (incf ptr- (send _gps_qrcode :serialization-length))
   ;;
   self)
  )

(defclass cohoma_detection::CoordinateTransformation
  :super ros::object
  :slots ())

(setf (get cohoma_detection::CoordinateTransformation :md5sum-) "3064e8c447201208c1ba42ae35ce3d16")
(setf (get cohoma_detection::CoordinateTransformation :datatype-) "cohoma_detection/CoordinateTransformation")
(setf (get cohoma_detection::CoordinateTransformation :request) cohoma_detection::CoordinateTransformationRequest)
(setf (get cohoma_detection::CoordinateTransformation :response) cohoma_detection::CoordinateTransformationResponse)

(defmethod cohoma_detection::CoordinateTransformationRequest
  (:response () (instance cohoma_detection::CoordinateTransformationResponse :init)))

(setf (get cohoma_detection::CoordinateTransformationRequest :md5sum-) "3064e8c447201208c1ba42ae35ce3d16")
(setf (get cohoma_detection::CoordinateTransformationRequest :datatype-) "cohoma_detection/CoordinateTransformationRequest")
(setf (get cohoma_detection::CoordinateTransformationRequest :definition-)
      "geometry_msgs/Vector3 translation             # entre le repère de la caméra et le repère du monde réel
geometry_msgs/Vector3 rotation
geometry_msgs/Point   coor_pixel             # x et y coordonnées en pixel, on n'utilise pas z
sensor_msgs/NavSatFix gps_drone              # latitude longitude altitude ainsi que status header position_covariance du drone

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: sensor_msgs/NavSatFix
# Navigation Satellite fix for any Global Navigation Satellite System
#
# Specified using the WGS 84 reference ellipsoid

# header.stamp specifies the ROS time for this measurement (the
#        corresponding satellite time may be reported using the
#        sensor_msgs/TimeReference message).
#
# header.frame_id is the frame of reference reported by the satellite
#        receiver, usually the location of the antenna.  This is a
#        Euclidean frame relative to the vehicle, not a reference
#        ellipsoid.
Header header

# satellite fix status information
NavSatStatus status

# Latitude [degrees]. Positive is north of equator; negative is south.
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is west.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid
# (quiet NaN if no altitude is available).
float64 altitude

# Position covariance [m^2] defined relative to a tangential plane
# through the reported position. The components are East, North, and
# Up (ENU), in row-major order.
#
# Beware: this coordinate system exhibits singularities at the poles.

float64[9] position_covariance

# If the covariance of the fix is known, fill it in completely. If the
# GPS receiver provides the variance of each measurement, put them
# along the diagonal. If only Dilution of Precision is available,
# estimate an approximate covariance from that.

uint8 COVARIANCE_TYPE_UNKNOWN = 0
uint8 COVARIANCE_TYPE_APPROXIMATED = 1
uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
uint8 COVARIANCE_TYPE_KNOWN = 3

uint8 position_covariance_type

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
MSG: sensor_msgs/NavSatStatus
# Navigation Satellite fix status for any Global Navigation Satellite System

# Whether to output an augmented fix is determined by both the fix
# type and the last time differential corrections were received.  A
# fix is valid when status >= STATUS_FIX.

int8 STATUS_NO_FIX =  -1        # unable to fix position
int8 STATUS_FIX =      0        # unaugmented fix
int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation

int8 status

# Bits defining which Global Navigation Satellite System signals were
# used by the receiver.

uint16 SERVICE_GPS =     1
uint16 SERVICE_GLONASS = 2
uint16 SERVICE_COMPASS = 4      # includes BeiDou.
uint16 SERVICE_GALILEO = 8

uint16 service
---
geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude

# to modify completely!!!!

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

(setf (get cohoma_detection::CoordinateTransformationResponse :md5sum-) "3064e8c447201208c1ba42ae35ce3d16")
(setf (get cohoma_detection::CoordinateTransformationResponse :datatype-) "cohoma_detection/CoordinateTransformationResponse")
(setf (get cohoma_detection::CoordinateTransformationResponse :definition-)
      "geometry_msgs/Vector3 translation             # entre le repère de la caméra et le repère du monde réel
geometry_msgs/Vector3 rotation
geometry_msgs/Point   coor_pixel             # x et y coordonnées en pixel, on n'utilise pas z
sensor_msgs/NavSatFix gps_drone              # latitude longitude altitude ainsi que status header position_covariance du drone

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: sensor_msgs/NavSatFix
# Navigation Satellite fix for any Global Navigation Satellite System
#
# Specified using the WGS 84 reference ellipsoid

# header.stamp specifies the ROS time for this measurement (the
#        corresponding satellite time may be reported using the
#        sensor_msgs/TimeReference message).
#
# header.frame_id is the frame of reference reported by the satellite
#        receiver, usually the location of the antenna.  This is a
#        Euclidean frame relative to the vehicle, not a reference
#        ellipsoid.
Header header

# satellite fix status information
NavSatStatus status

# Latitude [degrees]. Positive is north of equator; negative is south.
float64 latitude

# Longitude [degrees]. Positive is east of prime meridian; negative is west.
float64 longitude

# Altitude [m]. Positive is above the WGS 84 ellipsoid
# (quiet NaN if no altitude is available).
float64 altitude

# Position covariance [m^2] defined relative to a tangential plane
# through the reported position. The components are East, North, and
# Up (ENU), in row-major order.
#
# Beware: this coordinate system exhibits singularities at the poles.

float64[9] position_covariance

# If the covariance of the fix is known, fill it in completely. If the
# GPS receiver provides the variance of each measurement, put them
# along the diagonal. If only Dilution of Precision is available,
# estimate an approximate covariance from that.

uint8 COVARIANCE_TYPE_UNKNOWN = 0
uint8 COVARIANCE_TYPE_APPROXIMATED = 1
uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
uint8 COVARIANCE_TYPE_KNOWN = 3

uint8 position_covariance_type

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
MSG: sensor_msgs/NavSatStatus
# Navigation Satellite fix status for any Global Navigation Satellite System

# Whether to output an augmented fix is determined by both the fix
# type and the last time differential corrections were received.  A
# fix is valid when status >= STATUS_FIX.

int8 STATUS_NO_FIX =  -1        # unable to fix position
int8 STATUS_FIX =      0        # unaugmented fix
int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation

int8 status

# Bits defining which Global Navigation Satellite System signals were
# used by the receiver.

uint16 SERVICE_GPS =     1
uint16 SERVICE_GLONASS = 2
uint16 SERVICE_COMPASS = 4      # includes BeiDou.
uint16 SERVICE_GALILEO = 8

uint16 service
---
geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude

# to modify completely!!!!

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



(provide :cohoma_detection/CoordinateTransformation "3064e8c447201208c1ba42ae35ce3d16")


