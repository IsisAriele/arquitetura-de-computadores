.text

main:
addi $2, $0, 5
syscall
add $6, $0, $2

div:
addi $5, $0, 2
div $6, $5
mfhi $4

multiplicacao:
mul $4, $4, -1

print:
addi $2, $0, 1
syscall

end:
addi $2, $0, 10
syscall
