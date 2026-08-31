; label name over 20 characters should not assemble

.ORIG x3000

    ld r0, LabelOver20Characters

LabelOver20Characters .FILL #0

.END