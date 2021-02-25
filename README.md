# v-blend2d-test
 Prerequisite tests to make a blend2d wrapper in V.

### Prerequisites
* [V](https://vlang.io/)
* C++ compiler
* [cmake](https://cmake.org/download/)
### Instructions
```
cd ./blend2d/build
cmake ../c -DCMAKE_BUILD_TYPE=Release -DASMJIT_DIR="../asmjit" -DCMAKE_C_STANDARD=99 -DCMAKE_C_FLAGS="-std=gnu99" -DBLEND2D_STATIC=ON
cmake --build . --config Release

cd ../..
v ./v-blend2d-test.v -show-c-output -showcc
```

If the above does not work:
1. Make note of the exact compiler, compiler version, and target architecture when you run `v`.
2. Run `cmake --help`. Copy the full compiler name matching the details from (1.).
3. Navigate to the build directory and run `cmake -G "[compiler name]" ../c -DCMAKE_BUILD_TYPE=Release -DASMJIT_DIR="../asmjit" -DCMAKE_C_STANDARD=99 -DCMAKE_C_FLAGS="-std=gnu99" -DBLEND2D_STATIC=ON`, replaceing `[compiler name]` with the copied name from (2.), including the matching architecture.
4. Run the remaining commands, appending `-cc [compiler]` to the v command. `[compiler]` should match the compiler specified in (3.) - `tcc`, `gcc`, `msvc`, or a direct path to the compiler.

### Misc. Notes

IDEs such as Visual Studio or Xcode require `--config Release`. Other IDEs/compilers require `-DCMAKE_BUILD_TYPE=Release`.
GNU compilers prior to Cmake 3.1 require `-DCMAKE_C_FLAGS="-std=gnu99"`. All other compilers require `-DCMAKE_C_STANDARD=99`. (gnu99 is the C standard used by V).

To look into: Make a v build script to detect the platform and build automatically.
