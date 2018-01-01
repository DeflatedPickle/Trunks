grammar Trunks;

options {
    language=Python3;
}

/*
    Parser Rules
 */


program: code EOF;
code: (trunk | COMMENT)+;
trunk: START_TRNK line+ END_TRNK;
line: opcode | COMMENT;

opcode: INC_DATA | DEC_DATA |
        INC_BYTE | DEC_BYTE|
        WHILE_STRT | WHILE_END |
        OUT | IN;

/*
    Lexer Rules
 */

INC_DATA: ')';
DEC_DATA: '(';

INC_BYTE: '\\';
DEC_BYTE: '/';

WHILE_STRT: '|';
WHILE_END: '|';

OUT: '*';
IN: '~';

START_TRNK: '}-';
END_TRNK: '}';

COMMENT: '#' ~[\r\n]* -> skip;

WS: [ \t\r\n\f]+ -> skip;

