%{
    #include<stdio.h>
%}

%s A B C D

%%
<INITIAL>0 BEGIN INITIAL;
<INITIAL>1 BEGIN A;
<INITIAL>[^0|\n] BEGIN D;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted\n");
<A>1 BEGIN B;
<A>0 BEGIN A;
<A>[^0|\n] BEGIN D;
<A>\n BEGIN INITIAL; printf("Not Accepted\n");
<B>1 BEGIN C;
<B>0 BEGIN B;
<B>[^0|\n] BEGIN D;
<B>\n BEGIN INITIAL; printf("Not Accepted\n");
<C>1 BEGIN C;
<C>0 BEGIN C;
<C>[^0|\n] BEGIN D;
<C>\n BEGIN INITIAL; printf("Accepted\n");
<D>1 BEGIN D;
<D>0 BEGIN D;
<D>[^0|\n] BEGIN D;
<D>\n BEGIN INITIAL; printf("Invalid \n");
%%

int yywrap(){
    return 1;
}

void main(){
    yylex();
}