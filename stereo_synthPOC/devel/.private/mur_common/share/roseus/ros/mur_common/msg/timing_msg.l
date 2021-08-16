;; Auto-generated. Do not edit!


(when (boundp 'mur_common::timing_msg)
  (if (not (find-package "MUR_COMMON"))
    (make-package "MUR_COMMON"))
  (shadow 'timing_msg (find-package "MUR_COMMON")))
(unless (find-package "MUR_COMMON::TIMING_MSG")
  (make-package "MUR_COMMON::TIMING_MSG"))

(in-package "ROS")
;;//! \htmlinclude timing_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mur_common::timing_msg
  :super ros::object
  :slots (_header _compute_time _full_compute_time ))

(defmethod mur_common::timing_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:compute_time __compute_time) 0.0)
    ((:full_compute_time __full_compute_time) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _compute_time (float __compute_time))
   (setq _full_compute_time (float __full_compute_time))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:compute_time
   (&optional __compute_time)
   (if __compute_time (setq _compute_time __compute_time)) _compute_time)
  (:full_compute_time
   (&optional __full_compute_time)
   (if __full_compute_time (setq _full_compute_time __full_compute_time)) _full_compute_time)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _compute_time
    4
    ;; float32 _full_compute_time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _compute_time
       (sys::poke _compute_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _full_compute_time
       (sys::poke _full_compute_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _compute_time
     (setq _compute_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _full_compute_time
     (setq _full_compute_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mur_common::timing_msg :md5sum-) "17ddf4cbaf34e8ded16e85be9c287e6e")
(setf (get mur_common::timing_msg :datatype-) "mur_common/timing_msg")
(setf (get mur_common::timing_msg :definition-)
      "Header header

float32 compute_time # Native code execution time
float32 full_compute_time # Approximate ROS inclusive execution time
# float32 avg_times
# float32 full_avg_times

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



(provide :mur_common/timing_msg "17ddf4cbaf34e8ded16e85be9c287e6e")


