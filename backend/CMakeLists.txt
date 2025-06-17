cmake_minimum_required(VERSION 3.14)
project(HabitTracker)

set(CMAKE_CXX_STANDARD 17)

# Prevent Crow from looking for asio or ssl
set(CROW_BUILD_EXAMPLES OFF)
set(CROW_BUILD_TESTS OFF)
set(CROW_ENABLE_SSL OFF)
set(CROW_AMALGAMATE ON)

add_subdirectory(Crow)

add_executable(backend cpp/main.cpp)
add_dependencies(backend crow_amalgamated)

# Include Crow headers path
target_include_directories(backend PRIVATE ${CMAKE_SOURCE_DIR}/Crow/include)
target_include_directories(backend PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/Crow)

if(WIN32)
    target_link_libraries(backend PRIVATE ws2_32 mswsock)
endif()

target_link_libraries(backend PRIVATE Crow::Crow)

