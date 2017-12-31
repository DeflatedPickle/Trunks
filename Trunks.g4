grammar Trunks;

options {
    language=Python3;
}

/*
    Parser Rules
 */


program: (opcode NEWLINE)*;

opcode: START | INC_DATA | DEC_DATA | INC_BYTE | DEC_BYTE | OUT | IN;

comment: '#';

/*
    Lexer Rules
 */

INC_DATA: '(';
DEC_DATA: ')';

INC_BYTE: '\\';
DEC_BYTE: '/';

OUT: '*';
IN: '~';

START: '-';

NEWLINE: '\n';


