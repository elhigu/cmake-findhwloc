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
