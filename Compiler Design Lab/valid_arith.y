%{
    #include <stdio.h>
%}

%token NUMBER ID
%left '+''-'
%left '*''/'
%%
E:E'+'E|E'-'E|E'*'E|E'/'E|'-'NUMBER|'-'ID|'('E')'|NUMBER|ID;
%%
int main(){
    printf("Enter the expression\n");
    yyparse();
    printf("Expression is valid");
}
int yyerror(char *s){
    printf("Not Valid");
}