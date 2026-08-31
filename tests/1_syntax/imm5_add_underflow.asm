; add imm5 underflow at #-17 should not assemble

.ORIG x3000

    add r0, r0, #-17

.END
