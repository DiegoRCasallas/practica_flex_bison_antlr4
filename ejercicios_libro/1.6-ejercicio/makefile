calc: escaner.l parser.y
	bison -d parser.y
	flex escaner.l
	gcc -o calc lex.yy.c parser.tab.c -lfl		
