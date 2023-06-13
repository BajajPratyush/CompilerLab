%{
    int wc,cc;
%}

%%
[^a-zA-Z0-9]*    {cc++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Words:%d",cc);
    return 0;
}

