set( DEPENDENCY_NAME opencv_android )
set( DEPENDENCY_PREFIX_DIR ${CMAKE_SOURCE_DIR}/dependencies/cmake/opencv )
set( DEPENDENCY_SOURCE_DIR ${DEPENDENCY_PREFIX_DIR}/src/opencv_android )

set( ${DEPENDENCY_NAME}_core ${DEPENDENCY_SOURCE_DIR}/sdk/native/libs/${ANDROID_ABI}/libopencv_core.a )
set( ${DEPENDENCY_NAME}_imgproc ${DEPENDENCY_SOURCE_DIR}/sdk/native/libs/${ANDROID_ABI}/libopencv_imgproc.a )

set( ${DEPENDENCY_NAME}_tbb ${DEPENDENCY_SOURCE_DIR}/sdk/native/3rdparty/libs/${ANDROID_ABI}/libtbb.a )

list( APPEND DEPENDENCY_PRODUCTS
  ${${DEPENDENCY_NAME}_core}
  ${${DEPENDENCY_NAME}_imgproc}
  ${${DEPENDENCY_NAME}_tbb}
  )

if(${ANDROID_ABI} MATCHES "x86*")
  set( ${DEPENDENCY_NAME}_ippicv ${DEPENDENCY_SOURCE_DIR}/sdk/native/3rdparty/libs/${ANDROID_ABI}/libippicv.a )
  list( APPEND DEPENDENCY_PRODUCTS ${${DEPENDENCY_NAME}_ippicv} )
elseif(${ANDROID_ABI} MATCHES "arm*")
  set( ${DEPENDENCY_NAME}_tegra_hal ${DEPENDENCY_SOURCE_DIR}/sdk/native/3rdparty/libs/${ANDROID_ABI}/libtegra_hal.a )
  list( APPEND DEPENDENCY_PRODUCTS ${${DEPENDENCY_NAME}_tegra_hal} )
endif()

ExternalProject_Add(
  ${DEPENDENCY_NAME}
  PREFIX ${DEPENDENCY_PREFIX_DIR}
  URL "https://sourceforge.net/projects/opencvlibrary/files/opencv-android/3.2.0/opencv-3.2.0-android-sdk.zip"
  URL_MD5 "95690e1180f8115153543cf1c08109c8"
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
  SOURCE_DIR ${DEPENDENCY_SOURCE_DIR}
  BUILD_BYPRODUCTS ${DEPENDENCY_PRODUCTS}
)

ExternalProject_Get_Property( ${DEPENDENCY_NAME} source_dir )

# set( OPENCV_LIBRARY_FILES
#   ${source_dir}/sdk/native/libs/${ANDROID_ABI}/lib*.a
#   ${source_dir}/sdk/native/3rdparty/libs/${ANDROID_ABI}/lib*.a )

set( OPENCV_LIBRARIES_DIR ${DEPENDENCY_SOURCE_DIR}/sdk/native/libs/${ANDROID_ABI} )
set( OPENCV_3RD_PARTY_LIBRARIES_DIR ${DEPENDENCY_SOURCE_DIR}/sdk/native/libs/${ANDROID_ABI} )
set( OPENCV_INCLUDE_DIR ${DEPENDENCY_SOURCE_DIR}/sdk/native/jni/include )
