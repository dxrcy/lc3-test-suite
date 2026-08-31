; add instruction encoding must match
; 0001 DR1 SR1 0 00 SR2

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

           ; 0001 000 000 0 00 000
Instruction1 add  r0, r0,      r0
Encoding1 .FILL x1000

           ; 0001 010 101 0 00 110
Instruction2 add  r2, r5,      r6
Encoding2 .FILL x1546

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
