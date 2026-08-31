; lea instruction works

.ORIG x3000

    lea r0, Addr
    ld r1, Value
    not r1, r1
    add r1, r1, #1
    add r0, r0, r1
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Addr    .BLKW #1
Value   .FILL x300C

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
