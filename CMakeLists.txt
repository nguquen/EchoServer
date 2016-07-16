cmake_minimum_required(VERSION 3.5)
project(EchoServer)

set(SOURCE_FILES
    Sources
    Packages
    Tests
    Package.swift)

add_custom_target(EchoServer
        COMMAND /home/nguquen/Apps/swift-3.0-PREVIEW-2-ubuntu15.10/usr/bin/swift build -Xcc -fblocks
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES ${SOURCE_FILES})
