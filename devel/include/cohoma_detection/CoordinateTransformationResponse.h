// Generated by gencpp from file cohoma_detection/CoordinateTransformationResponse.msg
// DO NOT EDIT!


#ifndef COHOMA_DETECTION_MESSAGE_COORDINATETRANSFORMATIONRESPONSE_H
#define COHOMA_DETECTION_MESSAGE_COORDINATETRANSFORMATIONRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geographic_msgs/GeoPoint.h>

namespace cohoma_detection
{
template <class ContainerAllocator>
struct CoordinateTransformationResponse_
{
  typedef CoordinateTransformationResponse_<ContainerAllocator> Type;

  CoordinateTransformationResponse_()
    : gps_qrcode()  {
    }
  CoordinateTransformationResponse_(const ContainerAllocator& _alloc)
    : gps_qrcode(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geographic_msgs::GeoPoint_<ContainerAllocator>  _gps_qrcode_type;
  _gps_qrcode_type gps_qrcode;





  typedef boost::shared_ptr< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> const> ConstPtr;

}; // struct CoordinateTransformationResponse_

typedef ::cohoma_detection::CoordinateTransformationResponse_<std::allocator<void> > CoordinateTransformationResponse;

typedef boost::shared_ptr< ::cohoma_detection::CoordinateTransformationResponse > CoordinateTransformationResponsePtr;
typedef boost::shared_ptr< ::cohoma_detection::CoordinateTransformationResponse const> CoordinateTransformationResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator1> & lhs, const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator2> & rhs)
{
  return lhs.gps_qrcode == rhs.gps_qrcode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator1> & lhs, const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cohoma_detection

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "70f4fc60fa0596961886b4f4cc362f6b";
  }

  static const char* value(const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x70f4fc60fa059696ULL;
  static const uint64_t static_value2 = 0x1886b4f4cc362f6bULL;
};

template<class ContainerAllocator>
struct DataType< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cohoma_detection/CoordinateTransformationResponse";
  }

  static const char* value(const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geographic_msgs/GeoPoint gps_qrcode          # latitude longitude altitude\n"
"\n"
"# to modify completely!!!!\n"
"\n"
"================================================================================\n"
"MSG: geographic_msgs/GeoPoint\n"
"# Geographic point, using the WGS 84 reference ellipsoid.\n"
"\n"
"# Latitude [degrees]. Positive is north of equator; negative is south\n"
"# (-90 <= latitude <= +90).\n"
"float64 latitude\n"
"\n"
"# Longitude [degrees]. Positive is east of prime meridian; negative is\n"
"# west (-180 <= longitude <= +180). At the poles, latitude is -90 or\n"
"# +90, and longitude is irrelevant, but must be in range.\n"
"float64 longitude\n"
"\n"
"# Altitude [m]. Positive is above the WGS 84 ellipsoid (NaN if unspecified).\n"
"float64 altitude\n"
;
  }

  static const char* value(const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.gps_qrcode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CoordinateTransformationResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cohoma_detection::CoordinateTransformationResponse_<ContainerAllocator>& v)
  {
    s << indent << "gps_qrcode: ";
    s << std::endl;
    Printer< ::geographic_msgs::GeoPoint_<ContainerAllocator> >::stream(s, indent + "  ", v.gps_qrcode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COHOMA_DETECTION_MESSAGE_COORDINATETRANSFORMATIONRESPONSE_H
