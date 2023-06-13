%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+    {
            int num = atoi(yytext);
            printf("Table of %d:\n", num);
            for (int i = 1; i <= 10; i++) {
                printf("%d x %d = %d\n", num, i, num*i);
            }
         }
.|\n      { /* ignore other characters */ }
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}
