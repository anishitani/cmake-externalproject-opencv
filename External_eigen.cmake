ExternalProject_Add(Eigen
   PREFIX Eigen
   HG_REPOSITORY "https://bitbucket.org/eigen/eigen/"
   HG_TAG 3.3.3
   BUILD_COMMAND ""
   CONFIGURE_COMMAND ""
   INSTALL_COMMAND
       ${CMAKE_COMMAND} -E copy_directory
       ${CMAKE_BINARY_DIR}/Eigen/src/Eigen/Eigen
       ${DEP_INSTALL_DIR}/include/eigen3/Eigen &&
       ${CMAKE_COMMAND} -E copy_directory
       ${CMAKE_BINARY_DIR}/Eigen/src/Eigen/unsupported
       ${DEP_INSTALL_DIR}/include/eigen3/unsupported
   DOWNLOAD_DIR ${DEP_DOWNLOAD_DIR}/<PROJECT_NAME>
)
