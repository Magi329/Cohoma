;; Auto-generated. Do not edit!


(when (boundp 'cohoma_detection::TrapDelete)
  (if (not (find-package "COHOMA_DETECTION"))
    (make-package "COHOMA_DETECTION"))
  (shadow 'TrapDelete (find-package "COHOMA_DETECTION")))
(unless (find-package "COHOMA_DETECTION::TRAPDELETE")
  (make-package "COHOMA_DETECTION::TRAPDELETE"))
(unless (find-package "COHOMA_DETECTION::TRAPDELETEREQUEST")
  (make-package "COHOMA_DETECTION::TRAPDELETEREQUEST"))
(unless (find-package "COHOMA_DETECTION::TRAPDELETERESPONSE")
  (make-package "COHOMA_DETECTION::TRAPDELETERESPONSE"))

(in-package "ROS")





(defclass cohoma_detection::TrapDeleteRequest
  :super ros::object
  :slots (_delete_index ))

(defmethod cohoma_detection::TrapDeleteRequest
  (:init
   (&key
    ((:delete_index __delete_index) 0)
    )
   (send-super :init)
   (setq _delete_index (round __delete_index))
   self)
  (:delete_index
   (&optional __delete_index)
   (if __delete_index (setq _delete_index __delete_index)) _delete_index)
  (:serialization-length
   ()
   (+
    ;; int8 _delete_index
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _delete_index
       (write-byte _delete_index s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _delete_index
     (setq _delete_index (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _delete_index 127) (setq _delete_index (- _delete_index 256)))
   ;;
   self)
  )

(defclass cohoma_detection::TrapDeleteResponse
  :super ros::object
  :slots (_success ))

(defmethod cohoma_detection::TrapDeleteResponse
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

(defclass cohoma_detection::TrapDelete
  :super ros::object
  :slots ())

(setf (get cohoma_detection::TrapDelete :md5sum-) "9dd0896216c2e4f68d45b72eb2896fe8")
(setf (get cohoma_detection::TrapDelete :datatype-) "cohoma_detection/TrapDelete")
(setf (get cohoma_detection::TrapDelete :request) cohoma_detection::TrapDeleteRequest)
(setf (get cohoma_detection::TrapDelete :response) cohoma_detection::TrapDeleteResponse)

(defmethod cohoma_detection::TrapDeleteRequest
  (:response () (instance cohoma_detection::TrapDeleteResponse :init)))

(setf (get cohoma_detection::TrapDeleteRequest :md5sum-) "9dd0896216c2e4f68d45b72eb2896fe8")
(setf (get cohoma_detection::TrapDeleteRequest :datatype-) "cohoma_detection/TrapDeleteRequest")
(setf (get cohoma_detection::TrapDeleteRequest :definition-)
      "int8 delete_index
---
bool success
")

(setf (get cohoma_detection::TrapDeleteResponse :md5sum-) "9dd0896216c2e4f68d45b72eb2896fe8")
(setf (get cohoma_detection::TrapDeleteResponse :datatype-) "cohoma_detection/TrapDeleteResponse")
(setf (get cohoma_detection::TrapDeleteResponse :definition-)
      "int8 delete_index
---
bool success
")



(provide :cohoma_detection/TrapDelete "9dd0896216c2e4f68d45b72eb2896fe8")


