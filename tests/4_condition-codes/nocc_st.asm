; st does not set condition codes

.ORIG x3000

    and r0, r0, #0  ; cc z
    add r1, r1, #-1 ; cc n
    st r0, Value
    brzp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Value   .BLKW #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
