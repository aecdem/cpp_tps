CC = gcc
CFLAGS = -Wall -Wextra
TARGET = hello

all: $(TARGET)

$(TARGET): main.c
	$(CC) $(CFLAGS) -o $(TARGET) main.c

clean:
	rm -f $(TARGET)
