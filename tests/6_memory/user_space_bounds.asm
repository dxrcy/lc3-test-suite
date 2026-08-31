; upper and lower bounds of user space should be accessable

.ORIG x3000

    ; x0000 - x2FFF privileged memory
    ; x3000 - xFDFF user space
    ; xFE00 - xFFFF I/O page

    ldi r0, Upper
    ldi r0, Lower

    ; pass if it doesnt crash

    lea r0, PassMsg
    puts
    halt

Upper .FILL x3000
Lower .FILL xFDFF

PassMsg .STRINGZ "TEST_PASSED"

.END
