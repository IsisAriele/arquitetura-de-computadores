.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2
addi $2, $0, 5
syscall
add $9, $0, $2

teste:
slt $10, $8, $9
beq $10, $0, maior8 # Alternativa: comparar com registrador que armazena const 1.
add $4, $0, $9
j fim

maior8:
add $4, $0, $8

fim:
addi $2, $0, 1
syscall

addi $2, $0, 10
syscall