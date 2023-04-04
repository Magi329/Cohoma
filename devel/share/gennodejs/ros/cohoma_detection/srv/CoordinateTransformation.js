// Auto-generated. Do not edit!

// (in-package cohoma_detection.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

let geographic_msgs = _finder('geographic_msgs');

//-----------------------------------------------------------

class CoordinateTransformationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.translation = null;
      this.rotation = null;
      this.coor_pixel = null;
      this.gps_drone = null;
    }
    else {
      if (initObj.hasOwnProperty('translation')) {
        this.translation = initObj.translation
      }
      else {
        this.translation = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('rotation')) {
        this.rotation = initObj.rotation
      }
      else {
        this.rotation = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('coor_pixel')) {
        this.coor_pixel = initObj.coor_pixel
      }
      else {
        this.coor_pixel = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('gps_drone')) {
        this.gps_drone = initObj.gps_drone
      }
      else {
        this.gps_drone = new sensor_msgs.msg.NavSatFix();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CoordinateTransformationRequest
    // Serialize message field [translation]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.translation, buffer, bufferOffset);
    // Serialize message field [rotation]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.rotation, buffer, bufferOffset);
    // Serialize message field [coor_pixel]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.coor_pixel, buffer, bufferOffset);
    // Serialize message field [gps_drone]
    bufferOffset = sensor_msgs.msg.NavSatFix.serialize(obj.gps_drone, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CoordinateTransformationRequest
    let len;
    let data = new CoordinateTransformationRequest(null);
    // Deserialize message field [translation]
    data.translation = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [rotation]
    data.rotation = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [coor_pixel]
    data.coor_pixel = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [gps_drone]
    data.gps_drone = sensor_msgs.msg.NavSatFix.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.NavSatFix.getMessageSize(object.gps_drone);
    return length + 72;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/CoordinateTransformationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '537e25547db3dd9c62d41baa6668bb0f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Vector3 translation             # entre le repère de la caméra et le repère du monde réel
    geometry_msgs/Vector3 rotation
    geometry_msgs/Point   coor_pixel             # x et y coordonnées en pixel, on n'utilise pas z
    sensor_msgs/NavSatFix gps_drone              # latitude longitude altitude ainsi que status header position_covariance du drone
    
    ================================================================================
    MSG: geometry_msgs/Vector3
    # This represents a vector in free space. 
    # It is only meant to represent a direction. Therefore, it does not
    # make sense to apply a translation to it (e.g., when applying a 
    # generic rigid transformation to a Vector3, tf2 will only apply the
    # rotation). If you want your data to be translatable too, use the
    # geometry_msgs/Point message instead.
    
    float64 x
    float64 y
    float64 z
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: sensor_msgs/NavSatFix
    # Navigation Satellite fix for any Global Navigation Satellite System
    #
    # Specified using the WGS 84 reference ellipsoid
    
    # header.stamp specifies the ROS time for this measurement (the
    #        corresponding satellite time may be reported using the
    #        sensor_msgs/TimeReference message).
    #
    # header.frame_id is the frame of reference reported by the satellite
    #        receiver, usually the location of the antenna.  This is a
    #        Euclidean frame relative to the vehicle, not a reference
    #        ellipsoid.
    Header header
    
    # satellite fix status information
    NavSatStatus status
    
    # Latitude [degrees]. Positive is north of equator; negative is south.
    float64 latitude
    
    # Longitude [degrees]. Positive is east of prime meridian; negative is west.
    float64 longitude
    
    # Altitude [m]. Positive is above the WGS 84 ellipsoid
    # (quiet NaN if no altitude is available).
    float64 altitude
    
    # Position covariance [m^2] defined relative to a tangential plane
    # through the reported position. The components are East, North, and
    # Up (ENU), in row-major order.
    #
    # Beware: this coordinate system exhibits singularities at the poles.
    
    float64[9] position_covariance
    
    # If the covariance of the fix is known, fill it in completely. If the
    # GPS receiver provides the variance of each measurement, put them
    # along the diagonal. If only Dilution of Precision is available,
    # estimate an approximate covariance from that.
    
    uint8 COVARIANCE_TYPE_UNKNOWN = 0
    uint8 COVARIANCE_TYPE_APPROXIMATED = 1
    uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN = 2
    uint8 COVARIANCE_TYPE_KNOWN = 3
    
    uint8 position_covariance_type
    
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
    MSG: sensor_msgs/NavSatStatus
    # Navigation Satellite fix status for any Global Navigation Satellite System
    
    # Whether to output an augmented fix is determined by both the fix
    # type and the last time differential corrections were received.  A
    # fix is valid when status >= STATUS_FIX.
    
    int8 STATUS_NO_FIX =  -1        # unable to fix position
    int8 STATUS_FIX =      0        # unaugmented fix
    int8 STATUS_SBAS_FIX = 1        # with satellite-based augmentation
    int8 STATUS_GBAS_FIX = 2        # with ground-based augmentation
    
    int8 status
    
    # Bits defining which Global Navigation Satellite System signals were
    # used by the receiver.
    
    uint16 SERVICE_GPS =     1
    uint16 SERVICE_GLONASS = 2
    uint16 SERVICE_COMPASS = 4      # includes BeiDou.
    uint16 SERVICE_GALILEO = 8
    
    uint16 service
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CoordinateTransformationRequest(null);
    if (msg.translation !== undefined) {
      resolved.translation = geometry_msgs.msg.Vector3.Resolve(msg.translation)
    }
    else {
      resolved.translation = new geometry_msgs.msg.Vector3()
    }

    if (msg.rotation !== undefined) {
      resolved.rotation = geometry_msgs.msg.Vector3.Resolve(msg.rotation)
    }
    else {
      resolved.rotation = new geometry_msgs.msg.Vector3()
    }

    if (msg.coor_pixel !== undefined) {
      resolved.coor_pixel = geometry_msgs.msg.Point.Resolve(msg.coor_pixel)
    }
    else {
      resolved.coor_pixel = new geometry_msgs.msg.Point()
    }

    if (msg.gps_drone !== undefined) {
      resolved.gps_drone = sensor_msgs.msg.NavSatFix.Resolve(msg.gps_drone)
    }
    else {
      resolved.gps_drone = new sensor_msgs.msg.NavSatFix()
    }

    return resolved;
    }
};

class CoordinateTransformationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.gps_qrcode = null;
    }
    else {
      if (initObj.hasOwnProperty('gps_qrcode')) {
        this.gps_qrcode = initObj.gps_qrcode
      }
      else {
        this.gps_qrcode = new geographic_msgs.msg.GeoPoint();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CoordinateTransformationResponse
    // Serialize message field [gps_qrcode]
    bufferOffset = geographic_msgs.msg.GeoPoint.serialize(obj.gps_qrcode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CoordinateTransformationResponse
    let len;
    let data = new CoordinateTransformationResponse(null);
    // Deserialize message field [gps_qrcode]
    data.gps_qrcode = geographic_msgs.msg.GeoPoint.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'cohoma_detection/CoordinateTransformationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70f4fc60fa0596961886b4f4cc362f6b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude
    
    # to modify completely!!!!
    
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
    const resolved = new CoordinateTransformationResponse(null);
    if (msg.gps_qrcode !== undefined) {
      resolved.gps_qrcode = geographic_msgs.msg.GeoPoint.Resolve(msg.gps_qrcode)
    }
    else {
      resolved.gps_qrcode = new geographic_msgs.msg.GeoPoint()
    }

    return resolved;
    }
};

module.exports = {
  Request: CoordinateTransformationRequest,
  Response: CoordinateTransformationResponse,
  md5sum() { return '3064e8c447201208c1ba42ae35ce3d16'; },
  datatype() { return 'cohoma_detection/CoordinateTransformation'; }
};
