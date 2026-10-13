; an instruction directly followed by a semicolon must parse correctly

.ORIG x3000;

    add r0, r0, #03;
    and r2, r3, r4;

    halt;

    .FILL x3;
    .FILL #7;

.END;
