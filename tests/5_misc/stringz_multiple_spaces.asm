; .STRINGZ must preserve consecutive spaces inside the literal

.ORIG x3000

    lea r0, Msg

    ld r2, ChA
    ld r3, ChSpace
    ld r4, ChB

    ldr r1, r0, #0     ; 'a'
    add r1, r1, r2
    brnp Fail

    ldr r1, r0, #1     ; space
    add r1, r1, r3
    brnp Fail

    ldr r1, r0, #2     ; space
    add r1, r1, r3
    brnp Fail

    ldr r1, r0, #3     ; 'b'
    add r1, r1, r4
    brnp Fail

    ldr r1, r0, #4     ; null
    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Msg     .STRINGZ "a  b"

ChA     .FILL #-97
ChSpace .FILL #-32
ChB     .FILL #-98

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
