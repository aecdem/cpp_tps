CC = gcc
COMMON_FLAGS = -Wall -Wextra

DEBUG_DIR = build/debug
RELEASE_DIR = build/release

DEBUG_FLAGS = $(COMMON_FLAGS) -g -O0
RELEASE_FLAGS = $(COMMON_FLAGS) -O2 -DNDEBUG

DEBUG_TARGET = $(DEBUG_DIR)/calcul
RELEASE_TARGET = $(RELEASE_DIR)/calcul

HDRS = src/math.h

DEBUG_OBJS = $(DEBUG_DIR)/main.o $(DEBUG_DIR)/math.o
RELEASE_OBJS = $(RELEASE_DIR)/main.o $(RELEASE_DIR)/math.o

.PHONY: all debug release clean

all: debug

debug: $(DEBUG_TARGET)

release: $(RELEASE_TARGET)

$(DEBUG_TARGET): $(DEBUG_OBJS)
	$(CC) $^ -o $@

$(RELEASE_TARGET): $(RELEASE_OBJS)
	$(CC) $^ -o $@

$(DEBUG_DIR)/%.o: src/%.c $(HDRS)
	mkdir -p $(DEBUG_DIR)
	$(CC) $(DEBUG_FLAGS) -c $< -o $@

$(RELEASE_DIR)/%.o: src/%.c $(HDRS)
	mkdir -p $(RELEASE_DIR)
	$(CC) $(RELEASE_FLAGS) -c $< -o $@

clean:
	rm -rf build *.i *.s
