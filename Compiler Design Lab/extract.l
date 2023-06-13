%{
    #include<stdio.h>    
%}
%%
[<][^>]*[>] {fprintf(yyout,"%s",yytext);}
. {;}
%%
int yywrap(void) {
    return 1;
}
int main() {
    yyin = fopen("input.html","r");
    yyout = fopen("output.txt","w");
    yylex();
    return 0;
}