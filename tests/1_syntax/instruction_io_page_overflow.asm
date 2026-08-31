; emitting past xFE00 should fail to assemble

.ORIG xFDFF

    halt

    .FILL #0 ; io page memory

.END
