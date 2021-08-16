;; Auto-generated. Do not edit!


(when (boundp 'mur_common::actuation_msg)
  (if (not (find-package "MUR_COMMON"))
    (make-package "MUR_COMMON"))
  (shadow 'actuation_msg (find-package "MUR_COMMON")))
(unless (find-package "MUR_COMMON::ACTUATION_MSG")
  (make-package "MUR_COMMON::ACTUATION_MSG"))

(in-package "ROS")
;;//! \htmlinclude actuation_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mur_common::actuation_msg
  :super ros::object
  :slots (_header _acceleration_threshold _steering ))

(defmethod mur_common::actuation_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:acceleration_threshold __acceleration_threshold) 0.0)
    ((:steering __steering) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _acceleration_threshold (float __acceleration_threshold))
   (setq _steering (float __steering))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:acceleration_threshold
   (&optional __acceleration_threshold)
   (if __acceleration_threshold (setq _acceleration_threshold __acceleration_threshold)) _acceleration_threshold)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _acceleration_threshold
    4
    ;; float32 _steering
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _acceleration_threshold
       (sys::poke _acceleration_threshold (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _steering
       (sys::poke _steering (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _acceleration_threshold
     (setq _acceleration_threshold (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _steering
     (setq _steering (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mur_common::actuation_msg :md5sum-) "99957e1c187e5d8438ff90bc231cd730")
(setf (get mur_common::actuation_msg :datatype-) "mur_common/actuation_msg")
(setf (get mur_common::actuation_msg :definition-)
      "# Timestamp in case EMC needs it
Header header

# acceleration_threshold goes from [-1, 1], where 
# -1 denotes max. braking and 1 denotes max. acceleration. 
# Anything > 0 is acceleration, while <= 0 should be treated as braking.
float32 acceleration_threshold

# steering is defined in terms of raw radians value, not threshold.
float32 steering
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

")



(provide :mur_common/actuation_msg "99957e1c187e5d8438ff90bc231cd730")


