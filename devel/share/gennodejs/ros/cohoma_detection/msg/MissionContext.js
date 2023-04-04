// Auto-generated. Do not edit!

// (in-package cohoma_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let StrategicPoint = require('./StrategicPoint.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MissionContext {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.context_id = null;
      this.strategic_points = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('context_id')) {
        this.context_id = initObj.context_id
      }
      else {
        this.context_id = '';
      }
      if (initObj.hasOwnProperty('strategic_points')) {
        this.strategic_points = initObj.strategic_points
      }
      else {
        this.strategic_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MissionContext
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [context_id]
    bufferOffset = _serializer.string(obj.context_id, buffer, bufferOffset);
    // Serialize message field [strategic_points]
    // Serialize the length for message field [strategic_points]
    bufferOffset = _serializer.uint32(obj.strategic_points.length, buffer, bufferOffset);
    obj.strategic_points.forEach((val) => {
      bufferOffset = StrategicPoint.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MissionContext
    let len;
    let data = new MissionContext(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [context_id]
    data.context_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [strategic_points]
    // Deserialize array length for message field [strategic_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.strategic_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.strategic_points[i] = StrategicPoint.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.context_id);
    object.strategic_points.forEach((val) => {
      length += StrategicPoint.getMessageSize(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cohoma_detection/MissionContext';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '005f1c7be048bfb34caed7a413338cbd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    string context_id
    cohoma_detection/StrategicPoint[] strategic_points
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
    
    ================================================================================
    MSG: cohoma_detection/StrategicPoint
    uint8 UNKNOWN=0
    uint8 HYBRID=1
    uint8 TERRESTRIAL=2
    uint8 AERIAL=3
    uint8 DEFUSED=0
    uint8 ACTIVE=1
    uint8 UNALTERABLE=2
    string id
    geographic_msgs/GeoPoint position
    uint8 type
    uint8 status
    float32 radius
    string message
    ================================================================================
    MSG: geographic_msgs/GeoPoint
    # Geographic point, using the WGS 84 reference ellipsoid.
    
    # Latitude [degrees]. Positive is north of equator; negative is south
    # (-90 <= latitude <= +90).
    float64 latitude
    
    # Longitude [degrees]. Positive is east of prime meridian; negative is
    # west (-180 <= longitude <= +180). At the poles, latitude is -90 or
    # +90, and longitude is irrelevant, but must be in range.
    float64 longitude
    
    # Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).
    float64 altitude
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MissionContext(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.context_id !== undefined) {
      resolved.context_id = msg.context_id;
    }
    else {
      resolved.context_id = ''
    }

    if (msg.strategic_points !== undefined) {
      resolved.strategic_points = new Array(msg.strategic_points.length);
      for (let i = 0; i < resolved.strategic_points.length; ++i) {
        resolved.strategic_points[i] = StrategicPoint.Resolve(msg.strategic_points[i]);
      }
    }
    else {
      resolved.strategic_points = []
    }

    return resolved;
    }
};

module.exports = MissionContext;
