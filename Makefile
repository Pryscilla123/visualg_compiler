run:
	./msm_scaner.exe

compilar: clean comp_bison comp_flex
	gcc scanner.yy.c scanner.tab.c -lfl -o scanner.exe

comp_bison:
	bison -d -v scanner.y

comp_flex:
	flex -o scanner.yy.c scanner.l

clean:
	rm -f *.exe *.output *.tab.* *.yy.c

zip:
	tar -czvf ‘(date +%y-%m-%d-%H-%M-%S)‘.tar.gz Makefile *.l *.y