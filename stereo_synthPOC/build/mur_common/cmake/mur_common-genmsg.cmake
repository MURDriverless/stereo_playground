# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mur_common: 5 messages, 0 services")

set(MSG_I_FLAGS "-Imur_common:/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mur_common_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_custom_target(_mur_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mur_common" "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_custom_target(_mur_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mur_common" "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_custom_target(_mur_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mur_common" "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_custom_target(_mur_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mur_common" "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_custom_target(_mur_common_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mur_common" "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
)
_generate_msg_cpp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
)
_generate_msg_cpp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
)
_generate_msg_cpp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
)
_generate_msg_cpp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
)

### Generating Services

### Generating Module File
_generate_module_cpp(mur_common
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mur_common_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mur_common_generate_messages mur_common_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_cpp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_cpp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_cpp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_cpp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_cpp _mur_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mur_common_gencpp)
add_dependencies(mur_common_gencpp mur_common_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mur_common_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
)
_generate_msg_eus(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
)
_generate_msg_eus(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
)
_generate_msg_eus(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
)
_generate_msg_eus(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
)

### Generating Services

### Generating Module File
_generate_module_eus(mur_common
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mur_common_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mur_common_generate_messages mur_common_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_eus _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_eus _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_eus _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_eus _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_eus _mur_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mur_common_geneus)
add_dependencies(mur_common_geneus mur_common_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mur_common_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
)
_generate_msg_lisp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
)
_generate_msg_lisp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
)
_generate_msg_lisp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
)
_generate_msg_lisp(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
)

### Generating Services

### Generating Module File
_generate_module_lisp(mur_common
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mur_common_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mur_common_generate_messages mur_common_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_lisp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_lisp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_lisp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_lisp _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_lisp _mur_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mur_common_genlisp)
add_dependencies(mur_common_genlisp mur_common_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mur_common_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
)
_generate_msg_nodejs(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
)
_generate_msg_nodejs(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
)
_generate_msg_nodejs(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
)
_generate_msg_nodejs(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mur_common
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mur_common_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mur_common_generate_messages mur_common_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_nodejs _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_nodejs _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_nodejs _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_nodejs _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_nodejs _mur_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mur_common_gennodejs)
add_dependencies(mur_common_gennodejs mur_common_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mur_common_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
)
_generate_msg_py(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
)
_generate_msg_py(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
)
_generate_msg_py(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
)
_generate_msg_py(mur_common
  "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
)

### Generating Services

### Generating Module File
_generate_module_py(mur_common
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mur_common_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mur_common_generate_messages mur_common_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/path_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_py _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/timing_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_py _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/diagnostic_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_py _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/cone_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_py _mur_common_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/mur_common/msg/actuation_msg.msg" NAME_WE)
add_dependencies(mur_common_generate_messages_py _mur_common_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mur_common_genpy)
add_dependencies(mur_common_genpy mur_common_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mur_common_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mur_common
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mur_common_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mur_common
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mur_common_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mur_common
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mur_common_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mur_common
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mur_common_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mur_common
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mur_common_generate_messages_py std_msgs_generate_messages_py)
endif()
