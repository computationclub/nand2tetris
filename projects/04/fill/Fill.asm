// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(BEGINNING)
  // Set screen pointer to address at start of screen
  @SCREEN
  D=A
  @R0
  M=D
(HALFWAY)
// Read the current value of the keyboard (@KBD)
  @KBD
  D=M
// Paint colour based on keyboard (0=white; 1=black)
  @WHITE
  D;JEQ
  @R0
  A=M
  M=-1
  @FURTHERDOWN
  0;JMP
(WHITE)
  @R0
  A=M
  M=0
// Increment screen pointer
(FURTHERDOWN)
  @R0
  M=M+1
// If screen pointer is more than limit jump to BEGINNING
  D=M
  @8192
  D=D-A
  @SCREEN
  D=D-A
  @BEGINNING
  D;JGT
// Else jump to HALFWAY
  @HALFWAY
  0;JMP
