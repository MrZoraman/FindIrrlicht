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
