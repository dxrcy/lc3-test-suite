.ORIG x3000

    halt

    and r0, r1, r2
    and r3, r4, r5
    and r7, r7, r0
    and r0, r1, x0
    and r2, r3, #15
    and r4, r5, #-16
    and r6, r7, #-1

.END
