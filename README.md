# string.h
Almost full implementation of &lt;string.h> library in C
# General info
This project was made under educational program of School 21. This library mimics almost full functionality of original <string.h> library of C. 
Code behaviour is based on original <string.h> functions of Clang compiler(which is used on school PCs).
# Supported functions
#### Memory functions:
- `void *s21_memchr(const void *str, int c, s21_size_t n);`
- `int s21_memcmp(const void *str1, const void *str2, s21_size_t n);`
- `void *s21_memcpy(void *dest, const void *src, s21_size_t n);`
- `void *s21_memmove(void *dest, const void *src, s21_size_t n);`
- `void *s21_memset(void *str, int c, s21_size_t n);`  
#### String functions:
- `s21_size_t s21_strlen(const char *str);`
- `char *s21_strcat(char *dest, const char *src);`
- `char *s21_strncat(char *dest, const char *src, s21_size_t n);`
- `char *s21_strchr(const char *str, int c);`
- `char *s21_strrchr(const char *str, int c);`
- `int s21_strcmp(const char *str1, const char *str2);`
- `int s21_strncmp(const char *str1, const char *str2, s21_size_t n);`
- `char *s21_strcpy(char *dest, const char *src);`
- `char *s21_strncpy(char *dest, const char *src, s21_size_t n);`
- `s21_size_t s21_strcspn(const char *str1, const char *str2);`
- `s21_size_t s21_strspn(const char *str1, const char *str2);`
- `char *s21_strpbrk(const char *str1, const char *str2);`
- `char *s21_strerror(int errnum);`
- `const char *s21_strstr(const char *haystack, const char *needle);`
- `char *s21_strtok(char *str, const char *delim);`  
#### I/O functions:
- `int s21_sprintf(char *str, const char *format, ...);`
- `int s21_sscanf(const char *str, const char *format, ...);`  
#### Extra functions from C# libs:
- `void* s21_to_upper(const char *str);`
- `void* s21_to_lower(const char *str);`
- `void* s21_insert(const char *src, const char *str, s21_size_t start_index);`
- `void* s21_trim(const char *src, const char *trim_chars);`
# Built-in tests
Each module of library has been tested separately with all edge cases. The behaviour of some tests(strerror, sprintf) may differ on target machine therefore they may fail. Particularly, sprintf fails on edge and abnormal cases beacuse of compilers treating overflow differently(ex. gcc v12 on my machine does not let overflow to happen while clang on campus' machines writes value with overflow).
# Build
- `make s21_string.a` - Builds library.
- `make test` - Compiles built-in tests (and builds library if needed).
- `make gcov_report` - Runs built-in tests, outputs gcov report and makes nice html report out of it (and builds any of the above if needed).
- `make all` - Runs all of the above
- `make clean` - Cleans up project dir
# TODO
- Make tests crossplatform
- Add windows errno support
