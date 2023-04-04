// Auto-generated. Do not edit!

// (in-package cohoma_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class QRCode {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.raw_value = null;
      this.position = null;
      this.nature = null;
      this.id = null;
      this.ngz_radius = null;
      this.dsb_status = null;
      this.dsb_code = null;
      this.contact_dsb = null;
      this.dsb_vector = null;
      this.other = null;
    }
    else {
      if (initObj.hasOwnProperty('raw_value')) {
        this.raw_value = initObj.raw_value
      }
      else {
        this.raw_value = '';
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geographic_msgs.msg.GeoPoint();
      }
      if (initObj.hasOwnProperty('nature')) {
        this.nature = initObj.nature
      }
      else {
        this.nature = '';
      }
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('ngz_radius')) {
        this.ngz_radius = initObj.ngz_radius
      }
      else {
        this.ngz_radius = 0;
      }
      if (initObj.hasOwnProperty('dsb_status')) {
        this.dsb_status = initObj.dsb_status
      }
      else {
        this.dsb_status = false;
      }
      if (initObj.hasOwnProperty('dsb_code')) {
        this.dsb_code = initObj.dsb_code
      }
      else {
        this.dsb_code = '';
      }
      if (initObj.hasOwnProperty('contact_dsb')) {
        this.contact_dsb = initObj.contact_dsb
      }
      else {
        this.contact_dsb = false;
      }
      if (initObj.hasOwnProperty('dsb_vector')) {
        this.dsb_vector = initObj.dsb_vector
      }
      else {
        this.dsb_vector = '';
      }
      if (initObj.hasOwnProperty('other')) {
        this.other = initObj.other
      }
      else {
        this.other = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type QRCode
    // Serialize message field [raw_value]
    bufferOffset = _serializer.string(obj.raw_value, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [nature]
    bufferOffset = _serializer.string(obj.nature, buffer, bufferOffset);
    // Serialize message field [id]
    bufferOffset = _serializer.uint16(obj.id, buffer, bufferOffset);
    // Serialize message field [ngz_radius]
    bufferOffset = _serializer.uint8(obj.ngz_radius, buffer, bufferOffset);
    // Serialize message field [dsb_status]
    bufferOffset = _serializer.bool(obj.dsb_status, buffer, bufferOffset);
    // Serialize message field [dsb_code]
    bufferOffset = _serializer.string(obj.dsb_code, buffer, bufferOffset);
    // Serialize message field [contact_dsb]
    bufferOffset = _serializer.bool(obj.contact_dsb, buffer, bufferOffset);
    // Serialize message field [dsb_vector]
    bufferOffset = _serializer.string(obj.dsb_vector, buffer, bufferOffset);
    // Serialize message field [other]
    bufferOffset = _serializer.string(obj.other, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type QRCode
    let len;
    let data = new QRCode(null);
    // Deserialize message field [raw_value]
    data.raw_value = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    // Deserialize message field [nature]
    data.nature = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [id]
    data.id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [ngz_radius]
    data.ngz_radius = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [dsb_status]
    data.dsb_status = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [dsb_code]
    data.dsb_code = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [contact_dsb]
    data.contact_dsb = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [dsb_vector]
    data.dsb_vector = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [other]
    data.other = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.raw_value);
    length += _getByteLength(object.nature);
    length += _getByteLength(object.dsb_code);
    length += _getByteLength(object.dsb_vector);
    length += _getByteLength(object.other);
    return length + 49;
  }

  static datatype() {
    // Returns string type for a message object
    return 'cohoma_detection/QRCode';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'be24b4a75c8581625be18ca7834eef5f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new QRCode(null);
    if (msg.raw_value !== undefined) {
      resolved.raw_value = msg.raw_value;
    }
    else {
      resolved.raw_value = ''
    }

    if (msg.position !== undefined) {
      resolved.position = geographic_msgs.msg.GeoPoint.Resolve(msg.position)
    }
    else {
      resolved.position = new geographic_msgs.msg.GeoPoint()
    }

    if (msg.nature !== undefined) {
      resolved.nature = msg.nature;
    }
    else {
      resolved.nature = ''
    }

    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.ngz_radius !== undefined) {
      resolved.ngz_radius = msg.ngz_radius;
    }
    else {
      resolved.ngz_radius = 0
    }

    if (msg.dsb_status !== undefined) {
      resolved.dsb_status = msg.dsb_status;
    }
    else {
      resolved.dsb_status = false
    }

    if (msg.dsb_code !== undefined) {
      resolved.dsb_code = msg.dsb_code;
    }
    else {
      resolved.dsb_code = ''
    }

    if (msg.contact_dsb !== undefined) {
      resolved.contact_dsb = msg.contact_dsb;
    }
    else {
      resolved.contact_dsb = false
    }

    if (msg.dsb_vector !== undefined) {
      resolved.dsb_vector = msg.dsb_vector;
    }
    else {
      resolved.dsb_vector = ''
    }

    if (msg.other !== undefined) {
      resolved.other = msg.other;
    }
    else {
      resolved.other = ''
    }

    return resolved;
    }
};

module.exports = QRCode;
