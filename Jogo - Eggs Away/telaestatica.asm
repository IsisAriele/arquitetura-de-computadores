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
# 128 x 64 =  8192 --> total da tela com unidade de 4 pixels

.text
teclado:
addi $22, $0, 'a'
addi $23, $0, 'd'
addi $18, $0, 0
lui $24, 0xffff

addi $30, $0, -21 #Queda ovo

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
addiu $9, $0, 0x352816 #armazeno a cor
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
addi $10, $0, 108 # unidades gráficas para tres loops
addi $18, $0, 36 #largura da prateleira
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
addi $18, $0, 36
addi $8, $8, 368
j lacoPrateleira2

sombreado2:
addi $8, $8, 368 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0x352816 #armazeno a cor
addi $10, $0, 36 # unidades gráficas
addi $20, $0, 0

lacoSombreado2:
beq $10, $20, janela #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j lacoSombreado2

janela:
lui $8, 0x1001
addi $8, $8, 1560
addiu $9, $0, 0x694416 #moldura
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 520
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416 #ceu
sw $9, 0($8)
addi $8, $8, 524
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 528
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x1d9729 #chão
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x71d6ff #ceu
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x1d9729 #ceu
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x1d9729 #chão
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x1d9729 #ceu
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x1d9729 #chão
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x1d9729 #chão
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 512
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x1d9729 #chão
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
#=======================================================================#
cesta:
lui $8, 0x1001
addi $8, $8, 27392
addi $18, $0, 0 #Mudar direção


addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x46341d
addi $10, $0, 9 #unidades graficas
addi $20, $0, 0

cestaLaco:
beq $10, $20, cesta2 #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j cestaLaco

cesta2:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
addi $8, $8, -560
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 11 #unidades graficas
addi $20, $0, 0

cestaLaco2:
beq $10, $20, cesta3 #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j cestaLaco2

#=================================================================#
cesta3:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
addi $8, $8, -568
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 6 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco3:
beq $10, $20, cesta4 #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
addi $20, $20, 1
j cestaLaco3

cesta4:
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -568
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 13 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco4:
beq $10, $20, cesta5 #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j cestaLaco4

cesta5:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -572
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 7 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco5:
beq $10, $20, cesta6 #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
addi $20, $20, 1
j cestaLaco5

cesta6:
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -580
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 17 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco6:
beq $10, $20, cesta7 #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j cestaLaco6

cesta7:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -588
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 48
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

cesta8:
addi $8, $8, -592
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 56
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
#==================================================================#
galinha:

addi $16, $0, 80 #guarda passos
addi $17, $0, 40 #coloca ovo
addi $7, $0, -4
lui $8, 0x1001 #$8 = 0x10010000 -->
addi $8, $8, 8620 #deslocamento / 4 - Ponto de partida do chão (canto inferior esquerdo 32256)
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 6 # unidades gráficas para tres loops
#addi $18, $0, 94 #largura da prateleira
addi $20, $0, 0

forGalinhada:

beq $16, $0, galinhaV
addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE

sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff

lacoGalinha:
beq $10, $20, galinha2 
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha

#=================================================================#
galinha2:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -540 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

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
beq $10, $20, galinha2BX
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2C

galinha2BX:
addiu $9, $0, 0xffffff
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha2BX:
beq $10, $20, galinha3 
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2BX

#=================================================================#
galinha3:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -544 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 8
addi $20, $0, 0

lacoGalinha3:
beq $10, $20, galinha3C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha3

galinha3C:
addiu $9, $0, 0x760F04
sw $9, 0($8)

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
addi $8, $8, -524 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 10
addi $20, $0, 0

lacoGalinha4:
beq $10, $20, galinha4C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha4

galinha4C:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

galinha5:
addi $8, $8, -540 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 10
addi $20, $0, 0

lacoGalinha5:
beq $10, $20, galinha5C
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha5

galinha5C:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

