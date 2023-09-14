/*** Definition Section ***/
%{
int capital_count = 0;
%}

/*** Rule Section
The rules matches the words that start with a capital letter then followed by lower case letters.
After printing, it also states the captal letter in the setence.
The code assumes capital letters always be in the beginning of a word,thus any letter which is capitalized will be put in a new line followed by the rest of the letters in the word if in lowercase. ***/

%%
[A-Z][a-z]* {
    printf("%s - Capital letter: '%c'\n", yytext, yytext[0]);
    capital_count++;
}
[a-z]+ {
    printf("%s\n", yytext);
}
\n {
    printf("\nNumber of Capital letters in the given input: %d\n", capital_count);
    return 0;
}
%%

/*** Code Section
After printing all the words, when a newline is encountered, the lexer is re-invoked with yylex() to identify words with capital letters.
It then prints each word with its capitalized letter where observed and counts the total number of capital letters in the entire sentence. ***/

int yywrap(){}
int main() {
    yylex();
    return 0;
}

