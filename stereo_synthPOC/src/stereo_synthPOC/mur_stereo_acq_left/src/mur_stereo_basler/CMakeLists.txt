cmake_minimum_required(VERSION 3.18)
project("mur_left_image_acq")

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindPylon.cmake")

if (DEFINED CATKIN_DEVEL_PREFIX)
  find_package(catkin REQUIRED)
  message(STATUS "Catkin env set, compiling ${PROJECT_NAME} with ROS")

  catkin_package(
    INCLUDE_DIRS includes/Classical includes/Detectors includes/StereoCommon
    LIBRARIES ${PROJECT_NAME}
  )
else()
  message(STATUS "Catkin env not set, compiling ${PROJECT_NAME} without ROS")
endif()

list(APPEND CMAKE_PREFIX_PATH "tkDNN")

find_package(tkDNN)

find_package(catkin REQUIRED COMPONENTS
  sensor_msgs
  message_generation
  message_runtime
  roscpp
  rospy
  std_msgs
  cv_bridge
  image_transport
)



include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

catkin_package(CATKIN_DEPENDS)

add_executable( ${PROJECT_NAME}
    src/main.cpp
    src/GeniWrap.cpp
)

target_include_directories( ${PROJECT_NAME}
    PUBLIC ${OpenCV_INCLUDE_DIRS}
    PUBLIC ${Pylon_INCLUDE_DIRS}
    PUBLIC ${tkDNN_INCLUDE_DIRS}
    PRIVATE includes
    PUBLIC includes/Classical
    PUBLIC includes/Detectors
    PUBLIC includes/StereoCommon
)

target_link_libraries( ${PROJECT_NAME} 
    # mur_stereo_pipeline
    ${catkin_LIBRARIES}
    ${OPENCV_LIBRARIES}
    ${OpenCV_LIBS}
    ${Pylon_LIBRARIES} 
    ${tkDNN_LIBRARIES}
    nvonnxparser
)

