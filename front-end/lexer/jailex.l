%{
    #include "token_defs.h"
    extern int yylex();
    extern char *yytext;
    extern FILE *yyin;

    void emit_token (char *text, enum Token token) {
        char rendered_token[100];
        render(token, rendered_token);
        printf("(%s: \'%s\') ", rendered_token, text);
    }
%}
%option noyywrap

%x COMMENT

%%

"//"(.*)(\n|\r|\r\n)             { printf("Skipping comment %s\n", yytext); }
"/*"                             { BEGIN(COMMENT); }
<COMMENT>"*/"                    { BEGIN(INITIAL); }
<COMMENT>([^(\*\/)\n\r]*)        { printf("Skipping comment %s\n", yytext); }
<COMMENT>. {}

[[:blank:]]                      { }

"=="                                   { emit_token(yytext, DUBEQ); }
"!="                                   { emit_token(yytext, BANGEQ); }
">="                                   { emit_token(yytext, GEQ); }
"<="                                   { emit_token(yytext, LEQ); }
"<"                                    { emit_token(yytext, LT); }
">"                                    { emit_token(yytext, GT); }
"+"                                    { emit_token(yytext, PLUS); }
"-"                                    { emit_token(yytext, MINUS); }
"/"                                    { emit_token(yytext, DIV); }
"%"                                    { emit_token(yytext, MOD); }
"case"                                 { emit_token(yytext, CASE); }
":"                                    { emit_token(yytext, COLON); }
"="                                    { emit_token(yytext, EQ); }
"&"                                    { emit_token(yytext, AMPO); }
":="                                   { emit_token(yytext, COLONEQ); }
"struct"                               { emit_token(yytext, STRUCT); }
"["                                    { emit_token(yytext, LBRACK); }
"]"                                    { emit_token(yytext, RBRACK); }
"("                                    { emit_token(yytext, LPAREN); }
")"                                    { emit_token(yytext, RPAREN); }
"{"                                    { emit_token(yytext, LCURL); }
"}"                                    { emit_token(yytext, RCURL); }
"return"                               { emit_token(yytext, RETURN); }
";"                                    { emit_token(yytext, SEMICO); }
".."                                   { emit_token(yytext, DUBDOT); }
"->"                                   { emit_token(yytext, RARROW); }
"defer"                                { emit_token(yytext, DEFER); }
"new"                                  { emit_token(yytext, NEW); }
"delete"                               { emit_token(yytext, DELETE); }
"::"                                   { emit_token(yytext, DUBCOLON); }
"SOA"                                  { emit_token(yytext, SOA); }
"enum"                                 { emit_token(yytext, ENUM); }
","                                    { emit_token(yytext, COMMA); }
"!*"                                   { emit_token(yytext, BANGSTAR); }
"*"                                    { emit_token(yytext, STAR); }
"---"                                  { emit_token(yytext, TRIPDASH); }
"for"                                  { emit_token(yytext, FOR); }
"while"                                { emit_token(yytext, WHILE); }
"if"                                   { emit_token(yytext, IF); }
"else"                                 { emit_token(yytext, ELSE); }
"using"                                { emit_token(yytext, USING); }
"$"                                    { emit_token(yytext, DOLLAR); }
"."                                    { emit_token(yytext, DOT); }
"<<"                                   { emit_token(yytext, DUBLANGLE); }
"#run"                                 { emit_token(yytext, HASHRUN); }
"inline"                               { emit_token(yytext, INLINE); }
"no_inline"                            { emit_token(yytext, NO_INLINE); }

\"([^\"\n\r]|(\"))*\"                  { emit_token(yytext, STRING); }
[0-9]+                                 { emit_token(yytext, INTEGER); }
([0-9]*\.[0-9]+f?|[0-9]+\.[0-9]*f)     { emit_token(yytext, FLOAT); }

[[:alpha:]_]+[[:alnum:]_]*             { emit_token(yytext, IDENTIFIER); }

(.)                                    { emit_token(yytext, LEXERROR); }

<<EOF>>                                { emit_token("", EOFTOKEN); return 0; }

%%

int main(int argc, char **argv) {
    if (argc == 2) {
        yyin = fopen(argv[1], "r");
        yylex();
    } else {
        printf("Must supply only one argument: the input file.\n");
        return 1;
    }
        
}
