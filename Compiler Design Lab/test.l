%{
#include <stdio.h>
int word_count = 0;
int space_count = 0;
int newline_count = 0;
int tab_count = 0;
%}

%%

\n {newline_count++;}
\t {tab_count++;}
[ ]+ {space_count++;}
[^\n\t ]+ {word_count++;}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    printf("Number of words: %d\n", word_count);
    printf("Number of spaces: %d\n", space_count);
    printf("Number of newlines: %d\n", newline_count);
    printf("Number of tabs: %d\n", tab_count);
    return 0;
}
