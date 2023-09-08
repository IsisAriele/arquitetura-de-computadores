.text

main:	
addi $2 $0 5
syscall
add $8 $0 $2
addi $2 $0 5
syscall
add $9 $0 $2
addi $2 $0 5
syscall
add $10 $0 $2

soma:
add $4 $8 $9
add $4 $4 $10

divaritmetica:
addi $11 $0 3
div $4 $11
mflo $4 #quociente
mfhi $12 #resto

addi $11 $0 1 #Constante de comparação
slt $13 $11 $12 #Compara de 1 é menor que o resto da div
add $4 $4 $13
addi $2 $0 1
syscall

add $4 $0 ','
addi $2 $0 11
syscall

add $4 $0 $0
addi $2 $0 1
syscall

fim:	
addi $2 $0 10
syscall