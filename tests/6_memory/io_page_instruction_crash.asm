; emitting past xFE00 should crash

.ORIG xFDFF

    halt

    halt ; io page memory

.END
