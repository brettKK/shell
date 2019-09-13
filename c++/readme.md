+ c++
    + c++ 11 基本知识
    + 弄个好开发环境
        + Xcode
        + vs code
		+ 插件 Microsoft C/C++ extension for VS code
    + 项目结构 CMakeLists.txt -- cmake --> makefile --> make --> bin/...
        + cmake VS premake
            +  CMakeLists.txt (参数之间使用空格进行间隔)
            + aux_source_directory(. DIR_SRCS)
            + add_subdirectory(math)
        + premake (cmake的另一种选择， makefiles, VS solutions, Xcode Projects, etc)
            + premake5.lua
        + makefile
    
---
+ llvm 下载source code 并安装
    + mkdir llvm
    + svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
    + cd llvm/tools
        + svn co http://llvm.org/svn/llvm-project/cfe/trunk clang
        + cd ../..
    + cd llvm/tools/clang/tools
        + svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra
        + cd ../../../..
    + mkdir llvm/build & cd build
    + cmake -G "Unix Makefiles" ../llvm
    + make  (waiting 1 hour)
    + export PATH="llvm/build/bin":$PATH
    + 命令行 可以使用 llc等 命令程序


---
problem

fatal error: 'iostream' file not found
#include<iostream>
        ^~~~~~~~~~
1 error generated.

解决办法： clang++ -I"/Library/Developer/CommandLineTools/usr/include/c++/v1"