%{
    #include<stdio.h>
%}

%%
[0-9]+  {
        int n = atoi(yytext);
        int temp = n*n;
        int sum = 0;
        while(temp!=0){
            sum= sum + temp%10;
            temp/=10;  
        }
        if(sum==n)
            printf("Neon");
        else    
            printf("Not");
        }
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
}

