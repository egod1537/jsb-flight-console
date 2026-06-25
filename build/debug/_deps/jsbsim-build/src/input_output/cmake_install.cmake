# Install script for directory: /home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/JSBSim/input_output" TYPE FILE FILES
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGGroundCallback.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGPropertyManager.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGScript.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGXMLElement.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGXMLParse.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGfdmSocket.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGXMLFileRead.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/net_fdm.hxx"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/string_utilities.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGOutputType.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGOutputFG.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGOutputSocket.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGOutputFile.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGOutputTextFile.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGPropertyReader.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGModelLoader.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGInputType.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGInputSocket.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGUDPInputSocket.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/input_output/FGLog.h"
    )
endif()

