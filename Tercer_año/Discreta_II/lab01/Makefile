CC = gcc
CFLAGS = -Wall -Wextra -O3 -std=c99

SRC = APIG24.c main.c
EXEC = main

all: clean link

objetos:
	$(CC) $(CFLAGS) -c $(SRC)

link: objetos
	$(CC) $(CFLAGS) *.o -o $(EXEC)
        
run: link
	./$(EXEC)

memory_check:
	valgrind ./$(EXEC)

clean:
	@rm -f *.o $(EXEC)









	