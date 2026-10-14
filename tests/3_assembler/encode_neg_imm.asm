; negative immediate encoding must match
; add: 0001 DR1 SR1 1 imm5
; and: 0101 DR1 SR1 1 imm5

.ORIG x3000

    ld r0, Instruction1
    ld r1, Encoding1

    add r2, r1, #0
    not r2, r2
    add r2, r2, #1

    add r3, r0, r2 ; instruction - encoding
    brnp Fail

    ; first passed

    ld r0, Instruction2
    ld r1, Encoding2

    add r2, r1, #0
    not r2, r2
    add r2, r2, #1

    add r3, r0, r2 ; instruction - encoding
    brnp Fail

    ; both passed

    br Pass

           ; 0001 100 100 1 11111
Instruction1 add  r4, r4,  #-1
Encoding1 .FILL x193F

           ; 0101 000 000 1 11111
Instruction2 and  r0, r0,  #-1
Encoding2 .FILL x503F

Fail
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
