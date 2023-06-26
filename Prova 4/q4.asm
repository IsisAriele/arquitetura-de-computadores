.text

main:
addi $2, $0, 5
syscall
add $4, $0, $2 # dia
addi $2, $0, 5
syscall
add $5, $0, $2 # mês
addi $2, $0, 5
syscall
add $6, $0, $2 # ano
jal verifica

fim:
add $4, $2, $0
addi $2, $0, 1
syscall
addi $2, $0, 10
syscall

#Rotina para verificar dia, mês e ano
#Entradas $4 (dia), $5 (mês), $6 (ano)
#Saída $2 (0 ou 1)
#Usa sem preservar $8

verifica:
addi $8, $0, 4
div $6, $8
mfhi $9
beq $9, $0, verificaAnoBissexto
addi $8, $0, 1000 # Ano --> maior que 1000
slt $8, $8, $6 # Se ano lido > 1000 --> $8 <-- 1
bne $8, $0, verificaMes
j dataInvalida

verificaMes:
addi $8, $0, 13
slt $8, $5, $8 #Mês menor que 13 --> 12, 11...
bne $8, $0, verificaFev
j dataInvalida

verificaFev:
addi $8, $0, 2
beq $5, $8, fev
j verificaOutrosMeses #Volta pras verificações dos outros meses

fev:
addi $8, $0, 29
slt $8, $4, $8 #Dia menor que 29 --> 28, 27, 26...
bne $8, $0, dataValida
j dataInvalida

verificaOutrosMeses:
addi $8, $0, 1
beq $5, $8, jan
#addi $8, $0, 2
#beq $5, $8, fev
addi $8, $0, 3
beq $5, $8, mar
addi $8, $0, 4
beq $5, $8, abr
addi $8, $0, 5
beq $5, $8, mai
addi $8, $0, 6
beq $5, $8, jun
addi $8, $0, 7
beq $5, $8, jul
addi $8, $0, 8
beq $5, $8, ago
addi $8, $0, 9
beq $5, $8, set
addi $8, $0, 10
beq $5, $8, out
addi $8, $0, 11
beq $5, $8, nov
addi $8, $0, 12
beq $5, $8, dez
j dataInvalida

jan:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

mar:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

abr:
addi $8, $0, 30
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

mai:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

jun:
addi $8, $0, 30
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

jul:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

ago:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

set:
addi $8, $0, 30
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

out:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

nov:
addi $8, $0, 30
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

dez:
addi $8, $0, 31
slt $8, $4, $8
bne $8, $0, dataValida
j dataInvalida

#===============================================#
verificaAnoBissexto:
addi $8, $0, 1000 # Ano --> maior que 1000
slt $8, $8, $6 # Se ano lido > 1000 --> $8 <-- 1
bne $8, $0, verificaMesBissexto
j dataInvalida

verificaMesBissexto:
addi $8, $0, 13
slt $8, $5, $8 #Mês menor que 13 --> 12, 11...
bne $8, $0, verificaFevBissexto
j dataInvalida

verificaFevBissexto:
addi $8, $0, 2
beq $5, $8, fevB
j verificaOutrosMeses #Volta pras verificações dos outros meses

fevB:
addi $8, $0, 30
slt $8, $4, $8 #Dia menor que 30 --> 29, 28...
bne $8, $0, dataValida
j dataInvalida

#===============================================#
dataValida:
addi $2, $0, 1
jr $31 #data válida --> 1

dataInvalida:
add $2, $0, $0
jr $31 #data invalida --> 0