; trap does not set condition codes

.ORIG x3000

    and r1, r1, #0  ; cc z
    out
    brnp Fail

    add r1, r1, #1  ; cc p
    out
    brnz Fail

    add r1, r1, #-2 ; cc n
    out
    brzp Fail

    ; pass

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