#=================================================================#
galinha6:
addi $8, $8, -544

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff 
addi $10, $0, 11
addi $20, $0, 0

lacoGalinha6:
beq $10, $20, galinha7
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha6

galinha7:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -560

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff 
addi $10, $0, 4
addi $20, $0, 0

lacoGalinha7:
beq $10, $20, galinha8
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha7

galinha8:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, 8

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

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
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -564

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

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
addiu $9, $0, 0x760F04
sw $9, 0($8)

addiu $9, $0, 0xffffff
addi $8, $8, 20

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

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
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, -516

addiu $9, $0, 0x760F04
sw $9, 0($8)

addiu $9, $0, 0xffffff
addi $8, $8, -4
sw $9, 0($8)

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addi $8, $8, -24
addiu $9, $0, 0x760F04
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, -4
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

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

galinha12:
addi $8, $8, -512

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

galinha13:
addi $8, $8, -512

addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)


addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

verificacoes:
jal verificaDig

bne $17, $0, continua
j colocaOvo

continua:
slt $28, $17, $30
beq $28, $0, continuaQueda
#addi $17, $0, 40
j continuaVolta

continuaQueda:
slt $28, $17, $0
beq $28, $0, continuaVolta
j ovoCai

continuaVolta:

voltaGalinhada:
lui $8, 0x1001 
addi $8, $8, 8620 
add $8, $8, $7
addi $7, $7, -4
addiu $9, $0, 0xffffff 
addi $10, $0, 6 
addi $20, $0, 0
addi $16, $16, -1
addi $17, $17, -1

jal sleep

#se $17 < 0 --> jal


j forGalinhada

sai:
addi $2, $0, 10 #finalização
syscall
#=================================================================#
     
sleep: addi $15, $0, 10000
forsleep: beq $15, $0, fimsleep
          nop
          nop
          nop
          nop
          addi $15, $15, -1
          j forsleep  
fimsleep: jr $31

#Volta da galinha =================================================#

galinhaV:
addi $16, $0, 80 #guarda passos
addi $17, $0, 40 #coloca ovo
lui $8, 0x1001 
addi $8, $8, 8300
addi $7, $0, 4
addi $8, $8, 4
addiu $9, $0, 0xffffff #armazeno a cor 0xB46616
addi $10, $0, 6 # unidades gráficas para tres loops
addi $20, $0, 0

forGalinhadaV:
beq $16, $0, galinha
addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE

sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff

lacoGalinhaV:
beq $10, $20, galinha2V 
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinhaV

#=================================================================#
galinha2V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -540 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 3
addi $20, $0, 0

lacoGalinha2V:
beq $10, $20, galinha2CV
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha2V

galinha2CV:
addiu $9, $0, 0xcdcdcd
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha2CV:
beq $10, $20, galinha2BV
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2CV

galinha2BV:
addiu $9, $0, 0xffffff
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha2BV:
beq $10, $20, galinha3V
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j lacoGalinha2BV

#=================================================================#
galinha3V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -544 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 8
addi $20, $0, 0

lacoGalinha3V:
beq $10, $20, galinha3CV
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha3V

galinha3CV:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -8
addiu $9, $0, 0xcdcdcd
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha3CV:
beq $10, $20, galinha3CCV
sw $9, 0($8)
addi $8, $8, -4
addi $20, $20, 1
j lacoGalinha3CV

galinha3CCV:
addi $8, $8, -8
sw $9, 0($8)

#=================================================================#
galinha4V:
addi $8, $8, -524 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 10
addi $20, $0, 0

lacoGalinha4V:
beq $10, $20, galinha4CV
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha4V

galinha4CV:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

galinha5V:
addi $8, $8, -540 

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 10
addi $20, $0, 0

lacoGalinha5V:
beq $10, $20, galinha5CV
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha5V

galinha5CV:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -12
addiu $9, $0, 0xcdcdcd
sw $9, 0($8)

