; hex literal prefix can be uppercase X

.ORIG X3000

    halt

    add r0 r0 X0

.FILL XFFFF
.FILL X8000
.FILL 0X7B

.END
