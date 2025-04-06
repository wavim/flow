// $antlr-format alignColons trailing, columnLimit 150, useTab false

lexer grammar FlowLexer;

options {
    language = TypeScript;
}

channels {
    ERROR
}

// comments
MultiLineComment  : '/*' .*? '*/' -> channel(HIDDEN);
SingleLineComment : '//' ~[\r\n]* -> channel(HIDDEN);

// expression delimiter
Semicolon: ';';

// reserved keywords
Ref     : 'ref';
Kref    : 'kref';
If      : 'if';
Elif    : 'elif';
Else    : 'else';
While   : 'while';
Do      : 'do';
Until   : 'until';
For     : 'for';
In      : 'in';
Switch  : 'switch';
Case    : 'case';
Default : 'default';
Pass    : 'pass';
Skip    : 'skip';
Break   : 'break';
Return  : 'return';

// reserved types
Bool   : 'bool';
Int    : 'int';
Float  : 'float';
String : 'string';

// reserved object
Std: 'std';

// constructs
OpenParen    : '(';
CloseParen   : ')';
OpenBracket  : '[';
CloseBracket : ']';
OpenBrace    : '{';
CloseBrace   : '}';

// lambda arrow
Arrow: '=>';

// comparison operators
Equal           : '=';
NotEqual        : '!=';
LessThan        : '<';
MoreThan        : '>';
LessThanOrEqual : '<=';
MoreThanOrEqual : '>=';

// boolean operators
Not : '!';
And : '&';
Or  : '|';

// arithmetic operators
Plus      : '+';
Minus     : '-';
Multiply  : '*';
Divide    : '/';
IntDivide : '//';
Modulus   : '%';
Power     : '^';

// bitwise operators
BitNot        : '~';
BitAnd        : '&&';
BitOr         : '||';
BitXor        : '<>';
BitLeftShift  : '<<';
BitRightShift : '>>';

// cardinal operator
Cardinal: '#';

// assignment operator
Assign: ':=';

// boolean compound assignment operators
AndAssign : '&=';
OrAssign  : '|=';

// arithmetic compound assignment operators
PlusAssign      : '+=';
MinusAssign     : '-=';
MultiplyAssign  : '*=';
DivideAssign    : '/=';
IntDivideAssign : '//=';
ModulusAssign   : '%=';
PowerAssign     : '^=';

// bitwise compound assignment operators
BitAndAssign        : '&&=';
BitOrAssign         : '||=';
BitXorAssign        : '<>=';
BitLeftShiftAssign  : '<<=';
BitRightShiftAssign : '>>=';

// null literal
NullLiteral: 'null';

// boolean literals
BooleanLiteral: 'true' | 'false';

// integer numerals
BinIntLiteral : '0' [bB] [01]+;
OctIntLiteral : '0' [oO] [0-7]+;
DecIntLiteral : '0' [dD] [0-9]+ | NoPrefixDecimal;
HexIntLiteral : '0' [xX] [0-9a-fA-F]+;

// floating point numeral
FloatLiteral:
    NoPrefixDecimal? ('.' NoPrefixDecimal | NoPrefixDecimal '.') NoPrefixDecimal? FloatExponent?
    | NoPrefixDecimal FloatExponent
    | 'inf';

// identifier
Identifier: [_a-zA-Z] [_a-zA-Z0-9]*;

// string literal
StringLiteral: [rRfF]? '"' StringCharacter* '"';

// whitespace
WhiteSpace: [ \t]+ -> channel(HIDDEN);

// unexpected
Unexpected: . -> channel(ERROR);

// fragments
fragment NoPrefixDecimal: '0' | [1-9] [0-9]*;

fragment FloatExponent: [eE] [+-]? NoPrefixDecimal;

fragment EscapeSequence: '\\' ~[\r\n];

fragment StringCharacter: ~["\r\n\\] | EscapeSequence;