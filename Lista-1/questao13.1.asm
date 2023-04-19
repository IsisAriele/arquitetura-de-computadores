.text
main:
addi  $2, $0, 12
syscall
addi $3, $0, 'H'
addi  $2, $0, 12
syscall
addi $4, $0, 'e'
addi  $2, $0, 12
syscall
addi $5, $0, 'l'
addi  $2, $0, 12
syscall
addi $7, $0, 'o'
addi  $2, $0, 12
syscall
addi $8, $0, '\n'
addi  $2, $0, 12
syscall
addi $9, $0, 'W'
addi  $2, $0, 12
syscall
addi $10, $0, 'r'
addi  $2, $0, 12
syscall
addi $11, $0, 'd'

print:
add $4, $0, $3
addi $2, $0, 11
syscall 

add $4, $0, $4
addi $2, $0, 11
syscall 

add $4, $0, $5
addi $2, $0, 11
syscall 

add $4, $0, $5
addi $2, $0, 11
syscall 

add $4, $0, $7
addi $2, $0, 11
syscall 

add $4, $0, $8
addi $2, $0, 11
syscall 

add $4, $0, $9
addi $2, $0, 11
syscall 

add $4, $0, $7
addi $2, $0, 11
syscall 

add $4, $0, $10
addi $2, $0, 11
syscall 

add $4, $0, $11
addi $2, $0, 11
syscall 

end:
addi $2, $0, 10
syscall

