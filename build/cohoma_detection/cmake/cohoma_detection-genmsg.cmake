# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cohoma_detection: 5 messages, 4 services")

set(MSG_I_FLAGS "-Icohoma_detection:/home/chen/cohoma_ws/src/cohoma_detection/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeographic_msgs:/opt/ros/noetic/share/geographic_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/noetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cohoma_detection_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" ""
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" "geographic_msgs/GeoPoint"
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" "geographic_msgs/GeoPoint:cohoma_detection/QRCode"
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" "geographic_msgs/GeoPoint"
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" "geographic_msgs/GeoPoint:std_msgs/Header:cohoma_detection/StrategicPoint"
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" ""
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" ""
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" "geographic_msgs/GeoPoint:cohoma_detection/StrategicPoint"
)

get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_custom_target(_cohoma_detection_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cohoma_detection" "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" "geometry_msgs/Vector3:geographic_msgs/GeoPoint:sensor_msgs/NavSatStatus:std_msgs/Header:geometry_msgs/Point:sensor_msgs/NavSatFix"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)

### Generating Services
_generate_srv_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_cpp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
)

### Generating Module File
_generate_module_cpp(cohoma_detection
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cohoma_detection_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cohoma_detection_generate_messages cohoma_detection_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_cpp _cohoma_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cohoma_detection_gencpp)
add_dependencies(cohoma_detection_gencpp cohoma_detection_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cohoma_detection_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_msg_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_msg_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_msg_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_msg_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)

### Generating Services
_generate_srv_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_srv_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_srv_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)
_generate_srv_eus(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
)

### Generating Module File
_generate_module_eus(cohoma_detection
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(cohoma_detection_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(cohoma_detection_generate_messages cohoma_detection_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_eus _cohoma_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cohoma_detection_geneus)
add_dependencies(cohoma_detection_geneus cohoma_detection_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cohoma_detection_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_msg_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)

### Generating Services
_generate_srv_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)
_generate_srv_lisp(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
)

### Generating Module File
_generate_module_lisp(cohoma_detection
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cohoma_detection_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cohoma_detection_generate_messages cohoma_detection_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_lisp _cohoma_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cohoma_detection_genlisp)
add_dependencies(cohoma_detection_genlisp cohoma_detection_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cohoma_detection_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_msg_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_msg_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_msg_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_msg_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)

### Generating Services
_generate_srv_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_srv_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_srv_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)
_generate_srv_nodejs(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
)

### Generating Module File
_generate_module_nodejs(cohoma_detection
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(cohoma_detection_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(cohoma_detection_generate_messages cohoma_detection_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_nodejs _cohoma_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cohoma_detection_gennodejs)
add_dependencies(cohoma_detection_gennodejs cohoma_detection_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cohoma_detection_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_msg_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_msg_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_msg_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_msg_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)

### Generating Services
_generate_srv_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_srv_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_srv_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)
_generate_srv_py(cohoma_detection
  "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/geographic_msgs/cmake/../msg/GeoPoint.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatStatus.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/NavSatFix.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
)

### Generating Module File
_generate_module_py(cohoma_detection
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cohoma_detection_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cohoma_detection_generate_messages cohoma_detection_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/gps.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCode.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/QRCodeList.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/StrategicPoint.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/msg/MissionContext.msg" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDelete.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/TrapDisable.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/PushSP.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/chen/cohoma_ws/src/cohoma_detection/srv/CoordinateTransformation.srv" NAME_WE)
add_dependencies(cohoma_detection_generate_messages_py _cohoma_detection_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cohoma_detection_genpy)
add_dependencies(cohoma_detection_genpy cohoma_detection_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cohoma_detection_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cohoma_detection
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cohoma_detection_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(cohoma_detection_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geographic_msgs_generate_messages_cpp)
  add_dependencies(cohoma_detection_generate_messages_cpp geographic_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/cohoma_detection
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(cohoma_detection_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(cohoma_detection_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geographic_msgs_generate_messages_eus)
  add_dependencies(cohoma_detection_generate_messages_eus geographic_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cohoma_detection
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cohoma_detection_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(cohoma_detection_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geographic_msgs_generate_messages_lisp)
  add_dependencies(cohoma_detection_generate_messages_lisp geographic_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/cohoma_detection
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(cohoma_detection_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(cohoma_detection_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geographic_msgs_generate_messages_nodejs)
  add_dependencies(cohoma_detection_generate_messages_nodejs geographic_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cohoma_detection
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cohoma_detection_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(cohoma_detection_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geographic_msgs_generate_messages_py)
  add_dependencies(cohoma_detection_generate_messages_py geographic_msgs_generate_messages_py)
endif()
