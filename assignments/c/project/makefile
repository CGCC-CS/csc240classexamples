CC=gcc 
CFLAGS=-Wall -pedantic --std=c11

all: project.c term.o polynomial.o basiclist.o
	$(CC) $(CFLAGS) project.c term.o polynomial.o basiclist.o -o project

term.o: term.c
	$(CC) $(CFLAGS) -c term.c

polynomial.o: polynomial.c
	$(CC) $(CFLAGS) -c polynomial.c

basiclist.o: basiclist.c
	$(CC) $(CFLAGS) -c basiclist.c

clean:
	rm -f *.o *.out project *~ project.exe
