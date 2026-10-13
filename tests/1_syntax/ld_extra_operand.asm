; ld with an extra operand should not assemble

.ORIG x3000

    halt

    ld r0, Data, #1

Data .FILL #1

.END
