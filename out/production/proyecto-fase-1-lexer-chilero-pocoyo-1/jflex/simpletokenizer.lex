package gt.edu.url.compiler;

import java_cup.runtime.Symbol;

%%

%{

    // Max size of string constants
    static int MAX_STR_CONST = 1025;

    // For assembling string constants
    StringBuffer string_buf = new StringBuffer();

    private int curr_lineno = 1;
    int get_curr_lineno() {
        return curr_lineno;
    }

    private AbstractSymbol filename;

    void set_filename(String fname) {
        filename = AbstractTable.stringtable.addString(fname);
    }

    AbstractSymbol curr_filename() {
        return filename;
    }
%}

%init{
%init}

%eofval{
    switch(zzLexicalState) {
        case YYINITIAL:
        /* nada */
        break;
    }
    return new Symbol(TokenConstants.EOF);
%eofval}

%class CoolLexer
%cup

%%

<YYINITIAL>"=>"			{return new Symbol(TokenConstants.DARROW); }

\(\*.*\*\) {}

/* ========================
   Palabras clave en inglés
   ======================== */
"class" { return new Symbol(TokenConstants.CLASS); }
"else" { return new Symbol(TokenConstants.ELSE); }
"false" { return new Symbol(TokenConstants.BOOL_CONST, false); }
"fi" { return new Symbol(TokenConstants.FI); }
"if" { return new Symbol(TokenConstants.IF); }
"in" { return new Symbol(TokenConstants.IN); }
"inherits" { return new Symbol(TokenConstants.INHERITS); }
"isvoid" { return new Symbol(TokenConstants.ISVOID); }
"let" { return new Symbol(TokenConstants.LET_STMT); } // Agregamos el token LET_STMT
"loop" { return new Symbol(TokenConstants.LOOP); }
"pool" { return new Symbol(TokenConstants.POOL); }
"then" { return new Symbol(TokenConstants.THEN); }
"while" { return new Symbol(TokenConstants.WHILE); }
"case" { return new Symbol(TokenConstants.CASE); }
"esac" { return new Symbol(TokenConstants.ESAC); }
"new" { return new Symbol(TokenConstants.NEW); }
"of" { return new Symbol(TokenConstants.OF); }
"not" { return new Symbol(TokenConstants.NOT); }
"true" { return new Symbol(TokenConstants.BOOL_CONST, true); }

/* ========================
   Palabras clave en español
   ======================== */
"clase" { return new Symbol(TokenConstants.CLASS); }
"delocontrario" { return new Symbol(TokenConstants.ELSE); }
"falso" { return new Symbol(TokenConstants.BOOL_CONST, false); }
"is" { return new Symbol(TokenConstants.FI); }
"si" { return new Symbol(TokenConstants.IF); }
"en" { return new Symbol(TokenConstants.IN); }
"hereda" { return new Symbol(TokenConstants.INHERITS); }
"esvacio" { return new Symbol(TokenConstants.ISVOID); }
"lavar" { return new Symbol(TokenConstants.LET_STMT); }
"ciclo" { return new Symbol(TokenConstants.LOOP); }
"olcic" { return new Symbol(TokenConstants.POOL); }
"entonces" { return new Symbol(TokenConstants.THEN); }
"mientras" { return new Symbol(TokenConstants.WHILE); }
"encaso" { return new Symbol(TokenConstants.CASE); }
"osacne" { return new Symbol(TokenConstants.ESAC); }
"nuevo" { return new Symbol(TokenConstants.NEW); }
"de" { return new Symbol(TokenConstants.OF); }
"nel" { return new Symbol(TokenConstants.NOT); }
"verdadero" { return new Symbol(TokenConstants.BOOL_CONST, true); }

/* ====================
   Símbolos y operadores
   ==================== */
":" { return new Symbol(TokenConstants.COLON); }
"{" { return new Symbol(TokenConstants.LBRACE); }
"}" { return new Symbol(TokenConstants.RBRACE); }
"(" { return new Symbol(TokenConstants.LPAREN); }
")" { return new Symbol(TokenConstants.RPAREN); }
"," { return new Symbol(TokenConstants.COMMA); }
"=" { return new Symbol(TokenConstants.EQ); }
"<-" { return new Symbol(TokenConstants.ASSIGN); }
"*" { return new Symbol(TokenConstants.MULT); }
"+" { return new Symbol(TokenConstants.PLUS); }
"-" { return new Symbol(TokenConstants.MINUS); }
"~" { return new Symbol(TokenConstants.NEG); } // Para el operador de negación (~)
";" { return new Symbol(TokenConstants.SEMI); }

/* ============================
   Identificadores y constantes
   ============================ */
[a-zA-Z_][a-zA-Z0-9_]* { return new Symbol(TokenConstants.OBJECTID, yytext()); }
[0-9]+ { return new Symbol(TokenConstants.INT_CONST, Integer.parseInt(yytext())); }

/* ====================
   Constantes de cadena
   ==================== */
\"([^\"\\n]|\\.)*\" { return new Symbol(TokenConstants.STR_CONST, yytext()); }

/* ============================
   Manejo de caracteres no válidos
   ============================ */
. {System.err.println("LEXER BUG - UNMATCHED: " + yytext()); }
