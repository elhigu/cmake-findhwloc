Cross platform  FindHwloc.cmake
================================

Finds out if hwloc is available and suggests how to get it for your platform.
(e.g. download binary distribution for Windows and setup HwlocROOT env variable)

## Try it out

```
git clone https://github.com/elhigu/cmake-findhwloc.git
mkdir build
cd build
cmake ../cmake-findhwloc
```

or in Windows you would probably use Visual Studio...

```
cmake -G "Visual Studio 12" ../cmake-findhwloc
cmake -G "Visual Studio 12 Win64" ../cmake-findhwloc
```

To define where to find headers and libraries you can manually
give Hwloc_INCLUDE_DIRS and Hwloc_LIBRARIES environment variables.