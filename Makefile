objects = main.o chunk.o debug.o \
          memory.o value.o vm.o \
		  scanner.o compiler.o

main : $(objects)
	gcc -o main $(objects)
main.o : chunk.h common.h debug.h vm.h
	gcc -c main.c

chunk.o : memory.h
	gcc -c chunk.c

debug.o : debug.h value.h
	gcc -c debug.c

memory.o : memory.h
	gcc -c memory.c

value.o : memory.h value.h
	gcc -c value.c

vm.o : vm.h common.h debug.h compiler.h
	gcc -c vm.c
scanner.o : scanner.h common.h
	gcc -c scanner.c
compiler.o : compiler.h common.h scanner.h
	gcc -c compiler.c
.PHONY : clean
clean :
	-rm *.o *.i *.s *.bc main
