cmake_minimum_required(VERSION 3.28)

project(
  jsb-flight-console
  LANGUAGES CXX
)

include(FetchContent)

FetchContent_Declare(
  jsbsim
  GIT_REPOSITORY https://github.com/JSBSim-Team/jsbsim.git
  GIT_TAG v1.3.0
)

FetchContent_MakeAvailable(jsbsim)

add_executable(
  jsb-flight-console
  src/main.cpp
)

target_compile_features(
  jsb-flight-console
  PRIVATE
  cxx_std_20
)

target_link_libraries(
  jsb-flight-console
  PRIVATE
  libJSBSim
)
