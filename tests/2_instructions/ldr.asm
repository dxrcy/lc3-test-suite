; ldi instruction works

.ORIG x3000

    lea r0, Value
    ldr r0, r0, #0
    add r0, r0, #-3
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Value .FILL #3

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
