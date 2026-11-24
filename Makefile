CC = gcc
COMMON_FLAGS = -Wall -Wextra -Isrc/app -Isrc/lib/dynamicCalculator -Isrc/lib/staticCalculator

DEBUG_DIR = build/debug
RELEASE_DIR = build/release

DEBUG_FLAGS = $(COMMON_FLAGS) -g -O0
RELEASE_FLAGS = $(COMMON_FLAGS) -O2 -DNDEBUG

DYN_LIB = src/lib/dynamicCalculator/libdynamicCalculator.so
STA_LIB = src/lib/staticCalculator/libstaticCalculator.a

TARGET = bin/app
LDFLAGS = -Lsrc/lib/dynamicCalculator -ldynamicCalculator -Lsrc/lib/staticCalculator -lstaticCalculator

APP_SRCS = src/app/main.c src/app/math.c
DEBUG_OBJS = $(DEBUG_DIR)/main.o $(DEBUG_DIR)/math.o
RELEASE_OBJS = $(RELEASE_DIR)/main.o $(RELEASE_DIR)/math.o

.PHONY: all debug release libs run clean

all: debug

libs: $(DYN_LIB) $(STA_LIB)

$(DYN_LIB): src/lib/dynamicCalculator/dynamic_math.c src/lib/dynamicCalculator/dynamic_math.h
	mkdir -p $(DEBUG_DIR)
	$(CC) $(COMMON_FLAGS) -fPIC -c $< -o $(DEBUG_DIR)/dynamic_math.o
	$(CC) -shared $(DEBUG_DIR)/dynamic_math.o -o $@

$(STA_LIB): src/lib/staticCalculator/static_math.c src/lib/staticCalculator/static_math.h
	mkdir -p $(DEBUG_DIR)
	$(CC) $(COMMON_FLAGS) -c $< -o $(DEBUG_DIR)/static_math.o
	ar rcs $@ $(DEBUG_DIR)/static_math.o

$(DEBUG_DIR)/main.o: src/app/main.c src/app/math.h src/lib/dynamicCalculator/dynamic_math.h src/lib/staticCalculator/static_math.h
	mkdir -p $(DEBUG_DIR)
	$(CC) $(DEBUG_FLAGS) -c $< -o $@

$(DEBUG_DIR)/math.o: src/app/math.c src/app/math.h
	mkdir -p $(DEBUG_DIR)
	$(CC) $(DEBUG_FLAGS) -c $< -o $@

$(RELEASE_DIR)/main.o: src/app/main.c src/app/math.h src/lib/dynamicCalculator/dynamic_math.h src/lib/staticCalculator/static_math.h
	mkdir -p $(RELEASE_DIR)
	$(CC) $(RELEASE_FLAGS) -c $< -o $@

$(RELEASE_DIR)/math.o: src/app/math.c src/app/math.h
	mkdir -p $(RELEASE_DIR)
	$(CC) $(RELEASE_FLAGS) -c $< -o $@

debug: $(DYN_LIB) $(STA_LIB) $(DEBUG_OBJS)
	mkdir -p bin
	$(CC) $(DEBUG_OBJS) $(LDFLAGS) -o $(TARGET)

release: $(DYN_LIB) $(STA_LIB) $(RELEASE_OBJS)
	mkdir -p bin
	$(CC) $(RELEASE_OBJS) $(LDFLAGS) -o $(TARGET)

run: debug
	LD_LIBRARY_PATH=src/lib/dynamicCalculator ./$(TARGET)

clean:
	rm -rf build bin $(DYN_LIB) $(STA_LIB) *.i *.s
