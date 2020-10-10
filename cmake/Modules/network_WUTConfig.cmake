INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_NETWORK_WUT network_WUT)

FIND_PATH(
    NETWORK_WUT_INCLUDE_DIRS
    NAMES network_WUT/api.h
    HINTS $ENV{NETWORK_WUT_DIR}/include
        ${PC_NETWORK_WUT_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    NETWORK_WUT_LIBRARIES
    NAMES gnuradio-network_WUT
    HINTS $ENV{NETWORK_WUT_DIR}/lib
        ${PC_NETWORK_WUT_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/network_WUTTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(NETWORK_WUT DEFAULT_MSG NETWORK_WUT_LIBRARIES NETWORK_WUT_INCLUDE_DIRS)
MARK_AS_ADVANCED(NETWORK_WUT_LIBRARIES NETWORK_WUT_INCLUDE_DIRS)
