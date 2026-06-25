# Install script for directory: /home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-build/src/models/atmosphere/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-build/src/models/propulsion/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-build/src/models/flight_control/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/JSBSim/models" TYPE FILE FILES
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGAerodynamics.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGAircraft.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGAtmosphere.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGAuxiliary.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGFCS.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGSurface.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGGroundReactions.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGInertial.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGLGear.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGMassBalance.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGModel.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGOutput.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGPropagate.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGPropulsion.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGInput.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGExternalReactions.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGExternalForce.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGBuoyantForces.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGGasCell.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGAccelerations.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/FGFCSChannel.h"
    )
endif()

