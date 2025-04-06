// // $antlr-format alignColons hanging, alignSemicolons hanging, useTab false
// // $antlr-format allowShortRulesOnASingleLine false

// parser grammar FlowParser;

// options {
//     language = TypeScript;
//     tokenVocab = FlowLexer;
// }

// numeral
//     : DecimalInteger
//     | Float
//     ;

// expression
//     : <assoc = right> expression Power expression
//     | (Plus | Minus) expression
//     | expression (Multiply | Divide | Modulus) expression
//     | expression (Plus | Minus) expression
//     | OpenParen expression CloseParen
//     | numeral
//     ;
// //MO TODO expressionSequence, exp (, exp)

// statement
//     : block
//     | expression SemiColon
//     ;

// block
//     : OpenBrace statementList? CloseBrace
//     ;

// statementList
//     : statement+
//     ;

// program
//     : statementList? EOF
//     ;