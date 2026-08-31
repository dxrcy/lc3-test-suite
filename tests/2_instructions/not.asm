; and instruction works

.ORIG x3000

    add r0, r0, #15  ; 0000000000001111
    not r0, r0       ; 1111111111110000
    add r0, r0, #15  ; 1111111111111111
    not r0, r0       ; 0
    brnp Fail

    add r0, r0, #9
    not r0, r0
    not r0, r0
    add r0, r0, #-9
    brnp Fail

    add r0, r0, #9
    not r0, r0
    add r0, r0, #1
    add r0, r0, #9
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
