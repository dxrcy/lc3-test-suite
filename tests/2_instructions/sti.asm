; sti instruction works

.ORIG x3000

    add r0, r0, #3
    sti r0, Value

    ldi r1, Value
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

Value .FILL x300C
      .BLKW #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
