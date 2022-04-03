# 1. structure of a CMakeLists.txt

// necessary
- project(name)
- project(CMakeTemplate VERSION 1.0.0 LANGUAGES C CXX)
- add_library or add_excutable
     - add_library(lib_name STATIC/SHARD src_files)
     - add_excutable(bin_name src_files)
- include_directories(head_file_path)  #src文件会在head_file_path目录下找依赖的头文件，不会找这个目录的子目录，即相对目录
- link_directories(lib_path)  #依赖的lib的相对目录 # 用在add_executable之前 #Deprecated. Use the target_link_libraries() command instead. # 相对目录
- target_link_libraries # liblatency.so在这里只用写latency #链接lib的名称 # 用在add_executable之后
    - add_executable(demo ./src/main.cpp
    - target_link_libraries(demo libsugan)

// unnecessary
- find_package(OpenCV 3.2.0 REQUIRED) # 搜索所有名为OpenCV.cmake的文件
- add_definitions
- message(STATUS "Opnecv ;ibrary status: ") # 打印
- message(FATEL_ERROR "xxx") # 编译会失败
- file(WRITE filename "message") # 将message写入到filename文件中，会覆盖文件原有内容
- file(APPEND filename "message") # 将message写入到filename文件中，会追加在文件末尾
- file(READ filename var [LIMIT numBytes] [OFFSET offset] [HEX]) # 读文件
- file(RENAME <oldname> <newname>) # 重命名
- file(REMOVE [filel ...]) # 删除文件
- file(REMOVE_RECURSE [filel ...]) # 递归删除文件
- file(MAKE_DIRECTORY [dir1 dir2 ...]) # 生成文件夹
- file(GLOB var [RELATIVE path] [globbing expression]...) # 将所有匹配查询表达式的文件生成一个list
- file(GLOB_RECURSE MATH_LIB_SRC src/c/math/*.c)

// settings
- cmake_minimum_required( VERSION 2.8 ) # cmake版本要求，是不是会继承父目录？
- set(CMAKE_BUILD_TYPE Release/debug) # 编译模式
- add_compile_options(-Wall -Wextra -pedantic -Werror)
- set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe -std=c99")
- set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pipe -std=c++11")

// install
- install(TARGETS latency
        RUNTIME DESTINATION bin     # 可执行文件的目标路径为 bin
        LIBRARY DESTINATION lib     # 库文件的目标路径为 lib
        ARCHIVE DESTINATION lib)    # 归档文件的目标路径为lib //归档文件是什么？
- CMAKE_INSTALL_PREFIX为/usr/local， 那么上面的路径前面加上这个
- install(FILES ${MATH_LIB_HEADERS} DESTINATION include/math) #安装头文件

// why
- cmake ..
- make

