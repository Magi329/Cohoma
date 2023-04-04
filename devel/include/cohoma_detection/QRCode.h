// Generated by gencpp from file cohoma_detection/QRCode.msg
// DO NOT EDIT!


#ifndef COHOMA_DETECTION_MESSAGE_QRCODE_H
#define COHOMA_DETECTION_MESSAGE_QRCODE_H


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
struct QRCode_
{
  typedef QRCode_<ContainerAllocator> Type;

  QRCode_()
    : raw_value()
    , position()
    , nature()
    , id(0)
    , ngz_radius(0)
    , dsb_status(false)
    , dsb_code()
    , contact_dsb(false)
    , dsb_vector()
    , other()  {
    }
  QRCode_(const ContainerAllocator& _alloc)
    : raw_value(_alloc)
    , position(_alloc)
    , nature(_alloc)
    , id(0)
    , ngz_radius(0)
    , dsb_status(false)
    , dsb_code(_alloc)
    , contact_dsb(false)
    , dsb_vector(_alloc)
    , other(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _raw_value_type;
  _raw_value_type raw_value;

   typedef  ::geographic_msgs::GeoPoint_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _nature_type;
  _nature_type nature;

   typedef uint16_t _id_type;
  _id_type id;

   typedef uint8_t _ngz_radius_type;
  _ngz_radius_type ngz_radius;

   typedef uint8_t _dsb_status_type;
  _dsb_status_type dsb_status;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _dsb_code_type;
  _dsb_code_type dsb_code;

   typedef uint8_t _contact_dsb_type;
  _contact_dsb_type contact_dsb;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _dsb_vector_type;
  _dsb_vector_type dsb_vector;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _other_type;
  _other_type other;





  typedef boost::shared_ptr< ::cohoma_detection::QRCode_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cohoma_detection::QRCode_<ContainerAllocator> const> ConstPtr;

}; // struct QRCode_

typedef ::cohoma_detection::QRCode_<std::allocator<void> > QRCode;

typedef boost::shared_ptr< ::cohoma_detection::QRCode > QRCodePtr;
typedef boost::shared_ptr< ::cohoma_detection::QRCode const> QRCodeConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cohoma_detection::QRCode_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cohoma_detection::QRCode_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::cohoma_detection::QRCode_<ContainerAllocator1> & lhs, const ::cohoma_detection::QRCode_<ContainerAllocator2> & rhs)
{
  return lhs.raw_value == rhs.raw_value &&
    lhs.position == rhs.position &&
    lhs.nature == rhs.nature &&
    lhs.id == rhs.id &&
    lhs.ngz_radius == rhs.ngz_radius &&
    lhs.dsb_status == rhs.dsb_status &&
    lhs.dsb_code == rhs.dsb_code &&
    lhs.contact_dsb == rhs.contact_dsb &&
    lhs.dsb_vector == rhs.dsb_vector &&
    lhs.other == rhs.other;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::cohoma_detection::QRCode_<ContainerAllocator1> & lhs, const ::cohoma_detection::QRCode_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace cohoma_detection

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::cohoma_detection::QRCode_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cohoma_detection::QRCode_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cohoma_detection::QRCode_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cohoma_detection::QRCode_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cohoma_detection::QRCode_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cohoma_detection::QRCode_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cohoma_detection::QRCode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "be24b4a75c8581625be18ca7834eef5f";
  }

  static const char* value(const ::cohoma_detection::QRCode_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xbe24b4a75c858162ULL;
  static const uint64_t static_value2 = 0x5be18ca7834eef5fULL;
};

template<class ContainerAllocator>
struct DataType< ::cohoma_detection::QRCode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cohoma_detection/QRCode";
  }

  static const char* value(const ::cohoma_detection::QRCode_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cohoma_detection::QRCode_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string raw_value #QR Code raw value\n"
"geographic_msgs/GeoPoint position #Trap position when detected\n"
"string nature     #Information about the trap signifacation in the real context\n"
"uint16 id         #Identificator of the trap\n"
"uint8 ngz_radius  #No Go Zone Radius around the trap\n"
"bool dsb_status   #The trap can be disabled or not\n"
"string dsb_code   #Code to transmit to disable the trap\n"
"bool contact_dsb  #The trap should be disabled by contact or not\n"
"string dsb_vector #Type of drone that can disable the trap\n"
"string other      #Diverse complementary (miscellaneous) informations\n"
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

  static const char* value(const ::cohoma_detection::QRCode_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cohoma_detection::QRCode_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.raw_value);
      stream.next(m.position);
      stream.next(m.nature);
      stream.next(m.id);
      stream.next(m.ngz_radius);
      stream.next(m.dsb_status);
      stream.next(m.dsb_code);
      stream.next(m.contact_dsb);
      stream.next(m.dsb_vector);
      stream.next(m.other);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QRCode_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cohoma_detection::QRCode_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cohoma_detection::QRCode_<ContainerAllocator>& v)
  {
    s << indent << "raw_value: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.raw_value);
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geographic_msgs::GeoPoint_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "nature: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.nature);
    s << indent << "id: ";
    Printer<uint16_t>::stream(s, indent + "  ", v.id);
    s << indent << "ngz_radius: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.ngz_radius);
    s << indent << "dsb_status: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.dsb_status);
    s << indent << "dsb_code: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.dsb_code);
    s << indent << "contact_dsb: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.contact_dsb);
    s << indent << "dsb_vector: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.dsb_vector);
    s << indent << "other: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.other);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COHOMA_DETECTION_MESSAGE_QRCODE_H
