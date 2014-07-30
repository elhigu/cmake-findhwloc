cmake_minimum_required(VERSION 2.8)

project(cmake-findwhloc)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
find_package( Hwloc )

message(STATUS "Hwloc_FOUND: ${Hwloc_FOUND}")
message(STATUS "Hwloc_INCLUDE_DIRS: ${Hwloc_INCLUDE_DIRS}")
message(STATUS "Hwloc_LIBRARIES: ${Hwloc_LIBRARIES}")
message(STATUS "HHwloc_VERSION_STRING: ${Hwloc_VERSION_STRING}")
