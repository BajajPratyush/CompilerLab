%{
#include<stdio.h>
%}

%s A B C D E

%%
<INITIAL>0 BEGIN C;
<INITIAL>1 BEGIN A;
<INITIAL>[^0|\n] BEGIN E;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted\n");
<A>0 BEGIN B;
<A>1 BEGIN A;
<A>[^0|\n] BEGIN E;
<A>\n BEGIN INITIAL; printf("Not Accepted\n");
<B>0 BEGIN B;
<B>1 BEGIN A;
<B>[^0|\n] BEGIN E;
<B>\n BEGIN INITIAL; printf("Accepted\n");
<D>0 BEGIN C;
<D>1 BEGIN D;
<D>[^0|\n] BEGIN E;
<D>\n BEGIN INITIAL; printf("Accepted\n");
<C>0 BEGIN C;
<C>1 BEGIN D;
<C>[^0|\n] BEGIN E;
<C>\n BEGIN INITIAL; printf("Not Accepted\n");
<E>0 BEGIN E;
<E>1 BEGIN E;
<E>[^0|\n] BEGIN E;
<E>\n BEGIN INITIAL; printf("Not Accepted\n");
%%

int yywrap(){
    return 1;
}

void main(){
    yylex();
}
