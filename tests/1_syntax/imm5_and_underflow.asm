; and imm5 underflow at #-17 should not assemble

.ORIG x3000

    halt

    and r0, r0, #-17

.END
