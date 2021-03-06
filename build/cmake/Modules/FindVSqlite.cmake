#
# - Find vsqlite
# Find the native VSQLITE includes and library
#
#  VSQLITE_INCLUDE_DIRS - where to find sqlite/connection.hpp, etc.
#  VSQLITE_LIBRARIES    - List of libraries when using pcre.
#  VSQLITE_FOUND        - True if pcre found.


IF (VSQLITE_INCLUDE_DIRS)
  # Already in cache, be silent
  SET(VSQLITE_FIND_QUIETLY TRUE)
ENDIF (VSQLITE_INCLUDE_DIRS)

FIND_PATH(VSQLITE_INCLUDE_DIR sqlite/connection.hpp)

SET(VSQLITE_NAMES vsqlitepp)
IF (VSQLITE_LIBRARIES)
  FIND_LIBRARY(VSQLITE_LIBRARY NAMES ${VSQLITE_NAMES} HINTS ${VSQLITE_LIBRARIES})
ELSE()
  FIND_LIBRARY(VSQLITE_LIBRARY NAMES ${VSQLITE_NAMES} )
ENDIF()

# handle the QUIETLY and REQUIRED arguments and set VSQLITE_FOUND to TRUE if 
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(VSQLITE DEFAULT_MSG VSQLITE_LIBRARY VSQLITE_INCLUDE_DIR)

IF(VSQLITE_FOUND)
  SET( VSQLITE_LIBRARIES ${VSQLITE_LIBRARY} )
  SET( VSQLITE_INCLUDE_DIRS ${VSQLITE_INCLUDE_DIR} )
ELSE(VSQLITE_FOUND)
  SET( VSQLITE_LIBRARIES )
  SET( VSQLITE_INCLUDE_DIRS )
ENDIF(VSQLITE_FOUND)

MARK_AS_ADVANCED( VSQLITE_LIBRARIES VSQLITE_INCLUDE_DIRS )
