; Auto-generated. Do not edit!


(cl:in-package mur_common-msg)


;//! \htmlinclude diagnostic_msg.msg.html

(cl:defclass <diagnostic_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (compute_times
    :reader compute_times
    :initarg :compute_times
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (full_compute_times
    :reader full_compute_times
    :initarg :full_compute_times
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (avg_times
    :reader avg_times
    :initarg :avg_times
    :type cl:float
    :initform 0.0)
   (full_avg_times
    :reader full_avg_times
    :initarg :full_avg_times
    :type cl:float
    :initform 0.0))
)

(cl:defclass diagnostic_msg (<diagnostic_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <diagnostic_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'diagnostic_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mur_common-msg:<diagnostic_msg> is deprecated: use mur_common-msg:diagnostic_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <diagnostic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:header-val is deprecated.  Use mur_common-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'compute_times-val :lambda-list '(m))
(cl:defmethod compute_times-val ((m <diagnostic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:compute_times-val is deprecated.  Use mur_common-msg:compute_times instead.")
  (compute_times m))

(cl:ensure-generic-function 'full_compute_times-val :lambda-list '(m))
(cl:defmethod full_compute_times-val ((m <diagnostic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:full_compute_times-val is deprecated.  Use mur_common-msg:full_compute_times instead.")
  (full_compute_times m))

(cl:ensure-generic-function 'avg_times-val :lambda-list '(m))
(cl:defmethod avg_times-val ((m <diagnostic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:avg_times-val is deprecated.  Use mur_common-msg:avg_times instead.")
  (avg_times m))

(cl:ensure-generic-function 'full_avg_times-val :lambda-list '(m))
(cl:defmethod full_avg_times-val ((m <diagnostic_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:full_avg_times-val is deprecated.  Use mur_common-msg:full_avg_times instead.")
  (full_avg_times m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <diagnostic_msg>) ostream)
  "Serializes a message object of type '<diagnostic_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'compute_times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'compute_times))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'full_compute_times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'full_compute_times))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'avg_times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'full_avg_times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <diagnostic_msg>) istream)
  "Deserializes a message object of type '<diagnostic_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'compute_times) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'compute_times)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'full_compute_times) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'full_compute_times)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'avg_times) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'full_avg_times) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<diagnostic_msg>)))
  "Returns string type for a message object of type '<diagnostic_msg>"
  "mur_common/diagnostic_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'diagnostic_msg)))
  "Returns string type for a message object of type 'diagnostic_msg"
  "mur_common/diagnostic_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<diagnostic_msg>)))
  "Returns md5sum for a message object of type '<diagnostic_msg>"
  "86dfa5aa3426c366054b57ad074c89ef")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'diagnostic_msg)))
  "Returns md5sum for a message object of type 'diagnostic_msg"
  "86dfa5aa3426c366054b57ad074c89ef")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<diagnostic_msg>)))
  "Returns full string definition for message of type '<diagnostic_msg>"
  (cl:format cl:nil "Header header~%~%uint32[] compute_times # Native code execution time~%uint32[] full_compute_times # Approximate ROS inclusive execution time~%float32 avg_times~%float32 full_avg_times~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'diagnostic_msg)))
  "Returns full string definition for message of type 'diagnostic_msg"
  (cl:format cl:nil "Header header~%~%uint32[] compute_times # Native code execution time~%uint32[] full_compute_times # Approximate ROS inclusive execution time~%float32 avg_times~%float32 full_avg_times~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <diagnostic_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'compute_times) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'full_compute_times) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <diagnostic_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'diagnostic_msg
    (cl:cons ':header (header msg))
    (cl:cons ':compute_times (compute_times msg))
    (cl:cons ':full_compute_times (full_compute_times msg))
    (cl:cons ':avg_times (avg_times msg))
    (cl:cons ':full_avg_times (full_avg_times msg))
))