#=================================================================#
galinha6V:
addi $8, $8, -544

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff 
addi $10, $0, 11
addi $20, $0, 0

lacoGalinha6V:
beq $10, $20, galinha7V
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha6V

galinha7V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -560

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff 
addi $10, $0, 4
addi $20, $0, 0

lacoGalinha7V:
beq $10, $20, galinha8V
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha7V

galinha8V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, 8

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xffffff
addi $10, $0, 5
addi $20, $0, 0

lacoGalinha8V:
beq $10, $20, galinha9V
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha8V

#=================================================================#
galinha9V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -564

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xf6ff00
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
addi $10, $0, 3
addi $20, $0, 0

lacoGalinha9V:
beq $10, $20, galinha10V
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha9V

galinha10V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addiu $9, $0, 0xffffff
addi $8, $8, 20

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4
addiu $9, $0, 0xffffff

addi $10, $0, 3
addi $20, $0, 0

lacoGalinha10V:
beq $10, $20, galinha11V
sw $9, 0($8)
addi $8, $8, 4 
addi $20, $20, 1
j lacoGalinha10V

#=================================================================#
galinha11V:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, -516

addiu $9, $0, 0x760F04
sw $9, 0($8)

addiu $9, $0, 0xffffff
addi $8, $8, -4
sw $9, 0($8)

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addi $8, $8, -24
addiu $9, $0, 0x760F04
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, -4
addi $10, $0, 2
addi $20, $0, 0

lacoGalinha11V:
beq $10, $20, galinha11PV
sw $9, 0($8)
addi $8, $8, -4 
addi $20, $20, 1
j lacoGalinha11V

galinha11PV:
addiu $9, $0, 0x000000
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0xffffff
sw $9, 0($8)

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

galinha12V:
addi $8, $8, -512

addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xffffff
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

galinha13V:
addi $8, $8, -512

addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, -4
addiu $9, $0, 0xff1100
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)


addi $8, $8, -4
addiu $9, $0, 0x760F04 #--> FRENTE
sw $9, 0($8)

addi $8, $8, 4

#===============================================================


verificacoesV:
jal verificaDig

bne $17, $0, continuaV
j colocaOvoV

continuaV:
slt $28, $17, $30
beq $28, $0, continuaQuedaV
#addi $17, $0, 40
j continuaVoltaV

continuaQuedaV:
slt $28, $17, $0
beq $28, $0, continuaVoltaV
j ovoCaiV

continuaVoltaV:



voltaGalinhadaV:
lui $8, 0x1001 
addi $8, $8, 8300 
add $8, $8, $7
addi $7, $7, 4
addiu $9, $0, 0xffffff 
addi $10, $0, 6 
addi $20, $0, 0
addi $16, $16, -1
addi $17, $17, -1

jal sleepV

j forGalinhadaV

saiV:
addi $2, $0, 10 #finalização
syscall
#=================================================================#
     
sleepV: addi $15, $0, 10000
forsleepV: beq $15, $0, fimsleepV
          nop
          nop
          nop
          nop
          addi $15, $15, -1
          j forsleepV  
fimsleepV: jr $31

#=================================


cestaVolta:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x46341d
addi $10, $0, 9 #unidades graficas
addi $20, $0, 0

cestaLacoV:
beq $10, $20, cesta2V #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j cestaLacoV

cesta2V:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
addi $8, $8, -560
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 11 #unidades graficas
addi $20, $0, 0

cestaLaco2V:
beq $10, $20, cesta3V #condição de parada
sw $9, 0($8)
addi $8, $8, 4 #for pra 4 x1 - 4 x2 --> quando chegar em 9 para
addi $20, $20, 1
j cestaLaco2V

#=================================================================#
cesta3V:
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
addi $8, $8, -568
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 6 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco3V:
beq $10, $20, cesta4V #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
addi $20, $20, 1
j cestaLaco3V

cesta4V:
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4

addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -568
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 13 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco4V:
beq $10, $20, cesta5V #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j cestaLaco4V

