##Usage - 

1. Install flex or a compatible yacc parser software
2. To run the file type these commands in order
```
	lex proj.l
	yacc -d proj.y
	cc lex.yy.c y.tab.c -ll
	./a.out
```
3. This yacc parser would validate a SWIFT language assignment operation like
```var x=5```
or arithmetic operations like
```var z=5+9```
Also validate a ```for index in 1...5``` statement and a repeat while statement