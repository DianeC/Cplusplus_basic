# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.19.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.19.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build

# Include any dependencies generated for this target.
include CMakeFiles/run_my_math.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/run_my_math.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/run_my_math.dir/flags.make

CMakeFiles/run_my_math.dir/main.cpp.o: CMakeFiles/run_my_math.dir/flags.make
CMakeFiles/run_my_math.dir/main.cpp.o: ../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/run_my_math.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/run_my_math.dir/main.cpp.o -c /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/main.cpp

CMakeFiles/run_my_math.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/run_my_math.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/main.cpp > CMakeFiles/run_my_math.dir/main.cpp.i

CMakeFiles/run_my_math.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/run_my_math.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/main.cpp -o CMakeFiles/run_my_math.dir/main.cpp.s

# Object files for target run_my_math
run_my_math_OBJECTS = \
"CMakeFiles/run_my_math.dir/main.cpp.o"

# External object files for target run_my_math
run_my_math_EXTERNAL_OBJECTS =

run_my_math: CMakeFiles/run_my_math.dir/main.cpp.o
run_my_math: CMakeFiles/run_my_math.dir/build.make
run_my_math: libmy_math.dylib
run_my_math: CMakeFiles/run_my_math.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable run_my_math"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/run_my_math.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/run_my_math.dir/build: run_my_math

.PHONY : CMakeFiles/run_my_math.dir/build

CMakeFiles/run_my_math.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run_my_math.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run_my_math.dir/clean

CMakeFiles/run_my_math.dir/depend:
	cd /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build /Users/caicai/Desktop/code/Cplusplus_basic/Cplusplus_basic/compile/build/CMakeFiles/run_my_math.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run_my_math.dir/depend
