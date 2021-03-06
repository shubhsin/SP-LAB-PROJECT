%{
#include "y.tab.h"
#include <string.h>
// extern char varstr[50];
extern yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;}
"let" {return LETKEY;}
"var" {return VARKEY;}
"print" {return PRINTKEY;}
[" "]	{return WHITESPACE;}
"for" {return FORKEY;}
"repeat" {return REPEAT;}
"while"	 {return WHILE;}
"index" {return INDEXKEY;}
"..."	{return INDEXDOT;}
"in"	{return INKEY;}
"("		{return OB;}
")"		{return CB;}
"{"		{return OC;}
"}"		{return CC;}
(>)|(<)|(==)|(!=)	{return RELOP;}
[a-z] {yylval=yytext[0]-'a'; return NAME;}
[A-Za-z]+ {return STRING;}
'$' {return 0;}
\n {return ENTER;}
. {return yytext[0];}


