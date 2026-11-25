# TP 7 - Cmake

## Compile with gcc

```bash
cmake -S . -B build_gcc -DCMAKE_C_COMPILER=gcc
cmake --build build_gcc
./build_gcc/out/bin/app
```


## Compile with clang
```bash
cmake -S . -B build_clang -DCMAKE_C_COMPILER=clang
cmake --build build_clang
./build_clang/out/bin/app
```
