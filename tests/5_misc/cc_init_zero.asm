; condition codes should initialise to z

.ORIG x3000

    brn Fail
    brp Fail
    brz Pass

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
