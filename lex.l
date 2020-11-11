%{
  #include "grammar.tab.h"
%}

%option noyywrap

%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"("    { return LP; }
")"    { return RP; }

[0-9]+ { yylval.intval = atoi(yytext); return NUMBER; }
[\r\n]     { return EOL; }
[ \t\b\v]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
