; trap does not set condition codes

.ORIG x3000

    lea r0, TestMsg
    and r1, r1, #0  ; cc z
    out
    brnp Fail
    puts
    brnp Fail
    putsp
    brnp Fail

    lea r0, TestMsg
    add r1, r1, #1  ; cc p
    out
    brnz Fail
    puts
    brnz Fail
    putsp
    brnz Fail

    lea r0, TestMsg
    add r1, r1, #-2 ; cc n
    out
    brzp Fail
    puts
    brzp Fail
    putsp
    brzp Fail

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
TestMsg .STRINGZ "test"
        .BLKW #1

.END
