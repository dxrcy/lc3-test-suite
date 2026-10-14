; st with a negative offset works

.ORIG x3000

Value .BLKW #1

    add r0, r0, #7
    st r0, Value

    ld r1, Value
    add r2, r1, #-7
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
