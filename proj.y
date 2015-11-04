%{
#include<stdio.h>
#include <string.h>
int vbltable[26];
int constable[26];
struct varstr{
	char name[10];
	char value[50];
};
int count=0;
struct varstr strings[10];

const char *a[10];

%}
%token NAME
%token <ival> NUMBER
%token ENTER
%token LETKEY
%token VARKEY
%token WHITESPACE
%token PRINTKEY
%token <strval> STRING
%token FORKEY
%token INDEXKEY
%token INDEXDOT
%token INKEY

%left '+' '-'
%left '*' '/'
%% 
stmt_list: stmt ENTER 
| stmt_list stmt ENTER
;
stmt: VARKEY WHITESPACE NAME '=' expr {vbltable[$3]=$5;}
| LETKEY WHITESPACE NAME '=' expr {vbltable[$3]=$5;}
| PRINTKEY WHITESPACE expr {printf("%d\n",$3);}
| FORKEY WHITESPACE INDEXKEY WHITESPACE INKEY WHITESPACE NUMBER INDEXDOT NUMBER ENTER stmt
{for(int i=$7;i<$9;i++)}
;


expr: expr '+' expr {$$=$1+$3;}
| expr '-' expr {$$=$1-$3;}
| expr '*' expr {$$=$1*$3;}
| expr '/' expr {$$=$1/$3;}
| '(' expr ')'  {$$=$2;}
| NUMBER
| NAME {$$=vbltable[$1];}
;

%%
int main(){
yyparse();
return 0;
}
int yyerror(){
printf("Error\n");
return 0;
}
