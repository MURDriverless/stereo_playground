;; Auto-generated. Do not edit!


(when (boundp 'mur_common::diagnostic_msg)
  (if (not (find-package "MUR_COMMON"))
    (make-package "MUR_COMMON"))
  (shadow 'diagnostic_msg (find-package "MUR_COMMON")))
(unless (find-package "MUR_COMMON::DIAGNOSTIC_MSG")
  (make-package "MUR_COMMON::DIAGNOSTIC_MSG"))

(in-package "ROS")
;;//! \htmlinclude diagnostic_msg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mur_common::diagnostic_msg
  :super ros::object
  :slots (_header _compute_times _full_compute_times _avg_times _full_avg_times ))

(defmethod mur_common::diagnostic_msg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:compute_times __compute_times) (make-array 0 :initial-element 0 :element-type :integer))
    ((:full_compute_times __full_compute_times) (make-array 0 :initial-element 0 :element-type :integer))
    ((:avg_times __avg_times) 0.0)
    ((:full_avg_times __full_avg_times) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _compute_times __compute_times)
   (setq _full_compute_times __full_compute_times)
   (setq _avg_times (float __avg_times))
   (setq _full_avg_times (float __full_avg_times))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:compute_times
   (&optional __compute_times)
   (if __compute_times (setq _compute_times __compute_times)) _compute_times)
  (:full_compute_times
   (&optional __full_compute_times)
   (if __full_compute_times (setq _full_compute_times __full_compute_times)) _full_compute_times)
  (:avg_times
   (&optional __avg_times)
   (if __avg_times (setq _avg_times __avg_times)) _avg_times)
  (:full_avg_times
   (&optional __full_avg_times)
   (if __full_avg_times (setq _full_avg_times __full_avg_times)) _full_avg_times)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32[] _compute_times
    (* 4    (length _compute_times)) 4
    ;; uint32[] _full_compute_times
    (* 4    (length _full_compute_times)) 4
    ;; float32 _avg_times
    4
    ;; float32 _full_avg_times
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32[] _compute_times
     (write-long (length _compute_times) s)
     (dotimes (i (length _compute_times))
       (write-long (elt _compute_times i) s)
       )
     ;; uint32[] _full_compute_times
     (write-long (length _full_compute_times) s)
     (dotimes (i (length _full_compute_times))
       (write-long (elt _full_compute_times i) s)
       )
     ;; float32 _avg_times
       (sys::poke _avg_times (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _full_avg_times
       (sys::poke _full_avg_times (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32[] _compute_times
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _compute_times (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _compute_times i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; uint32[] _full_compute_times
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _full_compute_times (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _full_compute_times i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float32 _avg_times
     (setq _avg_times (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _full_avg_times
     (setq _full_avg_times (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mur_common::diagnostic_msg :md5sum-) "86dfa5aa3426c366054b57ad074c89ef")
(setf (get mur_common::diagnostic_msg :datatype-) "mur_common/diagnostic_msg")
(setf (get mur_common::diagnostic_msg :definition-)
      "Header header

uint32[] compute_times # Native code execution time
uint32[] full_compute_times # Approximate ROS inclusive execution time
float32 avg_times
float32 full_avg_times

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



(provide :mur_common/diagnostic_msg "86dfa5aa3426c366054b57ad074c89ef")


