; rti in user mode should crash

.ORIG x3000

    rti

    lea r0, FailMsg
    puts
    halt

FailMsg .STRINGZ "TEST_FAILED"

.END
