; STR with negative offset6
; STR DR, BaseR, offset6 where offset6 is negative

.ORIG x3000

    lea r1, Data     ; load address of Data
    and r0, r0, #0
    add r0, r0, #10

    ; r0 should be 10

    str r0, r1, #-1  ; store value -1 offset from Data

    ; Dest should now contain 10

    ld r2, Dest
    add r3, r2, #-10
    brz Pass

    ; non 0 means it didnt store 10

    lea r0, FailMsg
    puts
    halt

Pass
    lea r0, PassMsg
    puts
    halt

Dest    .BLKW #1    ; Data - 1
Data    .BLKW #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END