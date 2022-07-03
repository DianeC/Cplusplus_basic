cmake_minimum_required(VERSION 2.8)
project(plus)

# header
set(HEADER my_math.h)
include_directories(HEADER)

#src
set(SRC my_math.cpp)

#lib
add_library(my_math SHARD
    ${SRC}
)

# exec
add_excutable(run_my_math
    main.cpp
)

target_link_libraries(run_my_math
    my_math
)
