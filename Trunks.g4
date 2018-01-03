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
line: statement | COMMENT;

statement: opcode | loop;

loop: LOOP_STRT line+ LOOP_END;
opcode: START_TRNK | END_TRNK |
        INC_POINT | DEC_POINT |
        INC_BYTE | DEC_BYTE |
        LOOP_STRT | LOOP_END |
        OUT | IN;

/*
    Lexer Rules
 */

START_TRNK: '}-';
END_TRNK: '}';

INC_POINT: ')';
DEC_POINT: '(';

INC_BYTE: '\\';
DEC_BYTE: '/';

LOOP_STRT: '(|';
LOOP_END: '|)';

OUT: '*';
IN: '~';

COMMENT: [a-zA-Z0-9]+ ~[\r\n]* -> skip;

WS: [ \t\r\n\f]+ -> skip;

