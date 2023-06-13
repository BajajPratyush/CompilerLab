%{
    #include<stdio.h>
%}

%%
[0-9]+  {
        int n = atoi(yytext);
        int square = n*n;
        int temp =n;
        int count = 0;
        while(temp!=0){
            count++;
            temp/=10;
        }
        int mod = 1;
        for(int i=0;i<count;++i){
            mod*=10;
        }
        int res = square%mod;
        if(res==n)
            printf("Automorphic");
        else
            printf("not");
}
%%  

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
