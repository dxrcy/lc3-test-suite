; x7FFF = 32767
; x8000 = -32768
; 32767 + 1 = -32768

.ORIG x3000

    ld r0, Max
    ld r1, Min
    ld r2, MaxDecim
    ld r3, MinDecim

    add r4, r0, #0 ; Max is p
    brnz Fail

    add r4, r1, #0 ; Min is n
    brzp Fail

    add r4, r2, #0 ; MaxDecim is p
    brnz Fail

    add r4, r3, #0 ; MinDecim is n
    brzp Fail

    not r4, r0     ; Max == MaxDecim
    and r4, r4, r2
    brnp Fail

    not r4, r1     ; Min == MinDecim
    and r4, r4, r3
    brnp Fail

    add r4, r0, #1 ; Max + 1 = Min
    not r5, r1
    and r5, r5, r4
    brnp Fail

    add r4, r1, #-1 ; Min - 1 = Max
    not r5, r0
    and r5, r5, r4
    brnp Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Max      .FILL x7FFF
Min      .FILL x8000
MaxDecim .FILL #32767
MinDecim .FILL #-32768

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
