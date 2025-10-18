/* just like Unix wc */
%{
#include <stdio.h>
#include <string.h>

%}

%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"clever" { printf("smart"); }
"smart" { printf("elegant"); }
"conservative" { printf("liberal"); }
%%

int main(int argc, char **argv)
{
    yylex();
    return 0;
}
