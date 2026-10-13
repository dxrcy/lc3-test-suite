; usp value (xFDFF) shouldnt be modified by the os

.ORIG xFDDE

    ld r0, USP
    out ; os does things
    brz Pass ; xFDFF should still be 0

    lea r0, FailMsg
    puts
    halt

Pass
    lea r0, PassMsg
    puts
    halt

PassMsg .STRINGZ "TEST_PASSED"
FailMsg .STRINGZ "TEST_FAILED"
USP ; xFDFF

.END
