; .FILL matching instruction encoding should be executed

.ORIG x3000

    and r5, r5, #0
    add r5, r5, #-13

    .FILL x156D ; add r2, r5, #13

    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
