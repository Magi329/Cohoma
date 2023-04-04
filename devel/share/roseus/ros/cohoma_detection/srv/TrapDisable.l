;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::TrapDisable)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'TrapDisable (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::TRAPDISABLE")
  (make-package "COHOMA_DETECTION::TRAPDISABLE"))
(unless (find-package "COHOMA_DETECTION::TRAPDISABLEREQUEST")
  (make-package "COHOMA_DETECTION::TRAPDISABLEREQUEST"))
(unless (find-package "COHOMA_DETECTION::TRAPDISABLERESPONSE")
  (make-package "COHOMA_DETECTION::TRAPDISABLERESPONSE"))

(in-package "ROS")





(defclass cohoma_detection::TrapDisableRequest
  :super ros::object
  :slots (_disable_index ))

(defmethod cohoma_detection::TrapDisableRequest
  (:init
   (&key
    ((:disable_index __disable_index) 0)
    )
   (send-super :init)
   (setq _disable_index (round __disable_index))
   self)
  (:disable_index
   (&optional __disable_index)
   (if __disable_index (setq _disable_index __disable_index)) _disable_index)
  (:serialization-length
   ()
   (+
    ;; int8 _disable_index
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _disable_index
       (write-byte _disable_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _disable_index
     (setq _disable_index (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _disable_index 127) (setq _disable_index (- _disable_index 256)))
   ;;
   self)
  )

(defclass cohoma_detection::TrapDisableResponse
  :super ros::object
  :slots (_success ))

(defmethod cohoma_detection::TrapDisableResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass cohoma_detection::TrapDisable
  :super ros::object
  :slots ())

(setf (get cohoma_detection::TrapDisable :md5sum-) "6bf05e5158bcedad8548df9e0c97322b")
(setf (get cohoma_detection::TrapDisable :datatype-) "cohoma_detection/TrapDisable")
(setf (get cohoma_detection::TrapDisable :request) cohoma_detection::TrapDisableRequest)
(setf (get cohoma_detection::TrapDisable :response) cohoma_detection::TrapDisableResponse)

(defmethod cohoma_detection::TrapDisableRequest
  (:response () (instance cohoma_detection::TrapDisableResponse :init)))

(setf (get cohoma_detection::TrapDisableRequest :md5sum-) "6bf05e5158bcedad8548df9e0c97322b")
(setf (get cohoma_detection::TrapDisableRequest :datatype-) "cohoma_detection/TrapDisableRequest")
(setf (get cohoma_detection::TrapDisableRequest :definition-)
      "int8 disable_index
---
bool success
")

(setf (get cohoma_detection::TrapDisableResponse :md5sum-) "6bf05e5158bcedad8548df9e0c97322b")
(setf (get cohoma_detection::TrapDisableResponse :datatype-) "cohoma_detection/TrapDisableResponse")
(setf (get cohoma_detection::TrapDisableResponse :definition-)
      "int8 disable_index
---
bool success
")



(provide :cohoma_detection/TrapDisable "6bf05e5158bcedad8548df9e0c97322b")


