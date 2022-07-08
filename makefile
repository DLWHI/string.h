CCF:= gcc -Wall -Wextra -Werror -std=c11

SRC_PATH:= ./src
OBJ_PATH:= ./obj

TARGET_FILES:= s21_string_io.c \
			   s21_string_special.c \
			   s21_string.c
TEST_FILE:= $(SRC_PATH)/s21_string_tests.c
EXE:= tests.out
LIBNAME:= s21_string.a

all: s21_string.a test gcov_report

test: s21_string.a
	$(CCF) $(TEST_FILE) $(LIBNAME) -coverage -o $(EXE) -lcheck

s21_string.a:
	cd $(SRC_PATH) && $(CCF) -c $(TARGET_FILES)
	mv $(SRC_PATH)/*.o $(OBJ_PATH)
	cd $(OBJ_PATH) && ar rcs ../$(LIBNAME) $(TARGET_FILES:.c=.o)
	ranlib s21_string.a

gcov_report: test
	./$(EXE)
	gcov *.gcda
	geninfo ./ -b ./ -o report.info
	genhtml -o report report.info;
	rm -rf *.info *.gcda *.gcno

check: test
	cp ../materials/linters/cpplint.py ./cpplint.py
	cp ../materials/linters/CPPLINT.CFG ./CPPLINT.CFG
	python3 cpplint.py *.c
	python3 cpplint.py *.h
	leaks -atExit -- ./test.out 
clean:
	rm -rf *.info *.gcda *.gcno report *.out *.a *.gcov
	rm -rf report a.out.dsym CPPLINT.CFG cpplint.py *.dSYM
	rm -rf $(OBJ_PATH)/*.o
