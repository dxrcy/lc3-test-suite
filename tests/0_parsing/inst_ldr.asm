.ORIG x3000

    halt

    ld r0, Data
    ldr r2, r0, #0
    ldr r3, r0, x1
    ldr r4, r0, #-1
    ldr r5, r0, #31
    ldr r6, r0, #-32

Data .FILL #0

.END
