CC = gcc
CFLAGS = -Wall -Werror -Wextra -pedantic -std=c99 -g
SOURCES = API2024Parte2.c auxFunciones.c sort.c ../parte-1/APIG24.c main.c
OBJECTS = $(SOURCES:.c=.o)
TARGET = dictionary

.PHONY: clean

all: $(TARGET)

$(TARGET): $(OBJECTS)
    $(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS) $(LFLAGS) $(LIBS)

.c.o:
    $(CC) $(CFLAGS) -c $< -o $@

clean:
    $(RM) $(OBJECTS) $(TARGET)