; user memory at xFDFF should init to zero

.ORIG x3000

    ldi r0, Ptr
    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Ptr .FILL xFDFF

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
