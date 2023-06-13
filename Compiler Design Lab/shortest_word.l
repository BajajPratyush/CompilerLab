%{
#include <stdio.h>
#include <string.h>
%}

%option noyywrap

%%

[a-zA-Z]+ {
    if (strlen(yytext) < strlen(shortest_word)) {
        strcpy(shortest_word, yytext);
    }
}
. ;

%%

int main() {
    char shortest_word[100] = "";
    printf("Enter a string: ");
    yylex();
    if (strlen(shortest_word) > 0) {
        printf("Shortest word: %s\n", shortest_word);
    } else {
        printf("No words found.\n");
    }
}