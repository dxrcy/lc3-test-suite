; ldr offset6 underflow at #-33 should not assemble

.ORIG x3000

    halt

    ldr r0, r1, #-33

.END
