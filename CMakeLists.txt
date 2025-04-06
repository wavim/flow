cmake_minimum_required(VERSION 3.30)
project(flow)

find_package(antlr4-runtime CONFIG REQUIRED)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(src/parser/generated)
include_directories(src/compiler)

add_executable(flowc
        src/flowc.cpp
        src/parser/generated/FlowLexer.cpp
        src/parser/generated/FlowLexer.h
        src/parser/generated/FlowParser.cpp
        src/parser/generated/FlowParser.h
        src/parser/generated/FlowParserBaseVisitor.cpp
        src/parser/generated/FlowParserBaseVisitor.h
        src/parser/generated/FlowParserVisitor.cpp
        src/parser/generated/FlowParserVisitor.h
        src/compiler/FlowCompiler.cpp
        src/compiler/FlowCompiler.h)

target_link_libraries(flowc PRIVATE antlr4_shared)