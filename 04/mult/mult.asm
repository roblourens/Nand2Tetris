// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// x = R0
// y = R1
// m = 0
// while (x > 0)
//   m = m + y
//   x--

@R0
D=M
@count
M=D

@R2
M=0

(LOOP) // Loop over all count
@count // D=R0
D=M

@END
D;JEQ // jump to end if finished

@R1
D=M // D=R1

@R2
M=D+M

@count
M=M-1 // R0--

@LOOP
0;JMP

(END)
@END
0;JMP