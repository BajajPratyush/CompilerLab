%{
#include<stdio.h>
%}
%s A B C
%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN INITIAL;
<INITIAL>. BEGIN INITIAL; printf("\nNOT ACCEPTED\n");
<A>1 BEGIN B;
<A>0 BEGIN INITIAL;
<A>. BEGIN INITIAL; printf("\nNOT ACCEPTED\n");
<B>1 BEGIN B;
<B>0 BEGIN C;
<B>. BEGIN INITIAL; printf("\nNOT ACCEPTED\n");
<C>1 BEGIN A;
<C>0 BEGIN INITIAL;
<C>\n printf("\nACCEPTED\n");
<C>. BEGIN INITIAL; printf("\nNOT ACCEPTED\n");

%%
int yywrap()
{
return 1;
}
int main()
{
printf("Enter String\n"); yylex();
return 0;
}