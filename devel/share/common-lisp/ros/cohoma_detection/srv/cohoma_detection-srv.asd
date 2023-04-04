
(cl:in-package :asdf)

(defsystem "cohoma_detection-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :cohoma_detection-msg
               :geographic_msgs-msg
               :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "CoordinateTransformation" :depends-on ("_package_CoordinateTransformation"))
    (:file "_package_CoordinateTransformation" :depends-on ("_package"))
    (:file "PushSP" :depends-on ("_package_PushSP"))
    (:file "_package_PushSP" :depends-on ("_package"))
    (:file "TrapDelete" :depends-on ("_package_TrapDelete"))
    (:file "_package_TrapDelete" :depends-on ("_package"))
    (:file "TrapDisable" :depends-on ("_package_TrapDisable"))
    (:file "_package_TrapDisable" :depends-on ("_package"))
  ))