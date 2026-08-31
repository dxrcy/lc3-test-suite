; add imm5 overflow at #16 should not assemble

.ORIG x3000

    add r0, r0, #16

.END
