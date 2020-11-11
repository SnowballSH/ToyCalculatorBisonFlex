%{
#include <stdio.h>
%}

%union {
  int intval;
}

%error-verbose

/* declare tokens */
%token <intval> NUMBER
%token ADD SUB MUL DIV ABS
%token LP RP
%token EOL

%type <intval> exp
%type <intval> factor
%type <intval> term

%%

calclist
  : /* nothing */
  | calclist exp EOL { printf("= %d\n", $2); }
;

exp
  : factor
  | exp ADD factor { $$ = $1 + $3; }
  | exp SUB factor { $$ = $1 - $3; }
;

factor
  : term
  | factor MUL term { $$ = $1 * $3; }
  | factor DIV term { $$ = $1 / $3; }
;

term
  : NUMBER
  | ABS term   { $$ = $2 >= 0? $2 : - $2; }
  | SUB term   { $$ = - $2; }
  | ADD term   { $$ = + $2; }
  | LP exp RP { $$ = $2; }
;
%%
main(int argc, char **argv)
{
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
