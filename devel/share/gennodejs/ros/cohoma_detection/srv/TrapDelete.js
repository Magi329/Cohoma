// Auto-generated. Do not edit!

// (in-package cohoma_detection.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TrapDeleteRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.delete_index = null;
    }
    else {
      if (initObj.hasOwnProperty('delete_index')) {
        this.delete_index = initObj.delete_index
      }
      else {
        this.delete_index = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrapDeleteRequest
    // Serialize message field [delete_index]
    bufferOffset = _serializer.int8(obj.delete_index, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrapDeleteRequest
    let len;
    let data = new TrapDeleteRequest(null);
    // Deserialize message field [delete_index]
    data.delete_index = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/TrapDeleteRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c2365dc8a72132b8e6b7080d7b832d42';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 delete_index
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrapDeleteRequest(null);
    if (msg.delete_index !== undefined) {
      resolved.delete_index = msg.delete_index;
    }
    else {
      resolved.delete_index = 0
    }

    return resolved;
    }
};

class TrapDeleteResponse {
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
    // Serializes a message object of type TrapDeleteResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrapDeleteResponse
    let len;
    let data = new TrapDeleteResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/TrapDeleteResponse';
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
    const resolved = new TrapDeleteResponse(null);
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
  Request: TrapDeleteRequest,
  Response: TrapDeleteResponse,
  md5sum() { return '9dd0896216c2e4f68d45b72eb2896fe8'; },
  datatype() { return 'cohoma_detection/TrapDelete'; }
};
