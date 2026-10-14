; puts prints only the low byte of each word

.ORIG x3000

    lea r0, Msg
    puts

    halt

Msg .FILL x5F54 ; _T
    .FILL x5F45 ; _E
    .FILL x5F53 ; _S
    .FILL x5F54 ; _T
    .FILL x5F5F ; __
    .FILL x5F50 ; _P
    .FILL x5F41 ; _A
    .FILL x5F53 ; _S
    .FILL x5F53 ; _S
    .FILL x5F45 ; _E
    .FILL x5F44 ; _D
    .FILL x0000

.END
