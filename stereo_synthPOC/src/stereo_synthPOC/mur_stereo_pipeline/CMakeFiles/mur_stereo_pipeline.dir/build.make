# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.18

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.18.2-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.18.2-Linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/stereo_synthPOC/src/stereo_synthPOC

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/stereo_synthPOC/src/stereo_synthPOC

# Include any dependencies generated for this target.
include mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/depend.make

# Include the progress variables for this target.
include mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/progress.make

# Include the compile flags for this target's objects.
include mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o: mur_stereo_pipeline/src/Classical/ClassicalStereo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Classical/ClassicalStereo.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Classical/ClassicalStereo.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Classical/ClassicalStereo.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.s

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o: mur_stereo_pipeline/src/Detectors/EntropyCalibrator.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/EntropyCalibrator.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/EntropyCalibrator.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/EntropyCalibrator.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.s

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o: mur_stereo_pipeline/src/Detectors/Utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Utils.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Utils.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Utils.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.s

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o: mur_stereo_pipeline/src/Detectors/Detectors.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Detectors.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Detectors.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/Detectors.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.s

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o: mur_stereo_pipeline/src/Detectors/KeypointDetector.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/KeypointDetector.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/KeypointDetector.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/Detectors/KeypointDetector.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.s

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/flags.make
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o: mur_stereo_pipeline/src/StereoCommon/StereoBench.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o -c /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/StereoCommon/StereoBench.cpp

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.i"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/StereoCommon/StereoBench.cpp > CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.i

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.s"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/src/StereoCommon/StereoBench.cpp -o CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.s

# Object files for target mur_stereo_pipeline
mur_stereo_pipeline_OBJECTS = \
"CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o" \
"CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o" \
"CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o" \
"CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o" \
"CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o" \
"CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o"

# External object files for target mur_stereo_pipeline
mur_stereo_pipeline_EXTERNAL_OBJECTS =

mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Classical/ClassicalStereo.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/EntropyCalibrator.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Utils.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/Detectors.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/Detectors/KeypointDetector.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/src/StereoCommon/StereoBench.cpp.o
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/build.make
mur_stereo_pipeline/libmur_stereo_pipeline.a: mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/stereo_synthPOC/src/stereo_synthPOC/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Linking CXX static library libmur_stereo_pipeline.a"
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && $(CMAKE_COMMAND) -P CMakeFiles/mur_stereo_pipeline.dir/cmake_clean_target.cmake
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mur_stereo_pipeline.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/build: mur_stereo_pipeline/libmur_stereo_pipeline.a

.PHONY : mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/build

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/clean:
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline && $(CMAKE_COMMAND) -P CMakeFiles/mur_stereo_pipeline.dir/cmake_clean.cmake
.PHONY : mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/clean

mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/depend:
	cd /workspace/stereo_synthPOC/src/stereo_synthPOC && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/stereo_synthPOC/src/stereo_synthPOC /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline /workspace/stereo_synthPOC/src/stereo_synthPOC /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline /workspace/stereo_synthPOC/src/stereo_synthPOC/mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mur_stereo_pipeline/CMakeFiles/mur_stereo_pipeline.dir/depend

