// $antlr-format alignColons hanging, alignSemicolons hanging, useTab false
// $antlr-format allowShortRulesOnASingleLine false, columnLimit 150, reflowComments false

parser grammar FlowParser;

options {
    tokenVocab = FlowLexer;
    language = TypeScript;
}

program
    : statement_list? EOF
    ;

statement_list
    : (block | statement Semicolon)+
    ;

block
    : OpenBrace enclosed = statement_list? CloseBrace
    ;

statement
    : expression
    ;

literal
    : NullLiteral    # NullLiteral
    | BooleanLiteral # BooleanLiteral
    | StringLiteral  # StringLiteral
    | numeral        # NumericLiteral
    ;

//MO TODO check without element labeling
numeral
    : BinIntLiteral # BinIntLiteral
    | OctIntLiteral # OctIntLiteral
    | DecIntLiteral # DecIntLiteral
    | HexIntLiteral # HexIntLiteral
    | FloatLiteral  # FloatLiteral
    ;

//MO TODO subscripting, member access and function call
//MO TODO decide if to separate them out
expression
    : <assoc = right> left = expression Power right = expression                                          # PowerExpression
    | <assoc = right> op = (Not | Plus | Minus | BitNot | Cardinal) arg = expression                      # UnaryExpression
    | left = expression op = (Multiply | Divide | IntDivide | Modulus) right = expression                 # MultiplicativeExpression
    | left = expression op = (Plus | Minus) right = expression                                            # AdditiveExpression
    | left = expression op = (BitLeftShift | BitRightShift) right = expression                            # BitShiftExpression
    | left = expression op = (LessThan | MoreThan | LessThanOrEqual | MoreThanOrEqual) right = expression # ComparisonExpression
    | left = expression op = (Equal | NotEqual) right = expression                                        # EqualityExpression
    | left = expression BitAnd right = expression                                                         # BitAndExpression
    | left = expression BitXor right = expression                                                         # BitXorExpression
    | left = expression BitOr right = expression                                                          # BitOrExpression
    | left = expression And right = expression                                                            # LogicAndExpression
    | left = expression Or right = expression                                                             # LogicOrExpression
    | <assoc = right> query = expression Query if_true = expression Colon if_false = expression           # TernaryExpression
    | <assoc = right> left = expression op = (
        Assign
        | AndAssign
        | OrAssign
        | PlusAssign
        | MinusAssign
        | MultiplyAssign
        | DivideAssign
        | IntDivideAssign
        | ModulusAssign
        | PowerAssign
        | BitAndAssign
        | BitOrAssign
        | BitXorAssign
        | BitLeftShiftAssign
        | BitRightShiftAssign
    ) right = expression                         # AssignExpression
    | left = expression Comma expression         # ExpressionSequenceExpression
    | id = Identifier                            # IdentifierExpression
    | lit = literal                              # LiteralExpression
    | OpenParen enclosed = expression CloseParen # ParenthesizedExpression
    ;

//MO TODO for-if clause