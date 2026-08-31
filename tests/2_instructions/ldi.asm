; ldi instruction works

.ORIG x3000

    ldi r0, Value
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

Value .FILL x300A
      .FILL #3

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
