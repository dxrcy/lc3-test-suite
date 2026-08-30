; undefined label name should not assemble

.ORIG x3000

    ld r0, NonExistentLabel

.END