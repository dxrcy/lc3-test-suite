.ORIG xFDF1

    lea r0, PassMsg
    puts
    halt ; xFDF3

PassMsg .STRINGZ "TEST_PASSED" ; xFDF4-xFDFF, null at xFDFF last user word

    .BLKW #0 ; doesnt write any words so should be allowed

.END
