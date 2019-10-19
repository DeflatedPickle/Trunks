package com.deflatedpickle.trunks

class TrunksInterpreter : TrunksBaseListener() {
    var pointer = 0
    val cellList = MutableList(1024) { 0 }
    var trunks = 0

    override fun enterProgram(ctx: TrunksParser.ProgramContext) {
        println("Program: ${ctx.text}\n")
    }

    override fun exitOpcode(ctx: TrunksParser.OpcodeContext) {
        println("Opcode: ${ctx.text}")

        when (ctx.text) {
            ")" -> this.pointer++
            "(" -> this.pointer--
            "\\" -> this.cellList[this.pointer]++
            "/" -> this.cellList[this.pointer]--
            "*" -> print(this.cellList[this.pointer - 1])
            "~" -> this.cellList[this.pointer] = readLine()!!.toInt()
        }

        println("Pointer: ${this.pointer} Cells: ${this.cellList} Trunks: ${this.trunks}\n")
    }

    override fun exitLoop(ctx: TrunksParser.LoopContext) {
        println("Loop: ${ctx.text}")

        println("Pointer: ${this.pointer} Cells: ${this.cellList} Trunks: ${this.trunks}\n")
    }

    override fun exitTrunk(ctx: TrunksParser.TrunkContext) {
        this.trunks++
    }
}