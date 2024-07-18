# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Iinc -Wall -Wextra -g

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
INCDIR = inc

# Source files
SRCS = $(wildcard $(SRCDIR)/*.c)

# Object files
OBJS = $(SRCS:$(SRCDIR)/%.c=$(OBJDIR)/%.o)

# Executable
TARGET = $(BINDIR)/main

# Generate dependencies
CFLAGS += -MMD

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR)
	$(CC) $(OBJS) -o $@

# Compile source files to object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Rebuild
rebuild: clean all

.PHONY: all clean rebuild

# Dependencies
-include $(OBJDIR)/*.d
