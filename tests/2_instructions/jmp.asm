; jmp instruction works

.ORIG x3000

    lea r0, Pass
    jmp r0 ; jump to Pass

    ; fail

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
