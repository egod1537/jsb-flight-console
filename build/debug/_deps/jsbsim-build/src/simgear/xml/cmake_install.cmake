# Install script for directory: /home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/JSBSim/simgear/xml" TYPE FILE FILES
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/easyxml.hxx"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/ascii.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/asciitab.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/expat.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/expat_external.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/iasciitab.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/internal.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/latin1tab.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/macconfig.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/nametab.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/utf8tab.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/winconfig.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/xmlrole.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/xmltok.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/xmltok_impl.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/xmltok_impl.c"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/xmltok_ns.c"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/expat_config.h"
    "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src/src/simgear/xml/siphash.h"
    )
endif()

