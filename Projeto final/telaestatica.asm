
#CORES:  1. Parede central 0x760F04 - vermelho claro
#        2. Laterais 0x4A0D06 - vermelho escuro
#        3. chão  0xB46616
#        4. prateleiras 0xB46616 + sombreado 0x1C1C1C
#        5. Galinha: branco 0xffffff
#                    cinza 0xcdcdcd
#                    vermelho 0xff1100
#                    amarelo 0xf6ff00
#                    preto 0x000000
#        6. cesta: creme claro 0xec8826
#                  creme escuro 0x924a03

.text
# 128 x 64 =  8192 --> total da tela com unidade de 4 pixels
tela1: 
lui $8, 0x1001 #$8 = 0x10010000
addi $10, $0, 8192 # unidades gráficas
addi $20, $0, 0 #constante
addiu $9, $0, 0x4A0D06 # parede lateral

lacot1: 
beq $10, $20, tela2 #condição de parada do laço
sw $9, 0($8) #o valor de $9 será armazenado no primeiro registrador da memória que é $8
addi $8, $8, 4 #deslocamento da memória

addi $20, $20, 1 #contador da condição de parada que é limitado ao tamanho da tela desejado
j lacot1

#=================================================================#

tela2:
lui $8, 0x1001 #$8 = 0x10010000
addi $10, $0, 5832 # unidades gráficas
addi $20, $0, 0 #constante
addi $19, $0, 0 #constante pula linha
addi $18, $0, 108 #const pula linha
addiu $9, $0, 0x760F04 #armazeno a cor

lacot2: 
beq $10, $20, tela3 #condição de parada do laço
beq $19, $18, pulaLinhaParede
sw $9, 40($8) 
addi $8, $8, 4 #deslocamento da memória

addi $20, $20, 1 #contador da condição de parada 
addi $19, $19, 1 #contador de pula linha

j lacot2

pulaLinhaParede:
addi $8, $8, 80
addi $19, $0, 0
j lacot2

#=================================================================#

tela3:
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 27688 #deslocamento / 4 - Ponto de partida do chão
addi $10, $0, 5832 # unidades gráficas
addi $20, $0, 0 #constante
addi $19, $0, 0 #constante pula linha
addi $18, $0, 108 #const pula linha
addiu $9, $0, 0xB46616 #armazeno a cor

lacot3: 
beq $10, $20, triangulo1 #condição de parada do laço
beq $19, $18, pulaLinhaParede2
sw $9, 0($8) 
addi $8, $8, 4 #deslocamento da memória

addi $20, $20, 1 #contador da condição de parada 
addi $19, $19, 1 #contador de pula linha
j lacot3

pulaLinhaParede2:
addi $8, $8, 80
addi $19, $0, 0
j lacot3

#=================================================================#

triangulo1:
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 32256 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xB46616 #armazeno a cor
addi $10, $0, 55 # unidades gráficas
addi $17, $0, 0
addi $18, $0, 10 #const sobe linha
addi $19, $0, 40 #constante pula linha
addi $20, $0, 0 #constante fim laço
addi $21, $0, 0

#addi $8, $8, -512

lacoTriangulo1:
beq $10, $20, triangulo2 #condição de parada
beq $18, $0, sobeLinha 
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $18, $18, -1
addi $20, $20, 1
j lacoTriangulo1

sobeLinha:
addi $8, $8, -512
addi $19, $19, -4
addi $17, $17, -1
addi $18, $18, 10
add $18, $18, $17
sub $8, $8, $19
j lacoTriangulo1

#=================================================================#

triangulo2:
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 32728 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xB46616 #armazeno a cor
addi $10, $0, 55 # unidades gráficas
addi $17, $0, 0
addi $18, $0, 10 #const sobe linha
addi $19, $0, 40 #constante pula linha
addi $20, $0, 0 #constante fim laço
addi $21, $0, 0

#addi $8, $8, -512

lacoTriangulo2:
beq $10, $20, prateleira1 #condição de parada
beq $18, $0, sobeLinha2
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $18, $18, -1
addi $20, $20, 1
j lacoTriangulo2

sobeLinha2:
addi $8, $8, -512
sub $8, $8, $19
addi $19, $19, -4
addi $17, $17, -1
addi $18, $18, 10
add $18, $18, $17
j lacoTriangulo2

#=================================================================#
prateleira1:
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 8800 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xB46616 #armazeno a cor 0xB46616
addi $10, $0, 282 # unidades gráficas para tres loops
addi $18, $0, 94 #largura da prateleira
addi $20, $0, 0

