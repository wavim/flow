// $antlr-format alignColons hanging, alignSemicolons hanging, useTab false
// $antlr-format allowShortRulesOnASingleLine false

parser grammar FlowParser;

options {
    language = TypeScript;
    tokenVocab = FlowLexer;
}

program
    : statementList? EOF
    ;

statementList
    : statement+
    ;

statement
    : block
    ;

block
    : OpenBrace statementList? CloseBrace
    ;

assignStatement
    : assignVariant leftValue Assign rightValue
    ;

assignVariant
    : Ref
    | Const
    ;

leftValue
    :
    ;

rightValue
    :
    ;

// NOT IN ANYWAY FINISHED, LONG WAY TO GO