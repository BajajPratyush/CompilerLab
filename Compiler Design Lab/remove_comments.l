%{
#include<stdio.h>
#include<string.h>    
%}

%%
"/*"[a-zA-Z0-9 \t\n]"*/" {;}
"//"[a-zA-Z0-9 \t]* {;}

. {ECHO;}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("1.c","r");
    yyout = fopen("2.c","w");
    yylex();

    return 0;
}