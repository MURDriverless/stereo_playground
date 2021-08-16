; Auto-generated. Do not edit!


(cl:in-package mur_common-msg)


;//! \htmlinclude timing_msg.msg.html

(cl:defclass <timing_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (compute_time
    :reader compute_time
    :initarg :compute_time
    :type cl:float
    :initform 0.0)
   (full_compute_time
    :reader full_compute_time
    :initarg :full_compute_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass timing_msg (<timing_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <timing_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'timing_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mur_common-msg:<timing_msg> is deprecated: use mur_common-msg:timing_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <timing_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:header-val is deprecated.  Use mur_common-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'compute_time-val :lambda-list '(m))
(cl:defmethod compute_time-val ((m <timing_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:compute_time-val is deprecated.  Use mur_common-msg:compute_time instead.")
  (compute_time m))

(cl:ensure-generic-function 'full_compute_time-val :lambda-list '(m))
(cl:defmethod full_compute_time-val ((m <timing_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:full_compute_time-val is deprecated.  Use mur_common-msg:full_compute_time instead.")
  (full_compute_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <timing_msg>) ostream)
  "Serializes a message object of type '<timing_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'compute_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'full_compute_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <timing_msg>) istream)
  "Deserializes a message object of type '<timing_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'compute_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'full_compute_time) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<timing_msg>)))
  "Returns string type for a message object of type '<timing_msg>"
  "mur_common/timing_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'timing_msg)))
  "Returns string type for a message object of type 'timing_msg"
  "mur_common/timing_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<timing_msg>)))
  "Returns md5sum for a message object of type '<timing_msg>"
  "17ddf4cbaf34e8ded16e85be9c287e6e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'timing_msg)))
  "Returns md5sum for a message object of type 'timing_msg"
  "17ddf4cbaf34e8ded16e85be9c287e6e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<timing_msg>)))
  "Returns full string definition for message of type '<timing_msg>"
  (cl:format cl:nil "Header header~%~%float32 compute_time # Native code execution time~%float32 full_compute_time # Approximate ROS inclusive execution time~%# float32 avg_times~%# float32 full_avg_times~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'timing_msg)))
  "Returns full string definition for message of type 'timing_msg"
  (cl:format cl:nil "Header header~%~%float32 compute_time # Native code execution time~%float32 full_compute_time # Approximate ROS inclusive execution time~%# float32 avg_times~%# float32 full_avg_times~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <timing_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <timing_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'timing_msg
    (cl:cons ':header (header msg))
    (cl:cons ':compute_time (compute_time msg))
    (cl:cons ':full_compute_time (full_compute_time msg))
))
