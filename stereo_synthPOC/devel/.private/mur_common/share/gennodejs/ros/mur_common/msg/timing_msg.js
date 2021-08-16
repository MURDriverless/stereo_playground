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

class timing_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.compute_time = null;
      this.full_compute_time = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('compute_time')) {
        this.compute_time = initObj.compute_time
      }
      else {
        this.compute_time = 0.0;
      }
      if (initObj.hasOwnProperty('full_compute_time')) {
        this.full_compute_time = initObj.full_compute_time
      }
      else {
        this.full_compute_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type timing_msg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [compute_time]
    bufferOffset = _serializer.float32(obj.compute_time, buffer, bufferOffset);
    // Serialize message field [full_compute_time]
    bufferOffset = _serializer.float32(obj.full_compute_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type timing_msg
    let len;
    let data = new timing_msg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [compute_time]
    data.compute_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [full_compute_time]
    data.full_compute_time = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'mur_common/timing_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '17ddf4cbaf34e8ded16e85be9c287e6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new timing_msg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.compute_time !== undefined) {
      resolved.compute_time = msg.compute_time;
    }
    else {
      resolved.compute_time = 0.0
    }

    if (msg.full_compute_time !== undefined) {
      resolved.full_compute_time = msg.full_compute_time;
    }
    else {
      resolved.full_compute_time = 0.0
    }

    return resolved;
    }
};

module.exports = timing_msg;
