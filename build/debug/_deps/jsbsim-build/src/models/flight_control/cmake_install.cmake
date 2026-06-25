# Install script for directory: /home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/JSBSim/models/flight_control" TYPE FILE FILES
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGDeadBand.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGFCSComponent.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGFilter.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGGain.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGKinemat.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGSummer.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGSwitch.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGFCSFunction.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGSensor.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGPID.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGActuator.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGAccelerometer.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGGyro.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGMagnetometer.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGSensorOrientation.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGAngles.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGWaypoint.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGDistributor.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/models/flight_control/FGLinearActuator.h"
    )
endif()

