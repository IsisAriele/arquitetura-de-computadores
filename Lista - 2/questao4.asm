.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2
addi $2, $0, 5
syscall
add $9, $0, $2

teste1:
beq $8, $9, fimiguais

teste2:
slt $10, $8, $9
beq $10, $0, fimmaior8 # Alternativa: comparar com registrador que armazena const 1.

maior9:
j fimmaior9

fimmaior8:
add $4, $0, $8
addi $2, $0, 1
syscall

addi $4, $0, '>'
addi $2, $0, 11
syscall

add $4, $0, $9
addi $2, $0, 1
syscall
j fim

fimmaior9:
add $4, $0, $8
addi $2, $0, 1
syscall

addi $4, $0, '<'
addi $2, $0, 11
syscall

add $4, $0, $9
addi $2, $0, 1
syscall
j fim

fimiguais:
add $4, $0, $8
addi $2, $0, 1
syscall

addi $4, $0, '='
addi $2, $0, 11
syscall

add $4, $0, $9
addi $2, $0, 1
syscall

fim:
addi $2, $0, 10
syscall
