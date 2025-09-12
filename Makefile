# Cross compiler for ARM Cortex-M (example: STM32F1xx)
CC_ARM   = arm-none-eabi-gcc
CFLAGS_ARM = -mcpu=cortex-m3 -mthumb -Wall -Werror -I./src

# Host compiler (for unit testing)
CC_HOST  = gcc
CFLAGS_HOST = -Wall -Werror -I./src

# Source and output files
SRC      = src/main.c src/led.c
OBJ      = $(SRC:.c=.o)
ELF      = firmware.elf

# Test files
TEST_SRC = tests/test_led.c src/led.c
TEST_EXE = test_runner

# Default build target
all: $(ELF)

# Build firmware for ARM target
$(ELF): $(OBJ)
	$(CC_ARM) $(CFLAGS_ARM) -o $@ $^

# Compile object files
%.o: %.c
	$(CC_ARM) $(CFLAGS_ARM) -c $< -o $@

# Run unit tests (host build)
test: $(TEST_SRC)
	$(CC_HOST) $(CFLAGS_HOST) -o $(TEST_EXE) $(TEST_SRC)
	./$(TEST_EXE)

# Clean all build artifacts
clean:
	rm -f $(OBJ) $(ELF) $(TEST_EXE)

