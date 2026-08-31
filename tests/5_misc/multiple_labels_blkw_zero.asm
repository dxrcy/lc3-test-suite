; multiple labels referring to the same address
; but because .BLKW reserved 0 words

.ORIG x3000

    ld r0, Label1
    add r0, r0, #-3
    brnp Fail

    ld r0, Label2
    add r0, r0, #-3
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Label1 .BLKW #0
Label2 .FILL #3

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
