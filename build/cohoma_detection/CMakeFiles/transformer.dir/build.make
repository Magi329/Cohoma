# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/chen/cohoma_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/chen/cohoma_ws/build

# Include any dependencies generated for this target.
include cohoma_detection/CMakeFiles/transformer.dir/depend.make

# Include the progress variables for this target.
include cohoma_detection/CMakeFiles/transformer.dir/progress.make

# Include the compile flags for this target's objects.
include cohoma_detection/CMakeFiles/transformer.dir/flags.make

cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.o: cohoma_detection/CMakeFiles/transformer.dir/flags.make
cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.o: /home/chen/cohoma_ws/src/cohoma_detection/src/transformer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/chen/cohoma_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.o"
	cd /home/chen/cohoma_ws/build/cohoma_detection && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/transformer.dir/src/transformer.cpp.o -c /home/chen/cohoma_ws/src/cohoma_detection/src/transformer.cpp

cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/transformer.dir/src/transformer.cpp.i"
	cd /home/chen/cohoma_ws/build/cohoma_detection && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/chen/cohoma_ws/src/cohoma_detection/src/transformer.cpp > CMakeFiles/transformer.dir/src/transformer.cpp.i

cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/transformer.dir/src/transformer.cpp.s"
	cd /home/chen/cohoma_ws/build/cohoma_detection && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/chen/cohoma_ws/src/cohoma_detection/src/transformer.cpp -o CMakeFiles/transformer.dir/src/transformer.cpp.s

# Object files for target transformer
transformer_OBJECTS = \
"CMakeFiles/transformer.dir/src/transformer.cpp.o"

# External object files for target transformer
transformer_EXTERNAL_OBJECTS =

/home/chen/cohoma_ws/devel/lib/cohoma_detection/transformer: cohoma_detection/CMakeFiles/transformer.dir/src/transformer.cpp.o
/home/chen/cohoma_ws/devel/lib/cohoma_detection/transformer: cohoma_detection/CMakeFiles/transformer.dir/build.make
/home/chen/cohoma_ws/devel/lib/cohoma_detection/transformer: cohoma_detection/CMakeFiles/transformer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/chen/cohoma_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/chen/cohoma_ws/devel/lib/cohoma_detection/transformer"
	cd /home/chen/cohoma_ws/build/cohoma_detection && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/transformer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
cohoma_detection/CMakeFiles/transformer.dir/build: /home/chen/cohoma_ws/devel/lib/cohoma_detection/transformer

.PHONY : cohoma_detection/CMakeFiles/transformer.dir/build

cohoma_detection/CMakeFiles/transformer.dir/clean:
	cd /home/chen/cohoma_ws/build/cohoma_detection && $(CMAKE_COMMAND) -P CMakeFiles/transformer.dir/cmake_clean.cmake
.PHONY : cohoma_detection/CMakeFiles/transformer.dir/clean

cohoma_detection/CMakeFiles/transformer.dir/depend:
	cd /home/chen/cohoma_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/chen/cohoma_ws/src /home/chen/cohoma_ws/src/cohoma_detection /home/chen/cohoma_ws/build /home/chen/cohoma_ws/build/cohoma_detection /home/chen/cohoma_ws/build/cohoma_detection/CMakeFiles/transformer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : cohoma_detection/CMakeFiles/transformer.dir/depend

