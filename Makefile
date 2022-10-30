objects = main.o chunk.o debug.o \
          memory.o value.o 

main : $(objects)
	gcc -o main $(objects)
main.o : chunk.h common.h debug.h
	gcc -c main.c

chunk.o : memory.h
	gcc -c chunk.c

debug.o : debug.h value.h
	gcc -c debug.c

memory.o : memory.h
	gcc -c memory.c

value.o : memory.h value.h
	gcc -c value.c

.PHONY : clean
clean :
	-rm *.o *.i *.s *.bc main
