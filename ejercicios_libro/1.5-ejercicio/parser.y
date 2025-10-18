%{

/* fb1-5.y — Primer parser de calculadora */

#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist:
      /* vacío */
    | calclist exp EOL   { printf("= %d\n", $2); }
    ;

exp:
      factor
    | exp ADD factor     { $$ = $1 + $3; }
    | exp SUB factor     { $$ = $1 - $3; }
    ;

factor:
      term
    | factor MUL term    { $$ = $1 * $3; }
    | factor DIV term    { $$ = $1 / $3; }
    ;

term:
      NUMBER
    | ABS term           { $$ = $2 >= 0 ? $2 : -$2; }
    ;

%%

int main() { return yyparse(); }

int yyerror(char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 0;
}
