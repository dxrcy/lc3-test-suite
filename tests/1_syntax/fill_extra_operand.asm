; .FILL with two operands should not assemble

.ORIG x3000

    halt

    .FILL #1 #2

.END
