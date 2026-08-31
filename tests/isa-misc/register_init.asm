; registers are initialized to zero

.ORIG x3000

    add r0, r0, #0
    brnp Fail

    add r1, r1, #0
    brnp Fail

    add r2, r2, #0
    brnp Fail

    add r3, r3, #0
    brnp Fail

    add r4, r4, #0
    brnp Fail

    add r5, r5, #0
    brnp Fail

    add r6, r6, #0
    brnp Fail

    add r7, r7, #0
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
