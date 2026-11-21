CC = gcc
CFLAGS = -Wall -g -save-temps
TARGET = build/calcul

all: $(TARGET)

$(TARGET): build/main.o build/math.o
	$(CC) $^ -o $@

build/main.o: src/main.c src/math.h
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

build/math.o: src/math.c src/math.h
	mkdir -p build
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build *.i *.s
