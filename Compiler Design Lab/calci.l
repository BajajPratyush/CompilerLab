%{
#include <stdio.h>
float a,b,res;
%}

%%
[+] {res = a+b;
     printf("The result:%f\n",res);}
[-] {res = a-b;
     printf("The result:%f\n",res);}
[*] {res = a*b;
     printf("The result:%f\n",res);}
[/] {res = a/b;
     printf("The result:%f\n",res);}
%%

int yywrap(){
    return 1;
}

int main(){
    printf("enter a and b : ");
    scanf("%f %f",&a,&b);
    printf("enter the operand:");
    yylex();
    return 0;
}

