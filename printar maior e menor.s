.data
  X: .word 1, 2, 3, 4, 5, 6, 7, 8

globl main  
.text

main:
  la $t0, X
  lw $s0, 0($t0) #Define o m�ximo para o primeiro valor na matriz
  move $s1, $s0  #Define Min como primeiro valor no array
  addi $t1, $0, 0 #Define o contador para 0
  li $t1, 0     #�ndice para o array

loop: 
  bge $t0, 8 EndLoop
  bgt X($t1), $s0, SetMax
  blt X($t1), $s1, SetMin
  addi $t1, $t1, 4 #Aumenta o �ndice para o array
  addi $t0, $t0, 1 #Incrementa o contador
SetMax:
  move $s0, X($t1)
  j loop
SetMin: 
  move $s0, X($t1)
  j loop
EndLoop:
  li $v0, 1
  addi $s0, $s0, 0
  addi $si, $s1, 0
  syscall