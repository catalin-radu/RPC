CC = gcc
CFLAGS = -g -Wall -Wextra

SRC_DIR = src
BUILD_DIR = bin

C_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(C_FILES))

all: client server

client: $(BUILD_DIR)/client.o
	$(CC) $(LDFLAGS) -o $@ $^

server: $(BUILD_DIR)/server.o
	$(CC) $(LDFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $^

.PHONY: clean
clean:
	$(RM) client server $(OBJ_FILES)
