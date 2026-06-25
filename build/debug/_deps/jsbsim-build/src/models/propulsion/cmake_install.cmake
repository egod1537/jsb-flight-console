# Install script for directory: /home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/JSBSim/models/propulsion" TYPE FILE FILES
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGElectric.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGEngine.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGForce.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGNozzle.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGPiston.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGPropeller.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGRocket.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGTank.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGThruster.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGTurbine.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGTurboProp.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGTransmission.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGRotor.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/propulsion/FGBrushLessDCMotor.h"
    )
endif()

