#.rst:
# FindHwloc
# ----------
#
# Try to find Portable Hardware Locality (hwloc) libraries.
# http://www.open-mpi.org/software/hwloc
#
# Once done this will define::
#
#   Hwloc_FOUND          - True if hwloc was found
#   Hwloc_INCLUDE_DIRS   - include directories for hwloc
#   Hwloc_LIBRARIES      - link against this library to use hwloc
#   Hwloc_VERSION_MAJOR  - The major version of the hwloc implementation
#   Hwloc_VERSION_MINOR  - The minor version of the hwloc implementation
#
# The module will also define two cache variables::
#
#   Hwloc_INCLUDE_DIR    - the hwloc include directory
#   Hwloc_LIBRARY        - the path to the hwloc library
#

#=============================================================================
# Copyright 2014 Mikael Lepistö
#
# Distributed under the OSI-approved BSD License (the "License");
# see accompanying file Copyright.txt for details.
#
# This software is distributed WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the License for more information.
#=============================================================================
# (To distribute this file outside of CMake, substitute the full
#  License text for the above reference.)

if(WIN32)
  find_path(Hwloc_INCLUDE_DIR
    NAMES
      hwloc.h
    PATHS
      ENV "PROGRAMFILES(X86)"
      ENV HWLOC_ROOT
    PATH_SUFFIXES
      include
  )

  find_library(Hwloc_LIBRARY
    NAMES 
      libhwloc.lib
    PATHS
      ENV "PROGRAMFILES(X86)"
      ENV HWLOC_ROOT
    PATH_SUFFIXES
      lib
  )
  # TODO: check that user has correct 32 or 64bit lib
  #       (can it be checked without test linking?)
  #       if(CMAKE_SIZEOF_VOID_P EQUAL 8)

  set(Hwloc_LIBRARIES ${Hwloc_LIBRARY})
  set(Hwloc_INCLUDE_DIRS ${Hwloc_INCLUDE_DIR})

  include(FindPackageHandleStandardArgs)
  find_package_handle_standard_args(
    Hwloc
    FOUND_VAR Hwloc_FOUND
    REQUIRED_VARS Hwloc_LIBRARY Hwloc_INCLUDE_DIR
    VERSION_VAR Hwloc_VERSION_STRING)

  mark_as_advanced(
    Hwloc_INCLUDE_DIR
    Hwloc_LIBRARY)

else()
  # Find with pkgconfig
  find_package(PkgConfig)

  if(HWLOC_ROOT)
    set(ENV{PKG_CONFIG_PATH} "${HWLOC_ROOT}/lib/pkgconfig")
  else()
    foreach(PREFIX ${CMAKE_PREFIX_PATH})
      set(PKG_CONFIG_PATH "${PKG_CONFIG_PATH}:${PREFIX}/lib/pkgconfig")
    endforeach()
    set(ENV{PKG_CONFIG_PATH} "${PKG_CONFIG_PATH}:$ENV{PKG_CONFIG_PATH}")
  endif()

  if(hwloc_FIND_REQUIRED)
    set(_hwloc_OPTS "REQUIRED")
  elseif(hwloc_FIND_QUIETLY)
    set(_hwloc_OPTS "QUIET")
  else()
    set(_hwloc_output 1)
  endif()

  if(hwloc_FIND_VERSION)
    if(hwloc_FIND_VERSION_EXACT)
      pkg_check_modules(HWLOC ${_hwloc_OPTS} hwloc=${hwloc_FIND_VERSION})
    else()
      pkg_check_modules(HWLOC ${_hwloc_OPTS} hwloc>=${hwloc_FIND_VERSION})
    endif()
  else()
    pkg_check_modules(HWLOC ${_hwloc_OPTS} hwloc)
  endif()

  if(HWLOC_FOUND)
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(HWLOC DEFAULT_MSG HWLOC_LIBRARIES
      HWLOC_INCLUDE_DIRS)

    if(NOT ${HWLOC_VERSION} VERSION_LESS 1.7.0)
      set(HWLOC_GL_FOUND 1)
    endif()

    if(_hwloc_output)
      message(STATUS
        "Found hwloc ${HWLOC_VERSION} in ${HWLOC_INCLUDE_DIRS}:${HWLOC_LIBRARIES}")
    endif()
  endif()
endif()

