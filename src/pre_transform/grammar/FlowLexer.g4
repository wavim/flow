// $antlr-format alignColons trailing, useTab false

lexer grammar FlowLexer;

options {
    language = TypeScript;
}

// comments
MultiLineComment  : '/*' .*? '*/' -> channel(HIDDEN);
SingleLineComment : '//' ~[\r\n]* -> channel(HIDDEN);

// reserved keywords
Ref     : 'ref';
Const   : 'const';
If      : 'if';
Elif    : 'elif';
Else    : 'else';
While   : 'while';
Do      : 'do';
Until   : 'until';
For     : 'for';
In      : 'in';
Skip    : 'skip';
Switch  : 'switch';
Case    : 'case';
Default : 'default';
Break   : 'break';
Pass    : 'pass';
Return  : 'return';

// constructs
OpenBrace  : '{';
CloseBrace : '}';
Comma      : ',';
SemiColon  : ';';

// operators
Assign         : ':=';
Plus           : '+';
Minus          : '-';
Multiply       : '*';
Divide         : '/';
Modulus        : '%';
Power          : '^';
PlusAssign     : '+=';
MinusAssign    : '-=';
MultiplyAssign : '*=';
DivideAssign   : '/=';
ModulusAssign  : '%=';
PowerAssign    : '^=';
// bitxor? used ^ in C

// NOT IN ANYWAY FINISHED, LONG WAY TO GO