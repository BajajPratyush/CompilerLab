%{
#include<stdio.h>
#include<string.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]* { printf("%s is a valid identifier\n", yytext); }
[0-9]*[a-zA-Z0-9_]* { printf("%s is not a valid identifier\n", yytext); }
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}
