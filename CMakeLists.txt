cmake_minimum_required(VERSION 2.8)

project(cmake-findwhloc)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
find_package( Hwloc )

message(STATUS "Hwloc found: ${Hwloc_FOUND}")
message(STATUS "Hwloc include dirs: ${Hwloc_INCLUDE_DIRS}")
message(STATUS "Hwloc libraries: ${Hwloc_LIBRARIES}")
message(STATUS "Hwloc version: ${Hwloc_VERSION_STRING}")
