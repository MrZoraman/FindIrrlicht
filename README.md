# FindIrrlicht
CMake module to find [Irrlicht](http://irrlicht.sourceforge.net/).

Disclaimer: I am still new to CMake, and this is the first CMake module I've ever written. It is possible that
this file is quite flawed. Feedback is appreciated.

For now it just works with windows. I'll update this when I have access to a mac system of a linux system that's not headless.

(For windows), it expects the [irrlicht sdk](http://irrlicht.sourceforge.net/?page_id=10) to be installed somewhere on the system.
For me, it is in `C:/lib/irrlicht-1.8.4`. This find module expects a `IRRLICHT_ROOT_DIR` variable to be set to the root irrlicht
folder. This would mean that my `IRRLICHT_ROOT_DIR` would be `C:/lib/irrlicht-1.8.4`.

From there, `Irrlicht_FOUND`, `IRRLICHT_INCLUDE_DIR` and `IRRLICHT_LIBRARY` are defined. A basic cmake file using this module would look like:

```cmake
cmake_minimum_required(VERSION 2.8.12)
project(irrlicht_cmake)

find_package(Irrlicht REQUIRED)

include_directories(${IRRLICHT_INCLUDE_DIR})

add_executable(irrlicht_cmake main.cpp)
target_link_libraries(irrlicht_cmake ${IRRLICHT_LIBRARY})
```

This is assuming FindIrrlicht.cmake is in your `CMAKE_MODULE_PATH`. You might want put `FindIrrlicht.cmake` in a 
folder called `CMake` and add this before `find_package`:

```cmake
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")
```

If Irrlicht is successfully found, `Irrlicht_FOUND` will bet set to `TRUE`.
