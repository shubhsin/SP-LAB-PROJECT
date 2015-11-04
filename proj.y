//  Created by Shubham Sorte
//  Copyright (c) 2015 Shubham Sorte. All rights reserved.

%{
#include <stdio.h>
#include <string.h>

int vbltable[26];
int count=0;
char varstr[50];
int k=0;
%}

%token NAME
%token NUMBER
%token ENTER
%token LETKEY
%token VARKEY
%token WHITESPACE
%token PRINTKEY
%token STRING
%token FORKEY
%token INDEXKEY
%token INDEXDOT
%token INKEY
%token REPEAT
%token WHILE
%token RELOP
%token OB CB OC CC

%left '+' '-'
%left '*' '/'

%% 

stmt_list: stmt ENTER 
| stmt_list stmt ENTER
;

stmt: VARKEY WHITESPACE NAME '=' expr {vbltable[$3]=$5;}
| LETKEY WHITESPACE NAME '=' expr {vbltable[$3]=$5;}
| PRINTKEY WHITESPACE expr {printf("%d\n",$3);}
| FORKEY WHITESPACE INDEXKEY WHITESPACE INKEY WHITESPACE NUMBER INDEXDOT NUMBER ENTER PRINTKEY WHITESPACE STRING {
printf("VALID FOR LOOP\n");
}
| REPEAT OC ENTER CC WHILE OB OPT RELOP OPT CB ENTER {printf("Valid REPEAT WHILE LOOP\n");}
;

OPT: NUMBER|NAME
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
