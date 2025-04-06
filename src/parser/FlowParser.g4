// $antlr-format alignColons hanging, alignSemicolons hanging, useTab false
// $antlr-format allowShortRulesOnASingleLine false

parser grammar FlowParser;

options {
    tokenVocab = FlowLexer;
    language = TypeScript;
}

program
    : statementList? EOF
    ;

statementList
    : (block | statement Semicolon)+
    ;

block
    : OpenBrace statementList? CloseBrace
    ;

statement
    : numeral
    ;

numeral
    : BinIntLiteral
    | OctIntLiteral
    | DecIntLiteral
    | HexIntLiteral
    | FloatLiteral
    ;

// expression : <assoc = right> expression Power expression | (Plus | Minus) expression | expression
// (Multiply | Divide | Modulus) expression | expression (Plus | Minus) expression | OpenParen
// expression CloseParen | numeral ; //MO TODO expressionSequence, exp (, exp)