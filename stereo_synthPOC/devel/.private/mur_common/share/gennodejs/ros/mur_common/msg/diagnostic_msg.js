// Auto-generated. Do not edit!

// (in-package mur_common.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class diagnostic_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.compute_times = null;
      this.full_compute_times = null;
      this.avg_times = null;
      this.full_avg_times = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('compute_times')) {
        this.compute_times = initObj.compute_times
      }
      else {
        this.compute_times = [];
      }
      if (initObj.hasOwnProperty('full_compute_times')) {
        this.full_compute_times = initObj.full_compute_times
      }
      else {
        this.full_compute_times = [];
      }
      if (initObj.hasOwnProperty('avg_times')) {
        this.avg_times = initObj.avg_times
      }
      else {
        this.avg_times = 0.0;
      }
      if (initObj.hasOwnProperty('full_avg_times')) {
        this.full_avg_times = initObj.full_avg_times
      }
      else {
        this.full_avg_times = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type diagnostic_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [compute_times]
    bufferOffset = _arraySerializer.uint32(obj.compute_times, buffer, bufferOffset, null);
    // Serialize message field [full_compute_times]
    bufferOffset = _arraySerializer.uint32(obj.full_compute_times, buffer, bufferOffset, null);
    // Serialize message field [avg_times]
    bufferOffset = _serializer.float32(obj.avg_times, buffer, bufferOffset);
    // Serialize message field [full_avg_times]
    bufferOffset = _serializer.float32(obj.full_avg_times, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type diagnostic_msg
    let len;
    let data = new diagnostic_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [compute_times]
    data.compute_times = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [full_compute_times]
    data.full_compute_times = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [avg_times]
    data.avg_times = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [full_avg_times]
    data.full_avg_times = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.compute_times.length;
    length += 4 * object.full_compute_times.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mur_common/diagnostic_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86dfa5aa3426c366054b57ad074c89ef';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new diagnostic_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.compute_times !== undefined) {
      resolved.compute_times = msg.compute_times;
    }
    else {
      resolved.compute_times = []
    }

    if (msg.full_compute_times !== undefined) {
      resolved.full_compute_times = msg.full_compute_times;
    }
    else {
      resolved.full_compute_times = []
    }

    if (msg.avg_times !== undefined) {
      resolved.avg_times = msg.avg_times;
    }
    else {
      resolved.avg_times = 0.0
    }

    if (msg.full_avg_times !== undefined) {
      resolved.full_avg_times = msg.full_avg_times;
    }
    else {
      resolved.full_avg_times = 0.0
    }

    return resolved;
    }
};

module.exports = diagnostic_msg;
