# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.15.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.15.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/gonglei/brettKK/shell/c++/Sqrt_Project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/gonglei/brettKK/shell/c++/Sqrt_Project

# Include any dependencies generated for this target.
include CMakeFiles/test_sqrt.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test_sqrt.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test_sqrt.dir/flags.make

CMakeFiles/test_sqrt.dir/src/a.cxx.o: CMakeFiles/test_sqrt.dir/flags.make
CMakeFiles/test_sqrt.dir/src/a.cxx.o: src/a.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gonglei/brettKK/shell/c++/Sqrt_Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/test_sqrt.dir/src/a.cxx.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_sqrt.dir/src/a.cxx.o -c /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/a.cxx

CMakeFiles/test_sqrt.dir/src/a.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_sqrt.dir/src/a.cxx.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/a.cxx > CMakeFiles/test_sqrt.dir/src/a.cxx.i

CMakeFiles/test_sqrt.dir/src/a.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_sqrt.dir/src/a.cxx.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/a.cxx -o CMakeFiles/test_sqrt.dir/src/a.cxx.s

CMakeFiles/test_sqrt.dir/src/main.cxx.o: CMakeFiles/test_sqrt.dir/flags.make
CMakeFiles/test_sqrt.dir/src/main.cxx.o: src/main.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/gonglei/brettKK/shell/c++/Sqrt_Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/test_sqrt.dir/src/main.cxx.o"
	/Library/Developer/CommandLineTools/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/test_sqrt.dir/src/main.cxx.o -c /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/main.cxx

CMakeFiles/test_sqrt.dir/src/main.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_sqrt.dir/src/main.cxx.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/main.cxx > CMakeFiles/test_sqrt.dir/src/main.cxx.i

CMakeFiles/test_sqrt.dir/src/main.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_sqrt.dir/src/main.cxx.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/gonglei/brettKK/shell/c++/Sqrt_Project/src/main.cxx -o CMakeFiles/test_sqrt.dir/src/main.cxx.s

# Object files for target test_sqrt
test_sqrt_OBJECTS = \
"CMakeFiles/test_sqrt.dir/src/a.cxx.o" \
"CMakeFiles/test_sqrt.dir/src/main.cxx.o"

# External object files for target test_sqrt
test_sqrt_EXTERNAL_OBJECTS =

test_sqrt: CMakeFiles/test_sqrt.dir/src/a.cxx.o
test_sqrt: CMakeFiles/test_sqrt.dir/src/main.cxx.o
test_sqrt: CMakeFiles/test_sqrt.dir/build.make
test_sqrt: CMakeFiles/test_sqrt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/gonglei/brettKK/shell/c++/Sqrt_Project/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable test_sqrt"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_sqrt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test_sqrt.dir/build: test_sqrt

.PHONY : CMakeFiles/test_sqrt.dir/build

CMakeFiles/test_sqrt.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test_sqrt.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test_sqrt.dir/clean

CMakeFiles/test_sqrt.dir/depend:
	cd /Users/gonglei/brettKK/shell/c++/Sqrt_Project && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/gonglei/brettKK/shell/c++/Sqrt_Project /Users/gonglei/brettKK/shell/c++/Sqrt_Project /Users/gonglei/brettKK/shell/c++/Sqrt_Project /Users/gonglei/brettKK/shell/c++/Sqrt_Project /Users/gonglei/brettKK/shell/c++/Sqrt_Project/CMakeFiles/test_sqrt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test_sqrt.dir/depend

