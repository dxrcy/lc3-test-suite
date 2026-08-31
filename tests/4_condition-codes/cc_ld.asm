; ld sets condition codes

.ORIG x3000

    and r0, r0, #0 ; cc z
    ld r0, Value
    brnz Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Value   .FILL #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
