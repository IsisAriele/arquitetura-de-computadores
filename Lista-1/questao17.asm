.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2
addi $2, $0, 5
syscall
add $9, $0, $2

soma:
add $10, $8, $9

div:
addi $11, $0, 2
div $10, $11
mflo $12 # Valor inteiro
mfhi $13

div2:
addi $14, $0, 10
addi $15, $0, 2
div $14, $15
mflo $16

mult:
mul $13, $13, $16 #Resto após vírgula

print:
add $4, $0, $12
addi $2, $0, 1
syscall

add $4, $0, ','
addi $2, $0, 11
syscall

add $4, $0, $13
addi $2, $0, 1
syscall

end:
addi $2, $0, 10
syscall
