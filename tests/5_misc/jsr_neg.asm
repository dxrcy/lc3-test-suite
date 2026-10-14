; jsr with a negative pc offset jumps to the correct address

.ORIG x3000

    br Start ; skip over subroutine

Subroutine
    add r0, r0, #1
    ret

Start
    jsr Subroutine ; backward reference
    add r0, r0, #-1
    brz Pass

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
