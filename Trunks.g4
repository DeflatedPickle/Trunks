grammar Trunks;

options {
    language=Python3;
}

/*
    Parser Rules
 */


program: code+ EOF;
code: (opcode NEWLINE)+;
line: (opcode | COMMENT) NEWLINE;

opcode: START | END |
        INC_DATA | DEC_DATA |
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

START: '}-';
END: '}';

COMMENT: '#';

NEWLINE: '\r\n';
WS: [ \t\r\n\f]+ -> skip;

