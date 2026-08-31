; and sets condition codes correctly

.ORIG x3000

    ; n

    add r0, r0, #-1
    add r1, r1, #0  ; set cc z
    and r0, r0, #-1 ; set cc n
    brzp Fail

    ; z

    and r0, r0, #0  ; set cc z
    brnp Fail

    ; p

    add r0, r0, #1
    add r1, r1, #0  ; set cc z
    and r0, r0, #1  ; set cc p
    brnz Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt


PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
