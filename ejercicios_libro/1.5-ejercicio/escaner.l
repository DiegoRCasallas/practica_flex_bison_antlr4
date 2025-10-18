
%{
#include <stdio.h>
#include <stdlib.h>
#include ""

/* Definición de tokens */
enum yytokentype {
    NUMBER=1,
    ADD,
    SUB,
    MUL=261,
    DIV,
    ABS,
    EOL
};

/* Variable global donde guardaremos el valor del token */
int yylval;
%}

%%

"+"        { return ADD; }
"-"        { return SUB; }
"*"        { return MUL; }
"/"        { return DIV; }
"|"        { return ABS; }

[0-9]+  { yylval = atoi(yytext); return NUMBER; }

\n         { return EOL; }

[ \t]      { /* ignorar */ }

.          { printf("Caracter misterioso: %c\n", *yytext); }

%%

/* Implementación mínima de yywrap() */
int yywrap(void) { return 1; }

/* Programa principal de prueba */
int main(void) {
    int tok;
    while ((tok = yylex())) {
        printf("Token: %d", tok);
        if (tok == NUMBER)
            printf(" (valor = %d)", yylval);
        else printf("\n");
    }
    return 0;
}
