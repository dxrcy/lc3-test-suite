; addimm instruction encoding must match
; 0101 DR1 SR1 1 imm5_

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

           ; 0101 000 000 1 00000
Instruction1 and  r0, r0,   #0
Encoding1 .FILL x5020

           ; 0101 010 101 1 01101
Instruction2 and  r2, r5,   #13
Encoding2 .FILL x556D

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
