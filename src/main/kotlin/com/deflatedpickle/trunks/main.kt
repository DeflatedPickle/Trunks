package com.deflatedpickle.trunks

import com.google.common.io.Resources
import org.antlr.v4.runtime.CharStreams
import org.antlr.v4.runtime.CommonTokenStream
import org.antlr.v4.runtime.tree.ParseTreeWalker

fun main() {
    val lexer = TrunksLexer(CharStreams.fromStream(Resources.getResource("add.tr").openStream()))
    val tokenStream = CommonTokenStream(lexer)
    val parser = TrunksParser(tokenStream)
    val tree = parser.program()

    val interpreter = TrunksInterpreter()
    val walker = ParseTreeWalker()
    walker.walk(interpreter, tree)
}