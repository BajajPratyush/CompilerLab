%{
#include <stdio.h>
%}

%%
[0-9]+ {
    int year = atoi(yytext);
    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        printf("%d is a leap year\n", year);
    } else {
        printf("%d is not a leap year\n", year);
    }
}
.|\n {}

%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}
