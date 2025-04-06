// $antlr-format alignColons trailing, columnLimit 150, useTab false

lexer grammar FlowLexer;

options {
    language = Cpp;
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

// constructs
OpenParen    : '(';
CloseParen   : ')';
OpenBracket  : '[';
CloseBracket : ']';
OpenBrace    : '{';
CloseBrace   : '}';

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
Plus     : '+';
Minus    : '-';
Multiply : '*';
Divide   : '/';
Modulus  : '%';
Power    : '^';

// bitwise operators
BitNot        : '~';
BitAnd        : '&&';
BitOr         : '||';
BitXor        : '<>';
BitLeftShift  : '<<';
BitRightShift : '>>';

// assignment operator
Assign: ':=';

// boolean compound assignment operators
AndAssign : '&=';
OrAssign  : '|=';

// arithmetic compound assignment operators
PlusAssign     : '+=';
MinusAssign    : '-=';
MultiplyAssign : '*=';
DivideAssign   : '/=';
ModulusAssign  : '%=';
PowerAssign    : '^=';

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
DecIntLiteral : NoPrefixDecimal | '0' [dD] [0-9]+;
BinIntLiteral : '0' [bB] [01]+;
OctIntLiteral : '0' [oO] [0-7]+;
HexIntLiteral : '0' [xX] [0-9a-fA-F]+;

// floating point numeral
FloatLiteral:
    NoPrefixDecimal FloatExponent
    | NoPrefixDecimal? ('.' NoPrefixDecimal | NoPrefixDecimal '.') NoPrefixDecimal? FloatExponent?;

// identifier
Identifier: [_a-zA-Z] [_a-zA-Z0-9]*;

// string literal
StringLiteral: '"' StringCharacter* '"';

// whitespace
WhiteSpace: [ \t]+ -> channel(HIDDEN);

// unexpected
Unexpected: . -> channel(ERROR);

// fragments
fragment NoPrefixDecimal: '0' | [1-9] [0-9]+;

fragment FloatExponent: [eE] [+-]? NoPrefixDecimal;

fragment EscapeSequence: '\\' ["btnvfr\\];

fragment StringCharacter: ~["\r\n\\] | EscapeSequence;