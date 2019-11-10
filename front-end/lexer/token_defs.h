#include <stdio.h>

//enum Token {
//    NEW, 
//    DELETE,
//    DUBEQ,
//    BANGEQ,
//    GEQ,
//    GT,
//    LEQ,
//    LT,
//    PLUS,
//    MINUS,
//    DIV,
//    MOD,
//    CASE,
//    COLON,
//    EQ,
//    AMPO,
//    COLONEQ,
//    STRUCT,
//    STRING,
//    INTEGER,
//    FLOAT, 
//    LBRACK,
//    RBRACK,
//    LPAREN,
//    RPAREN,
//    LCURL,
//    RCURL,
//    RETURN,
//    SEMICO,
//    DUBDOT,
//    RARROW,
//    DEFER,
//    DUBCOLON,
//    SOA,
//    ENUM,
//    COMMA,
//    BANGSTAR,
//    STAR,
//    TRIPDASH,
//    FOR,
//    WHILE,
//    IF,
//    ELSE,
//    DOT,
//    DUBLANGLE,
//    HASHRUN,
//    INLINE,
//    NO_INLINE,
//    IDENTIFIER,
//    LEXERROR,
//    EOFTOKEN,
//    DOLLAR,
//    USING,
//};

void render(int token, char *buf) {

    switch (token) {
        case DUBEQ:
            sprintf(buf, "%s", "DUBEQ");
            break;
        case BANGEQ:
            sprintf(buf, "%s", "BANGEQ");
            break;
        case GEQ:
            sprintf(buf, "%s", "GEQ");
            break;
        case GT:
            sprintf(buf, "%s", "GT");
            break;
        case LEQ:
            sprintf(buf, "%s", "LEQ");
            break;
        case LT:
            sprintf(buf, "%s", "LT");
            break;
        case PLUS:
            sprintf(buf, "%s", "PLUS");
            break;
        case MINUS:
            sprintf(buf, "%s", "MINUS");
            break;
        case DIV:
            sprintf(buf, "%s", "DIV");
            break;
        case MOD:
            sprintf(buf, "%s", "MOD");
            break;
        case CASE:
            sprintf(buf, "%s", "CASE");
            break;
        case COLON:
            sprintf(buf, "%s", "COLON");
            break;
        case EQ:
            sprintf(buf, "%s", "EQ");
            break;
        case AMPO:
            sprintf(buf, "%s", "AMPO");
            break;
        case COLONEQ:
            sprintf(buf, "%s", "COLONEQ");
            break;
        case STRUCT:
            sprintf(buf, "%s", "STRUCT");
            break;
        case STRING:
            sprintf(buf, "%s", "STRING");
            break;
        case INTEGER:
            sprintf(buf, "%s", "INTEGER");
            break;
        case FLOAT:
            sprintf(buf, "%s", "FLOAT");
            break;
        case LBRACK:
            sprintf(buf, "%s", "LBRACK");
            break;
        case RBRACK:
            sprintf(buf, "%s", "RBRACK");
            break;
        case LPAREN:
            sprintf(buf, "%s", "LPAREN");
            break;
        case RPAREN:
            sprintf(buf, "%s", "RPAREN");
            break;
        case LCURL:
            sprintf(buf, "%s", "LCURL");
            break;
        case RCURL:
            sprintf(buf, "%s", "RCURL");
            break;
        case RETURN:
            sprintf(buf, "%s", "RETURN");
            break;
        case SEMICO:
            sprintf(buf, "%s", "SEMICO");
            break;
        case DUBDOT:
            sprintf(buf, "%s", "DUBDOT");
            break;
        case RARROW:
            sprintf(buf, "%s", "RARROW");
            break;
        case DEFER:
            sprintf(buf, "%s", "DEFER");
            break;
        case DUBCOLON:
            sprintf(buf, "%s", "DUBCOLON");
            break;
        case SOA:
            sprintf(buf, "%s", "SOA");
            break;
        case ENUM:
            sprintf(buf, "%s", "ENUM");
            break;
        case COMMA:
            sprintf(buf, "%s", "COMMA");
            break;
        case BANGSTAR:
            sprintf(buf, "%s", "BANGSTAR");
            break;
        case STAR:
            sprintf(buf, "%s", "STAR");
            break;
        case TRIPDASH:
            sprintf(buf, "%s", "TRIPDASH");
            break;
        case FOR:
            sprintf(buf, "%s", "FOR");
            break;
        case WHILE:
            sprintf(buf, "%s", "WHILE");
            break;
        case IF:
            sprintf(buf, "%s", "IF");
            break;
        case ELSE:
            sprintf(buf, "%s", "ELSE");
            break;
        case DOT:
            sprintf(buf, "%s", "DOT");
            break;
        case DUBLANGLE:
            sprintf(buf, "%s", "DUBLANGLE");
            break;
        case HASHRUN:
            sprintf(buf, "%s", "HASHRUN");
            break;
        case INLINE:
            sprintf(buf, "%s", "INLINE");
            break;
        case NO_INLINE:
            sprintf(buf, "%s", "NO_INLINE");
            break;
        case IDENTIFIER:
            sprintf(buf, "%s", "IDENTIFIER");
            break;
        case LEXERROR:
            sprintf(buf, "%s", "LEXERROR");
            break;
        case EOFTOKEN:
            sprintf(buf, "%s", "EOFTOKEN");
            break;
        case DOLLAR:
            sprintf(buf, "%s", "DOLLAR");
            break;
        case USING:
            sprintf(buf, "%s", "USING");
            break;
        case NEW:
            sprintf(buf, "%s", "NEW");
            break;
        case DELETE:
            sprintf(buf, "%s", "DELETE");
            break;
    }
}

