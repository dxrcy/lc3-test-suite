; LDR with negative offset6
; LDR DR, BaseR, offset6 where offset6 is negative

.ORIG x3000

    lea r1, Data     ; load address of Data
    ldr r0, r1, #-1  ; load value -1 offset from Data

    ; r0 should be 10

    add r3, r0, #-10 ; 10 + -10 should = 0
    brz Pass

    ; non 0 means it didnt load 10

    lea r0, FailMsg
    puts
    halt

Pass
    lea r0, PassMsg
    puts
    halt

        .FILL #10    ; Data - 1
Data    .BLKW #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
