%{
#include <string.h>
%}

%%

[0-9]+   {
            int len = strlen(yytext);
            for (int i = 0; i < len/2; i++) {
                if (yytext[i] != yytext[len-i-1]) {
                    printf("%s is not a palindrome\n", yytext);
                    return 0;
                }
            }
            printf("%s is a palindrome\n", yytext);
            return 0;
         }

.        ;
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}
