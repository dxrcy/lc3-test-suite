; br instruction works

.ORIG x3000

    add r0, r0, #0
    brnp Fail

    add r0, r0, #1
    brnz Fail

    add r0, r0, #-2
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



