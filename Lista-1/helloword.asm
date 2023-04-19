
.text 

main:
     add $2, $0, 12
     syscall
     add $8, $0, $2  #H
     add $2, $0, 12
     syscall
     add $9, $0, $2 #E
     add $2, $0, 12
     syscall
     add $10, $0, $2 #L
     add $2, $0, 12
     syscall
     add $11, $0, $2 #L
     add $2, $0, 12
     syscall
     add $12, $0, $2 #O
     add $2, $0, 12
     syscall
     add $13, $0, $2  #espaço
     add $2, $0, 12
     syscall
     add $14, $0, $2 #W
     add $2, $0, 12
     syscall
     add $15, $0, $2
     add $2, $0, 12
     syscall
     add $16, $0, $2
     add $2, $0, 12
     syscall
     add $17, $0, $2
     add $2, $0, 12
     syscall
     add $18, $0, $2
 

imprimir:     add $4, $0, $8
     add $2, $0, 11
     syscall
     add $4, $0, $9
     add $2, $0, 11
     syscall
     add $4, $0, $10
     add $2, $0, 11
     syscall
     add $4, $0, $11
     add $2, $0, 11
     syscall
     add $4, $0, $12
     add $2, $0, 11
     syscall
     add $4, $0, $13
     add $2, $0, 11
     syscall
     add $4, $0, $14
     add $2, $0, 11
     syscall
     add $4, $0, $15
     add $2, $0, 11
     syscall
     add $4, $0, $16
     add $2, $0, 11
     syscall
     add $4, $0, $17
     add $2, $0, 11
     syscall
     add $4, $0, $18
     add $2, $0, 11
     syscall


     add $2, $0, 10
     syscall
