# Find the following numeric libraries
# + SuiteSparse
# + Metis
# + MKL
# It sets the following variables
# NUMERIC_LIBRARIES     - library names
# NUMERIC_INCLUDE_DIRS  - path to all NUMERIC library files
#
# Example:
# FIND_PACKAGE(NumericLibraries)
# INCLUDE_DIRECTORIES(${NUMERIC_INCLUDE_DIRS})
# LINK_DIRECTORIES(${NUMERIC_LIBRARY_DIRS})
# TARGET_LINK_LIBRARIES(LibName ${NUMERIC_LIBRARIES})

SET(NUMERIC_LIBRARIES "")
SET(NUMERIC_INCLUDE_DIRS "")
SET(NUMERIC_LIBRARY_DIRS "")

# SuiteSparse
IF ((DEFINED ENV{SUITESPARSE_LIB}) AND (DEFINED ENV{SUITESPARSE_INC}))
    #MESSAGE("SuiteSparse")
    SET(LIBRARIES amd camd colamd ccolamd cholmod umfpack suitesparseconfig)
    LIST(APPEND NUMERIC_LIBRARIES amd camd colamd ccolamd umfpack suitesparseconfig cholmod)
    LIST(APPEND NUMERIC_LIBRARY_DIRS $ENV{SUITESPARSE_LIB})
    LIST(APPEND NUMERIC_INCLUDE_DIRS $ENV{SUITESPARSE_INC})
ELSE ((DEFINED ENV{SUITESPARSE_LIB}) AND (DEFINED ENV{SUITESPARSE_INC}))
    FIND_PACKAGE("Umfpack")
    LIST(APPEND NUMERIC_LIBRARIES ${UMFPACK_LIBRARIES})
    LIST(APPEND NUMERIC_INCLUDE_DIRS ${UMFPACK_INCLUDES})
ENDIF ((DEFINED ENV{SUITESPARSE_LIB}) AND (DEFINED ENV{SUITESPARSE_INC}))

# MKL
IF ((DEFINED ENV{MKL_LIB}) AND (DEFINED ENV{MKL_INC}))
    #MESSAGE("MKL")
    LIST(APPEND NUMERIC_LIBRARIES mkl_intel_lp64 mkl_core mkl_intel_thread rt)
    LIST(APPEND NUMERIC_LIBRARY_DIRS $ENV{MKL_LIB})
    LIST(APPEND NUMERIC_INCLUDE_DIRS $ENV{MKL_INC})
ENDIF ((DEFINED ENV{MKL_LIB}) AND (DEFINED ENV{MKL_INC}))

# Metis
IF ((DEFINED ENV{METIS_LIB}) AND (DEFINED ENV{METIS_INC}))
    #MESSAGE("Metis")
    LIST(APPEND NUMERIC_LIBRARIES metis)
    LIST(APPEND NUMERIC_LIBRARY_DIRS $ENV{METIS_LIB})
    LIST(APPEND NUMERIC_INCLUDE_DIRS $ENV{METIS_INC})
ENDIF ((DEFINED ENV{METIS_LIB}) AND (DEFINED ENV{METIS_INC}))

## Debug
#MESSAGE(${NUMERIC_LIBRARIES})
#MESSAGE(${NUMERIC_INCLUDE_DIRS})
