%{
#include<stdio.h>
%}

%%
#[a-zA-Z.0-9<>]+ {fprintf(yyout,"\n{%s} is a preprocessor directive\n",yytext);}
bool|int|float|double|for|while|if|printf|scanf|return {fprintf(yyout,"\n{%s} is a keyword\n",yytext);}
["].([a-zA-Z0-9%]*|"+"|"-"|"/"|"*"|"%")*.["] {fprintf(yyout,"\n{%s} is a string\n",yytext);}
","|[" "]+|[\t]+ {fprintf(yyout,"\n{%s} is a separator \n",yytext);}
[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"\n{%s} is a identifier \n",yytext);}
"+"|"-"|"*"|"/"|"%" {fprintf(yyout,"\n{%s} is a operator \n",yytext);}
. ;

%%

int yywrap()
{
return 1;
}

int main()
{
yyin=fopen("table.l","r");
yyout=fopen("output.txt","w");
yylex();
return 0;
}
