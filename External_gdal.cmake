ExternalProject_Add(gdal
   PREFIX gdal
   DEPENDS geos
   URL "http://download.osgeo.org/gdal/2.1.3/gdal213.zip"
   CONFIGURE_COMMAND LD_LIBRARY_PATH=${DEP_INSTALL_DIR}/lib <SOURCE_DIR>/configure --prefix=${DEP_INSTALL_DIR} --with-geos=${DEP_INSTALL_DIR}/bin/geos-config
   BUILD_IN_SOURCE 1
   BUILD_COMMAND $(MAKE)
   INSTALL_COMMAND $(MAKE) install
   INSTALL_DIR ${DEP_INSTALL_DIR}
   DOWNLOAD_DIR ${DEP_DOWNLOAD_DIR}/gdal
)
