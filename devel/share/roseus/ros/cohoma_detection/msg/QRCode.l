;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::QRCode)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'QRCode (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::QRCODE")
  (make-package "COHOMA_DETECTION::QRCODE"))

(in-package "ROS")
;;//! \htmlinclude QRCode.msg.html
(if (not (find-package "GEOGRAPHIC_MSGS"))
  (ros::roseus-add-msgs "geographic_msgs"))


(defclass cohoma_detection::QRCode
  :super ros::object
  :slots (_raw_value _position _nature _id _ngz_radius _dsb_status _dsb_code _contact_dsb _dsb_vector _other ))

(defmethod cohoma_detection::QRCode
  (:init
   (&key
    ((:raw_value __raw_value) "")
    ((:position __position) (instance geographic_msgs::GeoPoint :init))
    ((:nature __nature) "")
    ((:id __id) 0)
    ((:ngz_radius __ngz_radius) 0)
    ((:dsb_status __dsb_status) nil)
    ((:dsb_code __dsb_code) "")
    ((:contact_dsb __contact_dsb) nil)
    ((:dsb_vector __dsb_vector) "")
    ((:other __other) "")
    )
   (send-super :init)
   (setq _raw_value (string __raw_value))
   (setq _position __position)
   (setq _nature (string __nature))
   (setq _id (round __id))
   (setq _ngz_radius (round __ngz_radius))
   (setq _dsb_status __dsb_status)
   (setq _dsb_code (string __dsb_code))
   (setq _contact_dsb __contact_dsb)
   (setq _dsb_vector (string __dsb_vector))
   (setq _other (string __other))
   self)
  (:raw_value
   (&optional __raw_value)
   (if __raw_value (setq _raw_value __raw_value)) _raw_value)
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:nature
   (&optional __nature)
   (if __nature (setq _nature __nature)) _nature)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:ngz_radius
   (&optional __ngz_radius)
   (if __ngz_radius (setq _ngz_radius __ngz_radius)) _ngz_radius)
  (:dsb_status
   (&optional (__dsb_status :null))
   (if (not (eq __dsb_status :null)) (setq _dsb_status __dsb_status)) _dsb_status)
  (:dsb_code
   (&optional __dsb_code)
   (if __dsb_code (setq _dsb_code __dsb_code)) _dsb_code)
  (:contact_dsb
   (&optional (__contact_dsb :null))
   (if (not (eq __contact_dsb :null)) (setq _contact_dsb __contact_dsb)) _contact_dsb)
  (:dsb_vector
   (&optional __dsb_vector)
   (if __dsb_vector (setq _dsb_vector __dsb_vector)) _dsb_vector)
  (:other
   (&optional __other)
   (if __other (setq _other __other)) _other)
  (:serialization-length
   ()
   (+
    ;; string _raw_value
    4 (length _raw_value)
    ;; geographic_msgs/GeoPoint _position
    (send _position :serialization-length)
    ;; string _nature
    4 (length _nature)
    ;; uint16 _id
    2
    ;; uint8 _ngz_radius
    1
    ;; bool _dsb_status
    1
    ;; string _dsb_code
    4 (length _dsb_code)
    ;; bool _contact_dsb
    1
    ;; string _dsb_vector
    4 (length _dsb_vector)
    ;; string _other
    4 (length _other)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _raw_value
       (write-long (length _raw_value) s) (princ _raw_value s)
     ;; geographic_msgs/GeoPoint _position
       (send _position :serialize s)
     ;; string _nature
       (write-long (length _nature) s) (princ _nature s)
     ;; uint16 _id
       (write-word _id s)
     ;; uint8 _ngz_radius
       (write-byte _ngz_radius s)
     ;; bool _dsb_status
       (if _dsb_status (write-byte -1 s) (write-byte 0 s))
     ;; string _dsb_code
       (write-long (length _dsb_code) s) (princ _dsb_code s)
     ;; bool _contact_dsb
       (if _contact_dsb (write-byte -1 s) (write-byte 0 s))
     ;; string _dsb_vector
       (write-long (length _dsb_vector) s) (princ _dsb_vector s)
     ;; string _other
       (write-long (length _other) s) (princ _other s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _raw_value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _raw_value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; geographic_msgs/GeoPoint _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; string _nature
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nature (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint16 _id
     (setq _id (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint8 _ngz_radius
     (setq _ngz_radius (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; bool _dsb_status
     (setq _dsb_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _dsb_code
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dsb_code (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _contact_dsb
     (setq _contact_dsb (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _dsb_vector
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _dsb_vector (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _other
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _other (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get cohoma_detection::QRCode :md5sum-) "be24b4a75c8581625be18ca7834eef5f")
(setf (get cohoma_detection::QRCode :datatype-) "cohoma_detection/QRCode")
(setf (get cohoma_detection::QRCode :definition-)
      "string raw_value #QR Code raw value
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



(provide :cohoma_detection/QRCode "be24b4a75c8581625be18ca7834eef5f")


