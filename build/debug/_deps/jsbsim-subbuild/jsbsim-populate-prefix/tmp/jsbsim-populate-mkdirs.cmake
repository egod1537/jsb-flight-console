# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-src"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-build"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/tmp"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/src/jsbsim-populate-stamp"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/src"
  "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/src/jsbsim-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/src/jsbsim-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/yang/proj/jsb-flight-console/build/debug/_deps/jsbsim-subbuild/jsbsim-populate-prefix/src/jsbsim-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
