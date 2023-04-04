;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::QRCodeList)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'QRCodeList (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::QRCODELIST")
  (make-package "COHOMA_DETECTION::QRCODELIST"))

(in-package "ROS")
;;//! \htmlinclude QRCodeList.msg.html


(defclass cohoma_detection::QRCodeList
  :super ros::object
  :slots (_qrc_list ))

(defmethod cohoma_detection::QRCodeList
  (:init
   (&key
    ((:qrc_list __qrc_list) ())
    )
   (send-super :init)
   (setq _qrc_list __qrc_list)
   self)
  (:qrc_list
   (&rest __qrc_list)
   (if (keywordp (car __qrc_list))
       (send* _qrc_list __qrc_list)
     (progn
       (if __qrc_list (setq _qrc_list (car __qrc_list)))
       _qrc_list)))
  (:serialization-length
   ()
   (+
    ;; cohoma_detection/QRCode[] _qrc_list
    (apply #'+ (send-all _qrc_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; cohoma_detection/QRCode[] _qrc_list
     (write-long (length _qrc_list) s)
     (dolist (elem _qrc_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; cohoma_detection/QRCode[] _qrc_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _qrc_list (let (r) (dotimes (i n) (push (instance cohoma_detection::QRCode :init) r)) r))
     (dolist (elem- _qrc_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get cohoma_detection::QRCodeList :md5sum-) "1c78061eb6384448d766f4bff956a1b9")
(setf (get cohoma_detection::QRCodeList :datatype-) "cohoma_detection/QRCodeList")
(setf (get cohoma_detection::QRCodeList :definition-)
      "cohoma_detection/QRCode[] qrc_list
================================================================================
MSG: cohoma_detection/QRCode
string raw_value #QR Code raw value
geographic_msgs/GeoPoint position #Trap position when detected
string nature     #Information about the trap signifacation in the real context
uint16 id         #Identificator of the trap
uint8 ngz_radius  #No Go Zone Radius around the trap
bool dsb_status   #The trap can be disabled or not
string dsb_code   #Code to transmit to disable the trap
bool contact_dsb  #The trap should be disabled by contact or not
string dsb_vector #Type of drone that can disable the trap
string other      #Diverse complementary (miscellaneous) informations
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



(provide :cohoma_detection/QRCodeList "1c78061eb6384448d766f4bff956a1b9")