cesta5V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -572
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 7 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco5V:
beq $10, $20, cesta6V #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x694416
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
addi $20, $20, 1
j cestaLaco5V

cesta6V:
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -580
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
addi $10, $0, 17 #duplas de unidades graficas
addi $20, $0, 0

cestaLaco6V:
beq $10, $20, cesta7V #condição de parada
sw $9, 0($8)
addi $8, $8, 4
addi $20, $20, 1
j cestaLaco6V

cesta7V:
addiu $9, $0, 0x760F04
sw $9, 0($8)

addi $8, $8, -588
sw $9, 0($8)

addiu $9, $0, 0xa05f1f
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 48
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)

cesta8V:
addi $8, $8, -592
sw $9, 0($8)
addiu $9, $0, 0xa05f1f
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
addi $8, $8, 56
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0xa05f1f
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04
sw $9, 0($8)
j naodig
#=================================================================

verificaDig:
lw $21, 0($24) #VERIFICA SE DIGITOU OU NÃO
beq $21, $0, naodig 
lw $21, 4($24) #PEGA O QUE FOI DIGITADO
beq $21, $22, digA
beq $21, $23, digD
j naodig

digA:
lui $8, 0x1001
addi $8, $8, 27392
addi $18, $18, -4
add $8, $8, $18
j cestaVolta  

digD:
lui $8, 0x1001
addi $8, $8, 27392
addi $18, $18, 4
add $8, $8, $18
j cestaVolta     

naodig:
jr $31

#===========================================================
colocaOvo:
lui $8, 0x1001 
addi $8, $8, 11032
addi $27, $0, 21
addi $26, $0, 0

ovoVolta:
beq $27, $0, verificaCesta
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addiu $9, $0, 0x760F04
addi $8, $8, 4
sw $9, 0($8)


addi $8, $8, 500
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 496
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 496
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 500
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
j voltaGalinhada

ovoCai:
lui $8, 0x1001 
addi $8, $8, 11032
addi $26, $26, 512
addi $27, $27, -1
add $8, $8, $26
j ovoVolta


verificaCesta:
addiu $29, $0, 0xa05f1f 
lui $8, 0x1001 #$8 = 0x10010000
addi $8, $8, 24856
lw $9, 0($8)
beq $9, $29, fim

lui $8, 0x1001
addi $8, $8, 24344
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, -516
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -508
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -512
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -512
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -508
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -516
sw $9, 0($8)
j voltaGalinhada


fim:
addi $2, $0, 10 #finalização
syscall


#============================================
#Ovo da volta
colocaOvoV:
lui $8, 0x1001 
addi $8, $8, 11032
addi $27, $0, 21
addi $26, $0, 0

ovoVoltaV:
beq $27, $0, verificaCestaV
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addiu $9, $0, 0x760F04
addi $8, $8, 4
sw $9, 0($8)


addi $8, $8, 500
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 496
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 496
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)

addi $8, $8, 500
sw $9, 0($8)
addiu $9, $0, 0xffffff
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, 508
sw $9, 0($8)
j voltaGalinhadaV

ovoCaiV:
lui $8, 0x1001 
addi $8, $8, 11032
addi $26, $26, 512
addi $27, $27, -1
add $8, $8, $26
j ovoVoltaV


verificaCestaV:
addiu $29, $0, 0xa05f1f 
lui $8, 0x1001 #$8 = 0x10010000
addi $8, $8, 24856
lw $9, 0($8)
beq $9, $29, fimV

lui $8, 0x1001
addi $8, $8, 24344
addiu $9, $0, 0x760F04 
sw $9, 0($8)
addi $8, $8, -516
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -508
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -512
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -512
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -4
sw $9, 0($8)
addi $8, $8, -508
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, 4
sw $9, 0($8)
addi $8, $8, -516
sw $9, 0($8)
j voltaGalinhadaV


fimV:
addi $2, $0, 10 #finalização
syscall
