%{
#include <stdio.h>
%}

%%
[a-zA-Z0-9_%+-]+[a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,} {
    printf("Input is a valid email address: %s\n", yytext);
}
. {
    printf("Input is not a valid email address\n");
    return 0;
}
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}