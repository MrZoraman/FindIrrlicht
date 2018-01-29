# Copyright (c) 2018 MrZoraman
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# 

if(MSVC)
    if("${CMAKE_GENERATOR}" MATCHES "(Win64|IA64)")
        set(IRRLICHT_ARCH "Win64-visualStudio")
    else()
        set(IRRLICHT_ARCH "Win32-visualstudio")
    endif()
else()
    message(FATAL_ERROR "Non-Windows not supported yet!")
endif()

find_path(IRRLICHT_ROOT_DIR "include/Irrlicht.h"
    DOC "Irrlicht root directory"
)

if(IRRLICHT_ROOT_DIR)
    set(IRRLICHT_INCLUDE_DIR "${IRRLICHT_ROOT_DIR}/include")

    find_library(IRRLICHT_LIBRARY NAMES "Irrlicht.lib"
        HINTS "${IRRLICHT_ROOT_DIR}/lib/${IRRLICHT_ARCH}"
    )
    
    mark_as_advanced(IRRLICHT_ROOT_DIR IRRLICHT_INCLUDE_DIR IRRLICHT_LIBRARY)
endif()

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Irrlicht REQUIRED_VARS IRRLICHT_ROOT_DIR IRRLICHT_INCLUDE_DIR IRRLICHT_LIBRARY)