lacoPrateleira1:
beq $10, $20, sombreado1 #condição de parada
beq $18, $0, pulaPrateleira
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $18, $18, -1
addi $20, $20, 1
j lacoPrateleira1

pulaPrateleira:
addi $18, $0, 94
addi $8, $8, 136
j lacoPrateleira1

sombreado1:
addi $8, $8, 136 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0x1C1C1C #armazeno a cor
addi $10, $0, 94 # unidades gráficas
addi $20, $0, 0

lacoSombreado1:
beq $10, $20, prateleira2 #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j lacoSombreado1



#=================================================================#
prateleira2:
#lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 5200 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xB46616 #armazeno a cor 0xB46616
addi $10, $0, 138 # unidades gráficas para tres loops
addi $18, $0, 46 #largura da prateleira
addi $20, $0, 0

lacoPrateleira2:
beq $10, $20, sombreado2 #condição de parada
beq $18, $0, pulaPrateleira2
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $18, $18, -1
addi $20, $20, 1
j lacoPrateleira2

pulaPrateleira2:
addi $18, $0, 46
addi $8, $8, 328
j lacoPrateleira2

sombreado2:
addi $8, $8, 328 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0x1C1C1C #armazeno a cor
addi $10, $0, 46 # unidades gráficas
addi $20, $0, 0

lacoSombreado2:
beq $10, $20, galinha #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j lacoSombreado2

#=================================================================#

galinha:
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 8620 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 6 # unidades gráficas para tres loops
#addi $18, $0, 94 #largura da prateleira
addi $20, $0, 0

lacoGalinha:
beq $10, $20, galinha2 #condição de parada
#beq $18, $0, pulaPrateleira
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
#addi $18, $18, -1
addi $20, $20, 1
j lacoGalinha

#=================================================================#
galinha2:
#lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, -540 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha2:
beq $10, $20, galinha2C 
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha2

galinha2C:
addiu $9, $0, 0xcdcdcd
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha2C:
beq $10, $20, galinha2B
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2C

galinha2B:
addiu $9, $0, 0xffffff
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha2B:
beq $10, $20, galinha3 
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2B

#=================================================================#
galinha3:
addi $8, $8, -544 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 8
addi $20, $0, 0

lacoGalinha3:
beq $10, $20, galinha3C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha3

galinha3C:
addi $8, $8, -8
addiu $9, $0, 0xcdcdcd
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha3C:
beq $10, $20, galinha3CC
sw $9, 0($8)
addi $8, $8, -4
addi $20, $20, 1
j lacoGalinha3C

galinha3CC:
addi $8, $8, -8
sw $9, 0($8)

#=================================================================#
galinha4:
addi $8, $8, -524 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 10
addi $20, $0, 0

lacoGalinha4:
beq $10, $20, galinha4C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha4

galinha4C:
addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

galinha5:
addi $8, $8, -540 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 10
addi $20, $0, 0

lacoGalinha5:
beq $10, $20, galinha5C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha5

galinha5C:
addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

#=================================================================#
galinha6:
addi $8, $8, -544
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 11
addi $20, $0, 0

lacoGalinha6:
beq $10, $20, galinha7
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha6

galinha7:
addi $8, $8, -560
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 4
addi $20, $0, 0

lacoGalinha7:
beq $10, $20, galinha8
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha7

galinha8:
addi $8, $8, 8
addiu $9, $0, 0xffffff
addi $10, $0, 5
addi $20, $0, 0

lacoGalinha8:
beq $10, $20, galinha9
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha8

#=================================================================#
galinha9:
addi $8, $8, -564
addiu $9, $0, 0xf6ff00
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha9:
beq $10, $20, galinha10
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha9

galinha10:
addi $8, $8, 20
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha10:
beq $10, $20, galinha11
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha10

#=================================================================#
galinha11:
addi $8, $8, -520
sw $9, 0($8)
addi $8, $8, -28
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha11:
beq $10, $20, galinha11P
sw $9, 0($8)
addi $8, $8, -4 
addi $20, $20, 1
j lacoGalinha11

galinha11P:
addiu $9, $0, 0x000000
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0xffffff
sw $9, 0($8)

galinha12:
addi $8, $8, -512
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)

galinha13:
addi $8, $8, -512
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)

sai:
addi $2, $0, 10 #finalização
syscall

#=================================================================#
