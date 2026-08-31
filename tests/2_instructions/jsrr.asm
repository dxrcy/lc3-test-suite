; jsrr instruction works

.ORIG x3000

    lea r0, Pass
    jsrr r0
    br Fail

Fail
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
