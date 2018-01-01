import antlr4
import io

from TrunksLexer import TrunksLexer
from TrunksListener import TrunksListener
from TrunksParser import TrunksParser

class TrunksInterpreter(TrunksListener):
    def __init__(self):
        self.cells: list = []

    def enterCode(self, ctx:TrunksParser.CodeContext):
        print(ctx.getText())


if __name__ == "__main__":
    lexer = TrunksLexer(antlr4.FileStream("add.tr"))
    stream = antlr4.CommonTokenStream(lexer)
    parser = TrunksParser(stream)
    tree = parser.program()

    interpret = TrunksInterpreter()
    walker = antlr4.ParseTreeWalker()
    walker.walk(interpret, tree)

