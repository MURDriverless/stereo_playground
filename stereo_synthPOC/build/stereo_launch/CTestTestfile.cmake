# CMake generated Testfile for 
# Source directory: /workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/stereo_launch
# Build directory: /workspace/stereo_playground/stereo_synthPOC/build/stereo_launch
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_stereo_launch_roslaunch-check_launch "/workspace/stereo_playground/stereo_synthPOC/build/stereo_launch/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/melodic/share/catkin/cmake/test/run_tests.py" "/workspace/stereo_playground/stereo_synthPOC/build/stereo_launch/test_results/stereo_launch/roslaunch-check_launch.xml" "--return-code" "/opt/cmake-3.18.2-Linux-x86_64/bin/cmake -E make_directory /workspace/stereo_playground/stereo_synthPOC/build/stereo_launch/test_results/stereo_launch" "/opt/ros/melodic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/workspace/stereo_playground/stereo_synthPOC/build/stereo_launch/test_results/stereo_launch/roslaunch-check_launch.xml\" \"/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/stereo_launch/launch\" ")
set_tests_properties(_ctest_stereo_launch_roslaunch-check_launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/melodic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/melodic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/stereo_launch/CMakeLists.txt;17;roslaunch_add_file_check;/workspace/stereo_playground/stereo_synthPOC/src/stereo_synthPOC/stereo_launch/CMakeLists.txt;0;")
subdirs("gtest")
