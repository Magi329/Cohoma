// Generated by gencpp from file cohoma_detection/PushSP.msg
// DO NOT EDIT!


#ifndef COHOMA_DETECTION_MESSAGE_PUSHSP_H
#define COHOMA_DETECTION_MESSAGE_PUSHSP_H

#include <ros/service_traits.h>


#include <cohoma_detection/PushSPRequest.h>
#include <cohoma_detection/PushSPResponse.h>


namespace cohoma_detection
{

struct PushSP
{

typedef PushSPRequest Request;
typedef PushSPResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PushSP
} // namespace cohoma_detection


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::cohoma_detection::PushSP > {
  static const char* value()
  {
    return "1cd191d0f737bee9234bff8f00139f4f";
  }

  static const char* value(const ::cohoma_detection::PushSP&) { return value(); }
};

template<>
struct DataType< ::cohoma_detection::PushSP > {
  static const char* value()
  {
    return "cohoma_detection/PushSP";
  }

  static const char* value(const ::cohoma_detection::PushSP&) { return value(); }
};


// service_traits::MD5Sum< ::cohoma_detection::PushSPRequest> should match
// service_traits::MD5Sum< ::cohoma_detection::PushSP >
template<>
struct MD5Sum< ::cohoma_detection::PushSPRequest>
{
  static const char* value()
  {
    return MD5Sum< ::cohoma_detection::PushSP >::value();
  }
  static const char* value(const ::cohoma_detection::PushSPRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::cohoma_detection::PushSPRequest> should match
// service_traits::DataType< ::cohoma_detection::PushSP >
template<>
struct DataType< ::cohoma_detection::PushSPRequest>
{
  static const char* value()
  {
    return DataType< ::cohoma_detection::PushSP >::value();
  }
  static const char* value(const ::cohoma_detection::PushSPRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::cohoma_detection::PushSPResponse> should match
// service_traits::MD5Sum< ::cohoma_detection::PushSP >
template<>
struct MD5Sum< ::cohoma_detection::PushSPResponse>
{
  static const char* value()
  {
    return MD5Sum< ::cohoma_detection::PushSP >::value();
  }
  static const char* value(const ::cohoma_detection::PushSPResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::cohoma_detection::PushSPResponse> should match
// service_traits::DataType< ::cohoma_detection::PushSP >
template<>
struct DataType< ::cohoma_detection::PushSPResponse>
{
  static const char* value()
  {
    return DataType< ::cohoma_detection::PushSP >::value();
  }
  static const char* value(const ::cohoma_detection::PushSPResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COHOMA_DETECTION_MESSAGE_PUSHSP_H
