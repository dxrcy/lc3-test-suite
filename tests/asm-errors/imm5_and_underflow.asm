; and imm5 underflow at #-17 should not assemble

.ORIG x3000

    and r0, r0, #-17

.END
