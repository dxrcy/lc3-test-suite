; jsr PCoffset11 under -1024 words should not assemble

.ORIG x3000

FarLabel .FILL #0
         .BLKW #1023

    jsr FarLabel

.END

