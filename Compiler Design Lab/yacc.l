%{
    #include<stdio.h>
    extern yylval;
%}

%%
[0-9]+  {return NUMBER;}
[a-zA-Z]+   {return ID;}
%%

