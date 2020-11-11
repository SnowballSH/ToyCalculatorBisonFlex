rule: lex.l grammar.y
			bison -d grammar.y
			flex lex.l
			cc -w -o calc.exe grammar.tab.c lex.yy.c

run: 
			cc -w -o calc.exe grammar.tab.c lex.yy.c
