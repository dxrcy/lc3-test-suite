; not sets condition codes correctly

.ORIG x3000

    ; n

    add r0, r0, #1
    add r1, r1, #0  ; set cc z
    not r0, r0      ; set cc n -2
    brzp Fail

    ; z

    add r0, r0, #1  ; -1
    not r0, r0      ; set cc z
    brnp Fail

    ; p

    add r0, r0, #-2 ; -2
    not r0, r0      ; set cc p 1
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
