; add instruction works

.ORIG x3000

    add r0, r0, #1  ; 1
    add r1, r1, #1  ; + 1
    add r2, r0, r1  ; = 2

    add r2, r2, #-2 ; -2 = 0
    brnp Fail

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

