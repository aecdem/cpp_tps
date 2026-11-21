CC = gcc
CFLAGS = -Wall -Wextra
TARGET = build/hello

all: $(TARGET)

$(TARGET): src/main.c
	$(CC) $(CFLAGS) -o $(TARGET) src/main.c

clean:
	rm -f $(TARGET)
