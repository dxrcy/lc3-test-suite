.ORIG x3000

    halt

    add r0, r1, r2
    add r3, r4, r5
    add r7, r7, r0
    add r0, r1, x0
    add r2, r3, #15
    add r4, r5, #-16
    add r6, r7, #-1

.END
