.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2

#ano bissexto é divisivel por 4
div:
addi $7, $0, 4
div $8, $7
mfhi $9

verificacao:
beq $9, $0, bissexto

naobissexto:
addi $4, $0, 'N'
addi $2, $0, 11
syscall
j fim

bissexto:
addi $4, $0, 'S'
addi $2, $0, 11
syscall

fim:
addi $2, $0, 10
syscall


