.text

main: 
addi $2, $0, 5
syscall
add $6, $0, $2 #armazenei primeiro valor em reg 6

addi $2, $0, 5
syscall
add $7, $0, $2 # Segundo valor em reg 7

addi $2, $0, 5
syscall
add $8, $0, $2 #Terceiro valor em reg 8

multiplicacoes:
sll $9, $6, 1 # Desloco 1x, multiplico por 2 
add $9, $9, $6 #Adiciono por ele mesmo e finalizo a multiplicação por 3

sll $10, $7, 3 # Desloco 3x, multiplico por 8
add $10, $10, $7 # Adiciono ele mesmo e finalizo a multiplicação por 9

sll $11, $8, 4 #Desloco 4x, multiplico por 16
sub $11, $11, $8 #Subtração do valor para finalizar a multiplicação por 15

somanotas:
add $9, $9, $10
add $9, $9, $11

somapesos:
addi $5, $0, 3
addi $6, $0, 9
addi $7, $0, 15
add $5, $5, $6
add $5, $5, $7

div:
div $9, $5
mflo $4

print:
addi $2, $0, 1
syscall

end:
addi $2, $0, 10
syscall

	