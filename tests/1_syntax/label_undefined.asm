; undefined label name should not assemble

.ORIG x3000

    halt

    ld r0, NonExistentLabel

.END
