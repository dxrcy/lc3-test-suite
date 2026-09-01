.ORIG x3000

    halt

    lea r3, Data
    str r0, r3, #0
    str r1, r3, #1
    str r2, r3, #-1
    str r4, r3, #31
    str r5, r3, #-32

Data .BLKW #1

.END
