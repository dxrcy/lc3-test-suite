; trap does not modify R7 in lc3 3rd edition

.ORIG x3000

    and r7, r7, #0 ; r7 is 0

    out            ; trap out

    add r0, r7, #0 ; r7 should still be 0
    brz Pass

    lea r0, FailMsg
    puts
    halt

Pass
    lea r0, PassMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
