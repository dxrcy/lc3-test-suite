; jsrr reads base register before writing return address to r7

.ORIG x3000

    lea r7, Pass
    jsrr r7

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
