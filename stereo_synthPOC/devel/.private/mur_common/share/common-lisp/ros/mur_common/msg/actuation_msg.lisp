; Auto-generated. Do not edit!


(cl:in-package mur_common-msg)


;//! \htmlinclude actuation_msg.msg.html

(cl:defclass <actuation_msg> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (acceleration_threshold
    :reader acceleration_threshold
    :initarg :acceleration_threshold
    :type cl:float
    :initform 0.0)
   (steering
    :reader steering
    :initarg :steering
    :type cl:float
    :initform 0.0))
)

(cl:defclass actuation_msg (<actuation_msg>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <actuation_msg>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'actuation_msg)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mur_common-msg:<actuation_msg> is deprecated: use mur_common-msg:actuation_msg instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <actuation_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:header-val is deprecated.  Use mur_common-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'acceleration_threshold-val :lambda-list '(m))
(cl:defmethod acceleration_threshold-val ((m <actuation_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:acceleration_threshold-val is deprecated.  Use mur_common-msg:acceleration_threshold instead.")
  (acceleration_threshold m))

(cl:ensure-generic-function 'steering-val :lambda-list '(m))
(cl:defmethod steering-val ((m <actuation_msg>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mur_common-msg:steering-val is deprecated.  Use mur_common-msg:steering instead.")
  (steering m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <actuation_msg>) ostream)
  "Serializes a message object of type '<actuation_msg>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'acceleration_threshold))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'steering))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <actuation_msg>) istream)
  "Deserializes a message object of type '<actuation_msg>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'acceleration_threshold) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'steering) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<actuation_msg>)))
  "Returns string type for a message object of type '<actuation_msg>"
  "mur_common/actuation_msg")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'actuation_msg)))
  "Returns string type for a message object of type 'actuation_msg"
  "mur_common/actuation_msg")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<actuation_msg>)))
  "Returns md5sum for a message object of type '<actuation_msg>"
  "99957e1c187e5d8438ff90bc231cd730")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'actuation_msg)))
  "Returns md5sum for a message object of type 'actuation_msg"
  "99957e1c187e5d8438ff90bc231cd730")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<actuation_msg>)))
  "Returns full string definition for message of type '<actuation_msg>"
  (cl:format cl:nil "# Timestamp in case EMC needs it~%Header header~%~%# acceleration_threshold goes from [-1, 1], where ~%# -1 denotes max. braking and 1 denotes max. acceleration. ~%# Anything > 0 is acceleration, while <= 0 should be treated as braking.~%float32 acceleration_threshold~%~%# steering is defined in terms of raw radians value, not threshold.~%float32 steering~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'actuation_msg)))
  "Returns full string definition for message of type 'actuation_msg"
  (cl:format cl:nil "# Timestamp in case EMC needs it~%Header header~%~%# acceleration_threshold goes from [-1, 1], where ~%# -1 denotes max. braking and 1 denotes max. acceleration. ~%# Anything > 0 is acceleration, while <= 0 should be treated as braking.~%float32 acceleration_threshold~%~%# steering is defined in terms of raw radians value, not threshold.~%float32 steering~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <actuation_msg>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <actuation_msg>))
  "Converts a ROS message object to a list"
  (cl:list 'actuation_msg
    (cl:cons ':header (header msg))
    (cl:cons ':acceleration_threshold (acceleration_threshold msg))
    (cl:cons ':steering (steering msg))
))
