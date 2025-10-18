%{
/* calc.y — Parser de una calculadora simple */

#include <stdio.h>
#include <stdlib.h>

/* Declaración de yylex para el analizador léxico */
int yylex(void);
int yyerror(char *s);
%}

/* Declaración de tokens que vienen del analizador léxico */
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
    | factor DIV term    { 
          if ($3 == 0) {
              yyerror("división por cero");
              $$ = 0;
          } else $$ = $1 / $3; 
      }
    ;

term:
      NUMBER
    | ABS term           { $$ = $2 >= 0 ? $2 : -$2; }
    ;

%%

int main(void) {
    printf("Calculadora — ingrese expresiones (Ctrl+D para salir)\n");
    return yyparse();
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
