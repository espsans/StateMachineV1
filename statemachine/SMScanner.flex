package statemachine;

import statemachine.SMParser.Terminals;
%%

%public
%final
%class StateScanner
%extends beaver.Scanner

%type beaver.Symbol
%function nextToken
%yylexthrow beaver.Scanner.Exception
%eofval{
    return new beaver.Symbol(Terminals.EOF, "end-of-file");
%eofval}

%line
%column

%{
  private beaver.Symbol sym(short id) {
    return new beaver.Symbol(id, yyline + 1, yycolumn + 1, yylength(), yytext());
  }
  private beaver.Symbol sym(short id, Object value) {
    return new beaver.Symbol(id, yyline + 1, yycolumn + 1, yylength(), value);
  }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]
Identifier     = [a-zA-Z][a-zA-Z0-9_]*

%%
{WhiteSpace} {}

"state"        { return sym(Terminals.STATE); }
"transition"   { return sym(Terminals.TRANSITION); }
"="            { return sym(Terminals.ASSIGN); }
"->"           { return sym(Terminals.ARROW); }
";"            { return sym(Terminals.SEMI); }
{Identifier}   { return sym(Terminals.ID); }

.              { throw new beaver.Scanner.Exception("illegal character \"" + yytext() + "\" at line " + yyline + "," + yycolumn); }