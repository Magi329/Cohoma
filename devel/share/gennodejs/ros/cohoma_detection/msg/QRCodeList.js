// Auto-generated. Do not edit!

// (in-package cohoma_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let QRCode = require('./QRCode.js');

//-----------------------------------------------------------

class QRCodeList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.qrc_list = null;
    }
    else {
      if (initObj.hasOwnProperty('qrc_list')) {
        this.qrc_list = initObj.qrc_list
      }
      else {
        this.qrc_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QRCodeList
    // Serialize message field [qrc_list]
    // Serialize the length for message field [qrc_list]
    bufferOffset = _serializer.uint32(obj.qrc_list.length, buffer, bufferOffset);
    obj.qrc_list.forEach((val) => {
      bufferOffset = QRCode.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QRCodeList
    let len;
    let data = new QRCodeList(null);
    // Deserialize message field [qrc_list]
    // Deserialize array length for message field [qrc_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.qrc_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.qrc_list[i] = QRCode.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.qrc_list.forEach((val) => {
      length += QRCode.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cohoma_detection/QRCodeList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1c78061eb6384448d766f4bff956a1b9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    cohoma_detection/QRCode[] qrc_list
    ================================================================================
    MSG: cohoma_detection/QRCode
    string raw_value #QR Code raw value
    geographic_msgs/GeoPoint position #Trap position when detected
    string nature     #Information about the trap signifacation in the real context
    uint16 id         #Identificator of the trap
    uint8 ngz_radius  #No Go Zone Radius around the trap
    bool dsb_status   #The trap can be disabled or not
    string dsb_code   #Code to transmit to disable the trap
    bool contact_dsb  #The trap should be disabled by contact or not
    string dsb_vector #Type of drone that can disable the trap
    string other      #Diverse complementary (miscellaneous) informations
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
    const resolved = new QRCodeList(null);
    if (msg.qrc_list !== undefined) {
      resolved.qrc_list = new Array(msg.qrc_list.length);
      for (let i = 0; i < resolved.qrc_list.length; ++i) {
        resolved.qrc_list[i] = QRCode.Resolve(msg.qrc_list[i]);
      }
    }
    else {
      resolved.qrc_list = []
    }

    return resolved;
    }
};

module.exports = QRCodeList;
