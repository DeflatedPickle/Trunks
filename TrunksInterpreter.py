import antlr4
import io

from TrunksLexer import TrunksLexer
from TrunksListener import TrunksListener
from TrunksParser import TrunksParser

class TrunksInterpreter(TrunksListener):
    def __init__(self):
        self.pointer: int = 0
        self.cells: list = [0] * 10
        self.trunks: int = 0

        self.flag_while: bool = False

    def enterCode(self, ctx:TrunksParser.CodeContext):
        print(f"Program: {ctx.getText()}\n")

    def exitLine(self, ctx:TrunksParser.LineContext):
        print(ctx.getText())

        if ctx.getText() == "}-":
            # START_TRNK
            self.trunks += 1

        elif ctx.getText() == "}":
            # END_TRNK
            pass

        elif ctx.getText() == ")":
            # INC_POINT
            self.pointer += 1

        elif ctx.getText() == "(":
            # DEC_POINT
            self.pointer -= 1

        elif ctx.getText() == "\\":
            # INC_BYTE
            self.cells[self.pointer] += 1

        elif ctx.getText() == "/":
            # DEC_BYTE
            self.cells[self.pointer] -= 1

        elif ctx.getText() == "|":
            # WHILE_STRT/WHILE_END
            if not self.flag_while:
                self.flag_while = True

            if self.flag_while:
                self.flag_while = False

        elif ctx.getText() == "*":
            # OUT
            print("OUT:", self.cells[self.pointer - 1])

        elif ctx.getText() == "~":
            # IN
            self.cells[self.pointer] = input()

        print(f"Pointer: {self.pointer}", f"Cells: {self.cells}", f"Trunks: {self.trunks}\n", sep="\n")


if __name__ == "__main__":
    lexer = TrunksLexer(antlr4.FileStream("add.tr"))
    stream = antlr4.CommonTokenStream(lexer)
    parser = TrunksParser(stream)
    tree = parser.program()

    interpret = TrunksInterpreter()
    walker = antlr4.ParseTreeWalker()
    walker.walk(interpret, tree)

