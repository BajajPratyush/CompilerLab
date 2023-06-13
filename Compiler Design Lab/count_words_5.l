%{
#include <string.h>
int count = 0;
%}

%%
[a-zA-Z]+     {if(yyleng == 5) count++; }
.             ;
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Number of words of length 5: %d\n", count);
    return 0;
}
