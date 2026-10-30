cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    dtripper64
    VERSION 0.1.0
    DESCRIPTION "Disk Trash Ripper"
    HOMEPAGE_URL "https://github.com/lazerno/dtripper64"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    dtripper64_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    dtripper64_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(dtripper64_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(dtripper64_exe source/main.cpp)
add_executable(dtripper64::exe ALIAS dtripper64_exe)

set_property(TARGET dtripper64_exe PROPERTY OUTPUT_NAME dtripper64)

target_compile_features(dtripper64_exe PRIVATE cxx_std_20)

target_link_libraries(dtripper64_exe PRIVATE dtripper64_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT dtripper64_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of dtripper64"
  )
endif()

include(cmake/dev-mode.cmake)
