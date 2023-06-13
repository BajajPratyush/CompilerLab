%{
    #include<stdio.h>
%}

%s A B C D E F DEAD

%%
<INITIAL>0 BEGIN A;
<INITIAL>1 BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; printf("Not Accepted\n");
<INITIAL>[^0|\n] BEGIN DEAD; 
<A>0 BEGIN DEAD;
<A>1 BEGIN B;
<A>\n BEGIN INITIAL; printf("Not Accepted\n");
<A>[^0|\n] BEGIN DEAD;
<B>0 BEGIN DEAD;
<B>1 BEGIN C;
<B>\n BEGIN INITIAL; printf("Not Accepted\n");
<B>[^0|\n] BEGIN DEAD;
<C>0 BEGIN D;
<C>1 BEGIN C;
<C>\n BEGIN INITIAL; printf("Not Accepted\n");
<C>[^0|\n] BEGIN DEAD;
<D>0 BEGIN F;
<D>1 BEGIN E;
<D>\n BEGIN INITIAL; printf("Accepted\n");
<D>[^0|\n] BEGIN DEAD;
<E>0 BEGIN F;
<E>1 BEGIN C;
<E>\n BEGIN INITIAL; printf("Not Accepted\n");
<E>[^0|\n] BEGIN DEAD;
<F>0 BEGIN F;
<F>1 BEGIN E;
<F>\n BEGIN INITIAL; printf("Not Accepted\n");
<F>[^0|\n] BEGIN DEAD;
<DEAD>0 BEGIN DEAD;
<DEAD>1 BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; printf("Not Accepted\n");
<DEAD>[^0|\n] BEGIN DEAD;
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();

}
