%{
    #include <stdio.h>
    #include <stdlib.h>
    extern int yylex();
    extern int yyparse();
    extern FILE* yyin;

    void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <sval> NEW 
%token <sval> DELETE
%token <sval> DUBEQ
%token <sval> BANGEQ
%token <sval> GEQ
%token <sval> GT
%token <sval> LEQ
%token <sval> LT
%token <sval> PLUS
%token <sval> MINUS
%token <sval> DIV
%token <sval> MOD
%token <sval> CASE
%token <sval> COLON
%token <sval> EQ
%token <sval> AMPO
%token <sval> COLONEQ
%token <sval> STRUCT
%token <sval> STRING
%token <ival> INTEGER
%token <fval> FLOAT 
%token <sval> LBRACK
%token <sval> RBRACK
%token <sval> LPAREN
%token <sval> RPAREN
%token <sval> LCURL
%token <sval> RCURL
%token <sval> RETURN
%token <sval> SEMICO
%token <sval> DUBDOT
%token <sval> RARROW
%token <sval> DEFER
%token <sval> DUBCOLON
%token <sval> SOA
%token <sval> ENUM
%token <sval> COMMA
%token <sval> BANGSTAR
%token <sval> STAR
%token <sval> TRIPDASH
%token <sval> FOR
%token <sval> WHILE
%token <sval> IF
%token <sval> ELSE
%token <sval> DOT
%token <sval> DUBLANGLE
%token <sval> HASHRUN
%token <sval> INLINE
%token <sval> NO_INLINE
%token <sval> IDENTIFIER
%token <sval> LEXERROR
%token <sval> EOFTOKEN
%token <sval> DOLLAR
%token <sval> USING

%%
jai:
   IDENTIFIER jai {
       printf("We found %s", $1);
   }
   |
   FLOAT jai {
       printf("We found %f", $1);
   }
   |
   STRUCT jai {
       printf("We found %s", $1);
       free($1);
   }
   |
   INTEGER {
       printf("We found %i", $1);
   }
   |
   FLOAT {
       printf("We found %f", $1);
   }
   |
   STRUCT {
       printf("We found %s", $1);
       free($1);
   }
   ;
%%

int main(int argc, char** argv) {
    if (argc == 2) {
        FILE *inputFile = fopen(argv[1], "r");
        if (!inputFile) {
            printf("Could not open %s for reading.\n", argv[1]);
            return 1;
        }
        yyin = fopen(argv[1], "r");
    } else {
        printf("Must supply only one argument: the input file.\n");
        return 1;
    }

    yyparse();
}

void yyerror(const char *s) {
    printf("We encountered an error: %s\n", s);
    exit(-1);
}
