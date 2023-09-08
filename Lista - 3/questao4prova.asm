.text
main:
addi $2, $0, 5
syscall
add $8, $0, $2 

addi $2, $0, 5
syscall
add $9, $0, $2

addi $20, $0, 1

conferirMenor:
slt $12, $8, $9 #Se $8 < $9 -> $12 = 1 se o 9 for menor $12 =0
beq $12, $0, segue9

add $10, $0, $8
forMenor8:
beq $10, $20, primos #Quando decrementar até chegar em 1, sai do loop
div $8, $10
mfhi $15
beq $15, $0, verificaDiv9
addi $10, $10, -1
j forMenor8

verificaDiv9:
div $9, $10
mfhi $15
beq $15, $0, naoPrimos
add $10, $10, -1
j forMenor8

segue9:
add $10, $0, $9
forMenor9:
beq $10, $20, primos #Quando decrementar até chegar em 1, sai do loop
div $9, $10
mfhi $15
beq $15, $0, verificaDiv8
addi $10, $10, -1
j forMenor9

verificaDiv8:
div $8, $10
mfhi $15
beq $15, $0, naoPrimos
add $10, $10, -1
j forMenor9

naoPrimos:
addi $4, $0, 'N'
addi $2, $0, 11
syscall
j fim

primos:
addi $4, $0, 'P'
addi $2, $0, 11
syscall

fim:
addi $2, $0, 10
syscall