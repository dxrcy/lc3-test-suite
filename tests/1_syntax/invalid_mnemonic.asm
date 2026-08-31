; invalid instruction mnemonic 'xyz' should not assemble

.ORIG x3000

    halt

    xyz r0, r0, #1

.END
