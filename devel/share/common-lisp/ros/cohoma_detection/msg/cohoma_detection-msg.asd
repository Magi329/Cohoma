
(cl:in-package :asdf)

(defsystem "cohoma_detection-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geographic_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MissionContext" :depends-on ("_package_MissionContext"))
    (:file "_package_MissionContext" :depends-on ("_package"))
    (:file "QRCode" :depends-on ("_package_QRCode"))
    (:file "_package_QRCode" :depends-on ("_package"))
    (:file "QRCodeList" :depends-on ("_package_QRCodeList"))
    (:file "_package_QRCodeList" :depends-on ("_package"))
    (:file "StrategicPoint" :depends-on ("_package_StrategicPoint"))
    (:file "_package_StrategicPoint" :depends-on ("_package"))
    (:file "gps" :depends-on ("_package_gps"))
    (:file "_package_gps" :depends-on ("_package"))
  ))