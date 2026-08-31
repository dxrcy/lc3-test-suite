; ldr instruction encoding must match
; 0110 DR1 BR1 offst6

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

           ; 0110 000 000 000000
Instruction1 ldr  r0, r0, #0
Encoding1 .FILL x6CD9

           ; 0110 110 011 011001
Instruction2 ldr  r6, r3, #25
Encoding2 .FILL x6000

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

