.ORIG x3000

    ld r0, Pointer
    ld r1, Expected
    not r1, r1
    add r1, r1, #1
    add r0, r0, r1
    brz Pass
    br Fail

Pointer  .FILL Label
Label    .FILL #0
Expected .FILL x3008

Fail
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

