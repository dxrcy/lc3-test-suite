; invalid register number 'r8' should not assemble

.ORIG x3000

    halt

    add r0, r8, #1

.END
