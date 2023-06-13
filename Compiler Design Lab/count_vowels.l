%{
    int vc;
    int cc;
%}

%%
[AEIOUaeiou]    {vc++;}
[a-zA-Z]   {cc++;}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Vowels:%d\n",vc);
    printf("Consonants:%d",cc);
    return 0;
}