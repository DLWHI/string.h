# string.h
Almost full implementation of &lt;string.h> library in C
# General info
This project was made under educational program of School 21. This library mimics almost full functionality of original <string.h> library of C. 
Code behaviour is based on original <string.h> functions of Clang compiler(which is used on school PCs).
# Build
- `make s21_string.a` - Builds library.
- `make test` - Compiles built-in tests (and builds library if needed).
- `make gcov_report` - Outputs gcov report and makes nice html report out of it (and builds any of the above if needed).
- `make all` - Runs all of the above
- `make clean` - Cleans up project dir
# TODO
- Make tests crossplatform
- Add windows errno support
