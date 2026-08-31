; str instruction works

.ORIG x3000

    lea r3, Value

    add r0, r0, #3
    str r0, r3, #1

    ldr r1, r3, #1
    add r2, r1, #-3
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Value .BLKW #2

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
