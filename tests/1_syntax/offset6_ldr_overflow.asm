; ldr offset6 overflow at #32 should not assemble

.ORIG x3000

    halt

    ldr r0, r1, #32

.END
