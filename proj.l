%{
#include "y.tab.h"
extern yylval;
%}
%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;}
"let" {return LETKEY;}
"var" {return VARKEY;}
"print" {return PRINTKEY;}
[" "]	{return WHITESPACE;}
"for" {return FORKEY;}
"index" {return INDEXKEY;}
"..."	{return INDEXDOT;}
"in"	{return INKEY;}
"("		{return OB;}
")"		{return CB;}
"{"		{return OC;}
"}"		{return CC;}
[a-z] {yylval=yytext[0]-'a'; return NAME;}
[a-z]+ {return STRING;}
'$' {return 0;}
\n {return ENTER;}
. {return yytext[0];}

