; br with no condition bits (nzp = 000) never branches

.ORIG x3000

    and r0, r0, #0 ; cc z

    ; nzp = 000, offset +3
    .FILL x0003 ; br Fail

    lea r0, PassMsg
    puts
    halt

    lea r0, FailMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
