/* just like Unix wc */
%{
#include <stdio.h>
#include <string.h>
%}

%%
"-" {printf("MENOS\n");}
"+" {printf("MAS\n");}
"*" {printf("MULTIPLICACION\n");}
"/" {printf("DIVISION\n");}
[0-9]+ {printf("NUMERO\n");}
[a-zA-Z]+ {printf("LETRA %s\n", yytext);}
\n {printf("SALTO_LINEA\n");}
[ \t] {/*ignora espacios en blanco*/}
. {printf("CARACTER_MISTERIOSO %s \n", yytext);}
[^a-zA-Z0-9\n\t ]+ {printf("CAD_MISTERIOSA %s \n", yytext);}

%%
int main(int argc, char **argv)
{
    yylex();
    return 0;
}
