; ldr sets condition codes

.ORIG x3000

    lea r1, Ptr
    and r0, r0, #0 ; cc z
    ldr r0, r1, #1
    brnz Fail

    ; pass

    lea r0, PassMsg
    puts
    halt

Fail
    lea r0, FailMsg
    puts
    halt

Ptr     .FILL x300A
        .FILL #1

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"

.END
