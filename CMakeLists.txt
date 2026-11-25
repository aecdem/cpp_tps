cmake_minimum_required(VERSION 3.16)
project(TP7_Calclculator LANGUAGES C)


set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)


# Output folders for libs and binarie
set(OUT_LIB_DIR "${CMAKE_BINARY_DIR}/out/lib")
set(OUT_BIN_DIR "${CMAKE_BINARY_DIR}/out/bin")

# CLeaning output folders after evry compilation
add_custom_target(clean_outputs
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${OUT_LIB_DIR}"
    COMMAND ${CMAKE_COMMAND} -E remove_directory "${OUT_BIN_DIR}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_LIB_DIR}"
    COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_BIN_DIR}"
    COMMENT "Cleaning output folder (lib & bin)..."
)

# 1. Static lib (.a)
add_library(staticCalculator STATIC
    src/lib/staticCalculator/static_math.c
)
target_include_directories(staticCalculator PUBLIC
    src/lib/staticCalculator
)
set_target_properties(staticCalculator PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${OUT_LIB_DIR}"
)

# 2. Dynamic libs (.so)
add_library(dynamicCalculator SHARED
    src/lib/dynamicCalculator/dynamic_math.c
)
target_include_directories(dynamicCalculator PUBLIC
    src/lib/dynamicCalculator
)
set_target_properties(dynamicCalculator PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY "${OUT_LIB_DIR}"
)


# 3. Executable
add_executable(app
    src/app/main.c
    src/app/math.c
)
target_include_directories(app PRIVATE
    src/app
)
target_link_libraries(app PRIVATE
    staticCalculator
    dynamicCalculator
)
set_target_properties(app PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${OUT_BIN_DIR}"
    BUILD_RPATH "${OUT_LIB_DIR}"
)

# Force cleaning before evry compilation
add_dependencies(staticCalculator clean_outputs)
add_dependencies(dynamicCalculator clean_outputs)
add_dependencies(app clean_outputs)