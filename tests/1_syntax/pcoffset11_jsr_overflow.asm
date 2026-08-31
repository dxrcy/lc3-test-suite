; jsr PCoffset11 over 1023 words should not assemble

.ORIG x3000

    halt

    jsr FarLabel

         .BLKW #1024
FarLabel .FILL #0

.END
