%token NUMBER
%left '+' '-'
%left '*' '/'
%token '^'

%{
 #include <math.h>
 #include <stdio.h>
 void yyerror(char *);
 int yylex(void);
 #define YYSTYPE double
%}
%%
program:
 program statement '\n'
 |
 ;
statement:
 expr { printf(">>> %f\n", $1); }
 |
 ;
expr:
 NUMBER
 | expr '+' expr { $$ = $1 + $3; }
 | expr '-' expr { $$ = $1 - $3; }
 | expr '*' expr { $$ = $1 * $3; }
 | expr '/' expr { $$ = $1 / $3; }
 | expr '^' expr { $$ = pow($1, $3); }
 | '(' expr ')' { $$ = $2; }
 | '-' expr {$$ = -1*$2;}
 | '+' expr {$$ = $2;}
 ;
%%

void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}

int main(void) {
 printf("Calculator Start:\n");
 yyparse();
 return 0;
} 