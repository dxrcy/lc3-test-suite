; and instruction works

.ORIG x3000

    add r0, r0, #15  ; 1111
    add r1, r1, #9   ; 1001
    add r2, r2, #10  ; 1010

    and r3, r0, r1   ; 1001
    and r4, r0, r2   ; 1010
    and r5, r1, r2   ; 1000

    add r3, r3, #-9
    brnp Fail

    add r4, r4, #-10
    brnp Fail

    add r5, r5, #-8
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
