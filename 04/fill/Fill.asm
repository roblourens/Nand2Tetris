// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// addr=screen
//

(LOOP)

@KBD
D=M
@CLEAR
D;JEQ // if KBD == 0, goto LOOP; else, draw

D=-1 // Fill(-1)
(FILL_D)
@drawValue
M=D

@8192 // count=8192
D=A
@count
M=D

@SCREEN // addr=SCREEN
D=A
@addr
M=D

(DRAWLOOP)
@drawValue
D=M
@addr
A=M // A = addr
M=D // Draw @ addr

@count // count--
M=M-1
D=M
@LOOP // if count==0, goto LOOP
D;JEQ

@addr // addr += 1
M=M+1

@DRAWLOOP
0;JMP

@LOOP
0;JMP

(CLEAR) // Fill(0)
D=0
@FILL_D
0;JMP