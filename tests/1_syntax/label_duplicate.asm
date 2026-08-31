; duplicate label 'Label' should not assemble

.ORIG x3000

    halt

Label .FILL #1
Label .FILL #1

.END
