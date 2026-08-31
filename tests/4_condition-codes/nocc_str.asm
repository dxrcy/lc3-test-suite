; str does not set condition codes

.ORIG x3000

    lea r2, Value
    and r0, r0, #0  ; cc z
    add r1, r1, #-1 ; cc n
    str r0, r2, #0
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
