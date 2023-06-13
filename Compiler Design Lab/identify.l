%{
    #include<stdio.h>
%}

%s A B C D DEAD

%%

<INITIAL>[a-zA-Z_] BEGIN A;
<INITIAL>[0-9] BEGIN B;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted");
<INITIAL>.  BEGIN DEAD;


<A>[a-zA-Z_0-9] BEGIN A;
<A>\n BEGIN INITIAL; printf("Valid Identifier");
<A>. BEGIN DEAD;

<B>[0-9] BEGIN B;
<B>\n BEGIN INITIAL;printf("Valid Integer");
<B>\. BEGIN C;
<B>.  BEGIN DEAD;

<C>[0-9] BEGIN D;
<C>\n BEGIN INITIAL; printf("Invalid Float");
<C>. BEGIN DEAD;

<D>[0-9] BEGIN D;
<D>\n BEGIN INITIAL; printf("Valid Float");
<D>. BEGIN DEAD;

<DEAD>. BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; printf("Not Accepted");

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
}