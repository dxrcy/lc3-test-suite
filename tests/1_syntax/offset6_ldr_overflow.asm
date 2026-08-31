; ldr offset6 overflow at #32 should not assemble

.ORIG x3000

    ldr r0, r1, #32

.END
