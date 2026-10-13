; trap does not modify non return value registers
; including R7 in lc3 3rd edition

.ORIG x3000

    ; registers are 0
    and r0, r0, #0
    and r1, r1, #0
    and r2, r2, #0
    and r3, r3, #0
    and r4, r4, #0
    and r5, r5, #0
    and r6, r6, #0
    and r7, r7, #0

    out ; no return value

    ; should still be 0
    add r0, r0, #0
    brnp Fail
    add r1, r1, #0
    brnp Fail
    add r2, r2, #0
    brnp Fail
    add r3, r3, #0
    brnp Fail
    add r4, r4, #0
    brnp Fail
    add r5, r5, #0
    brnp Fail
    add r6, r6, #0
    brnp Fail
    add r7, r7, #0
    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
