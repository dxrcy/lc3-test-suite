; ldi instruction encoding must match
; 1010 DR1 PCoffset9

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

           ; 1010 000 111111111
Instruction1 ldi  r0, Instruction1
Encoding1 .FILL xA1FF

           ; 1010 011 111111101
Instruction2 ldi  r3, Instruction1
Encoding2 .FILL xA7FD

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
