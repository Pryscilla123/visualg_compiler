PROG=scanner

run: compilar
	./${PROG}.exe

compilar: clean scanner
	gcc -o ${PROG}.exe ${PROG}.yy.c -std=c89 -lfl

scanner:
	flex -o ${PROG}.yy.c ${PROG}.l
	
clean:
	rm -f *.exe *.yy.c