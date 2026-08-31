; trap instruction works

.ORIG x3000

    lea r0, PassMsg
    puts

    trap x25 ; halt

    lea r0, FailMsg
    puts

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
