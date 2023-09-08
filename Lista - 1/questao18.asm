.text

main:
addi $2, $0, 5
syscall
add $8, $0, $2 #Primeiro número
addi $2, $0, 5
syscall
add $9, $0, $2 #Segundo número

bitsinal:
sub $10, $8, $9
not $11, $10
srl $10, $10, 31 #Bit de sinal
srl $11, $11, 31 #Bit de sinal negado

multiplicações:
mul $8, $8, $10
mul $9, $9, $11
add $4, $8, $9

print:
addi $2, $0, 1
syscall

end:
addi $2, $0, 10
syscall