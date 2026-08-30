; add sets condition codes correctly

.ORIG x3000

    ; n

    add r0, r0, #-1 ; -1
    brzp Fail

    ; z

    add r0, r0, #1  ; 0
    brnp Fail

    ; p

    add r0, r0, #1  ; 1
    brnz Fail

    ; pass

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
