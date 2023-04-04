// Auto-generated. Do not edit!

// (in-package cohoma_detection.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let StrategicPoint = require('../msg/StrategicPoint.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PushSPRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.strat_point = null;
    }
    else {
      if (initObj.hasOwnProperty('strat_point')) {
        this.strat_point = initObj.strat_point
      }
      else {
        this.strat_point = new StrategicPoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PushSPRequest
    // Serialize message field [strat_point]
    bufferOffset = StrategicPoint.serialize(obj.strat_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PushSPRequest
    let len;
    let data = new PushSPRequest(null);
    // Deserialize message field [strat_point]
    data.strat_point = StrategicPoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += StrategicPoint.getMessageSize(object.strat_point);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/PushSPRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b8ac723540a01390ab7e2992d92c999e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cohoma_detection/StrategicPoint strat_point
    
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
    const resolved = new PushSPRequest(null);
    if (msg.strat_point !== undefined) {
      resolved.strat_point = StrategicPoint.Resolve(msg.strat_point)
    }
    else {
      resolved.strat_point = new StrategicPoint()
    }

    return resolved;
    }
};

class PushSPResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PushSPResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PushSPResponse
    let len;
    let data = new PushSPResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/PushSPResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PushSPResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PushSPRequest,
  Response: PushSPResponse,
  md5sum() { return '1cd191d0f737bee9234bff8f00139f4f'; },
  datatype() { return 'cohoma_detection/PushSP'; }
};
