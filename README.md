Cross platform  FindHwloc.cmake
================================

Finds out if hwloc is available and suggests how to get it for your platform.
(e.g. download binary distribution for Windows and setup HWLOC_ROOT env variable)

On Windows macro tries to find static library, so you won't need to install any
extra dlls.

## Try it out

```
git clone https://github.com/elhigu/cmake-findhwloc.git
mkdir build
cd build
cmake ../cmake-findhwloc
```

In Windows you would probably use Visual Studio:

1. Download binary package for Windows from http://www.open-mpi.org/software/hwloc/v1.9/
2. Setup your HWLOC_ROOT environment variable to where your library is

```
cmake -G "Visual Studio 12" ../cmake-findhwloc
cmake -G "Visual Studio 12 Win64" ../cmake-findhwloc
```

To define where to find headers and libraries you can manually
give Hwloc_INCLUDE_DIRS and Hwloc_LIBRARIES environment variables.