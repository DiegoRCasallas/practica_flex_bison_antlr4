%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"   /* generado por Bison, contiene los #define de tokens */
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
\n          { return EOL; }
[ \t]       { /* ignorar espacios */ }
.           { printf("Caracter no reconocido: %s\n", yytext); }

%%

int yywrap(void) { return 1; }
