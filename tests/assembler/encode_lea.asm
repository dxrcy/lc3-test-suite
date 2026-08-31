; lea instruction encoding must match
; 1110 DR1 PCoffset9

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

           ; 1110 000 100000000
Instruction1 lea  r0, Instruction1
Encoding1 .FILL xE100

           ; 1110 111 100000011
Instruction2 lea  r7, Instruction1
Encoding2 .FILL xEF03

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


