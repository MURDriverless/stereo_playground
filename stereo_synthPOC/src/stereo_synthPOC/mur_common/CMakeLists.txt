cmake_minimum_required(VERSION 2.8.3)
project(mur_common)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

add_message_files(DIRECTORY msg
   FILES
   cone_msg.msg
   actuation_msg.msg
   path_msg.msg
   diagnostic_msg.msg
   timing_msg.msg
 )

generate_messages(
   DEPENDENCIES
   std_msgs
 )

catkin_package(
  CATKIN_DEPENDS roscpp rospy std_msgs message_runtime
)

include_directories(
 include
  ${catkin_INCLUDE_DIRS}
)