set ( SB_PROJECT GEOS )

set( GEOS_MAJOR 3 )
set( GEOS_MINOR 5 )
set( GEOS_BUILD 0 )
set( GEOS_VERSION "${GEOS_MAJOR}.${GEOS_MINOR}.${GEOS_BUILD}" )

ExternalProject_Add(
    ${SB_PROJECT}
    PREFIX ${SB_PROJECT}
    URL "https://github.com/libgeos/libgeos/archive/${GEOS_VERSION}.zip"
    INSTALL_DIR ${SB_INSTALL_DIR}
    CMAKE_CACHE_ARGS -DGEOS_ENABLE_TESTS:BOOL=OFF
)
