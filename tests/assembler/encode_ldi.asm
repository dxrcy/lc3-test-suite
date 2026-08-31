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
;TODO:
           ; 0000000000000000
Instruction1 add r0, r0, r0
Encoding1 .FILL x0000

           ; 0000000000000000
Instruction2 add r1, r2, r3
Encoding2 .FILL x0000

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

