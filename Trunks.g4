grammar Trunks;

options {
    language=Python3;
}

/*
    Parser Rules
 */


program: (opcode NEWLINE)*;

opcode: START | END |
        INC_DATA | DEC_DATA |
        INC_BYTE | DEC_BYTE|
        WHILE_STRT | WHILE_END |
        OUT | IN;

comment: '#';

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

START: '}-';
END: '}';

NEWLINE: '\r\n';
WS: [ \t\r\n\f]+ -> skip;

