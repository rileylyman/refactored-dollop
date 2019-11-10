%{
    #include "jaiparse.tab.h"
    #include "token_defs.h"
    extern int yylex();
    extern char *yytext;
    extern FILE *yyin;

    enum dtype {
        dtype_INTEGER,
        dtype_STRING,
        dtype_FLOAT,
    };

    int emit_token (char *text, int token, enum dtype dtype) {
        char rendered_token[100];
        render(token, rendered_token);
        printf("(%s: \'%s\') ", rendered_token, text);

        if (dtype == dtype_INTEGER) {
            yylval.ival = atoi(yytext);
        }
        else if (dtype == dtype_FLOAT) {
            yylval.fval = atof(yytext);
        }
        else {
            yylval.sval = strdup(yytext);
        }
        return token;
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

"=="                                   { return emit_token(yytext, DUBEQ, dtype_STRING); }
"!="                                   { return emit_token(yytext, BANGEQ, dtype_STRING); }
">="                                   { return emit_token(yytext, GEQ, dtype_STRING); }
"<="                                   { return emit_token(yytext, LEQ, dtype_STRING); }
"<"                                    { return emit_token(yytext, LT, dtype_STRING); }
">"                                    { return emit_token(yytext, GT, dtype_STRING); }
"+"                                    { return emit_token(yytext, PLUS, dtype_STRING); }
"-"                                    { return emit_token(yytext, MINUS, dtype_STRING); }
"/"                                    { return emit_token(yytext, DIV, dtype_STRING); }
"%"                                    { return emit_token(yytext, MOD, dtype_STRING); }
"case"                                 { return emit_token(yytext, CASE, dtype_STRING); }
":"                                    { return emit_token(yytext, COLON, dtype_STRING); }
"="                                    { return emit_token(yytext, EQ, dtype_STRING); }
"&"                                    { return emit_token(yytext, AMPO, dtype_STRING); }
":="                                   { return emit_token(yytext, COLONEQ, dtype_STRING); }
"struct"                               { return emit_token(yytext, STRUCT, dtype_STRING); }
"["                                    { return emit_token(yytext, LBRACK, dtype_STRING); }
"]"                                    { return emit_token(yytext, RBRACK, dtype_STRING); }
"("                                    { return emit_token(yytext, LPAREN, dtype_STRING); }
")"                                    { return emit_token(yytext, RPAREN, dtype_STRING); }
"{"                                    { return emit_token(yytext, LCURL, dtype_STRING); }
"}"                                    { return emit_token(yytext, RCURL, dtype_STRING); }
"return"                               { return emit_token(yytext, RETURN, dtype_STRING); }
";"                                    { return emit_token(yytext, SEMICO, dtype_STRING); }
".."                                   { return emit_token(yytext, DUBDOT, dtype_STRING); }
"->"                                   { return emit_token(yytext, RARROW, dtype_STRING); }
"defer"                                { return emit_token(yytext, DEFER, dtype_STRING); }
"new"                                  { return emit_token(yytext, NEW, dtype_STRING); }
"delete"                               { return emit_token(yytext, DELETE, dtype_STRING); }
"::"                                   { return emit_token(yytext, DUBCOLON, dtype_STRING); }
"SOA"                                  { return emit_token(yytext, SOA, dtype_STRING); }
"enum"                                 { return emit_token(yytext, ENUM, dtype_STRING); }
","                                    { return emit_token(yytext, COMMA, dtype_STRING); }
"!*"                                   { return emit_token(yytext, BANGSTAR, dtype_STRING); }
"*"                                    { return emit_token(yytext, STAR, dtype_STRING); }
"---"                                  { return emit_token(yytext, TRIPDASH, dtype_STRING); }
"for"                                  { return emit_token(yytext, FOR, dtype_STRING); }
"while"                                { return emit_token(yytext, WHILE, dtype_STRING); }
"if"                                   { return emit_token(yytext, IF, dtype_STRING); }
"else"                                 { return emit_token(yytext, ELSE, dtype_STRING); }
"using"                                { return emit_token(yytext, USING, dtype_STRING); }
"$"                                    { return emit_token(yytext, DOLLAR, dtype_STRING); }
"."                                    { return emit_token(yytext, DOT, dtype_STRING); }
"<<"                                   { return emit_token(yytext, DUBLANGLE, dtype_STRING); }
"#run"                                 { return emit_token(yytext, HASHRUN, dtype_STRING); }
"inline"                               { return emit_token(yytext, INLINE, dtype_STRING); }
"no_inline"                            { return emit_token(yytext, NO_INLINE, dtype_STRING); }

\"([^\"\n\r]|(\"))*\"                  { return emit_token(yytext, STRING, dtype_STRING); }
[0-9]+                                 { return emit_token(yytext, INTEGER, dtype_INTEGER); }
([0-9]*\.[0-9]+f?|[0-9]+\.[0-9]*f)     { return emit_token(yytext, FLOAT, dtype_FLOAT); }

[[:alpha:]_]+[[:alnum:]_]*             { return emit_token(yytext, IDENTIFIER, dtype_STRING); }

(.)                                    { return emit_token(yytext, LEXERROR, dtype_STRING); }

<<EOF>>                                { return emit_token("", EOFTOKEN, dtype_STRING); }

%%

int lexmain(int argc, char **argv) {
    if (argc == 2) {
        yyin = fopen(argv[1], "r");
        yylex();
    } else {
        printf("Must supply only one argument: the input file.\n");
        return 1;
    }
        
}
