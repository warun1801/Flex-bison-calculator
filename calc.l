%{
#define YYSTYPE double
#include "calc.tab.h"
#include <math.h>
#include <stdlib.h>
void yyerror(char *); 
// extern double yylval;
%}

%%
 /* number */
[0-9]+([.][0-9]+)? {
 yylval = atof(yytext);
 return NUMBER;
 }
 /* operators */
[-+()/*^\n] { return *yytext; }
 /* skip whitespace */
[ \t] ;
 /* anything else is an error */
. yyerror("invalid character");
%%
int yywrap(void) {
 return 1;
}