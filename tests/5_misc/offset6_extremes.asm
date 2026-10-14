; LDR and STR with the extreme valid offset6 values #31 and #-32

.ORIG x3000

    lea r1, Data

    ldr r0, r1, #-32    ; read Data - 32
    add r2, r0, #-11
    brnp Fail

    ldr r0, r1, #31     ; read Data + 31
    add r2, r0, #-11
    brnp Fail

    and r0, r0, #0
    add r0, r0, #7
    str r0, r1, #-32    ; write Data - 32
    ldr r3, r1, #-32
    add r3, r3, #-7
    brnp Fail

    and r0, r0, #0
    add r0, r0, #9
    str r0, r1, #31     ; write Data + 31
    ldr r3, r1, #31
    add r3, r3, #-9
    brnp Fail

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

        .FILL #11       ; Data - 32
        .BLKW #31
Data    .FILL #42
        .BLKW #30
        .FILL #11       ; Data + 31

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
