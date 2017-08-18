include( ExternalProject )

set( CMAKE_MODULE_PATH
     ${CMAKE_CURRENT_LIST_DIR}
     ${CMAKE_MODULE_PATH} )

set( SB_INSTALL_DIR ${CMAKE_BINARY_DIR}/install CACHE PATH
     "Directory where SuperBuild will install dependencies." )

 set( SB_INCLUDE_DIR ${SB_INSTALL_DIR}/include )

# Initialize usefull variables to build a superbuild project
macro(SETUP_SUPERBUILD)
  cmake_parse_arguments(NEW_SB "" "PROJECT" "" ${ARGN})
  set( ${NEW_SB_PROJECT}_DEPENDENCIES "" )
  set( ${NEW_SB_PROJECT}_SB_BUILD_DIR ${CMAKE_BINARY_DIR}/${NEW_SB_PROJECT}/build )
  set( ${NEW_SB_PROJECT}_SB_SRC ${CMAKE_BINARY_DIR}/${NEW_SB_PROJECT}/src/${NEW_SB_PROJECT} )
  set( ${NEW_SB_PROJECT}_SB_CONFIG "" )
endmacro(SETUP_SUPERBUILD)
