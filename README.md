# v-blend2d-test
 Prerequisite tests to make a blend2d wrapper in V.

### Prerequisites
* [V](https://vlang.io/)
* C++ compiler
* [cmake](https://cmake.org/download/)
### Instructions
```
cd ./blend2d/build
cmake ../c -DCMAKE_BUILD_TYPE=Release -DASMJIT_DIR="../asmjit" -DCMAKE_C_STANDARD=99 -DCMAKE_C_FLAGS="-std=gnu99 ${CMAKE_C_FLAGS}"
cmake --build . --config Release

cd ../..
v ./v-blend2d-test.v -show-c-output -showcc
```