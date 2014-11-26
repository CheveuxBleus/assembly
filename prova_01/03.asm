# Informe a data da pascoa em qualquer ano digitado

.data

p1:	.asciiz "Digite um ano: "
p2:	.asciiz "/"
p3:	.asciiz "Data da páscoa: "

.text

main:	
	lui $4, 0x1001 #print "Digite um ano" - p1
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 # recebe o ano
	syscall
	add $7, $0, $2 #Ano => $7

#ALGORITMO de Meeus/Jones/Butcher:

#   a $10 = MOD(ANO;19)
#   b $11 = ANO \ 100
#   c $12 = MOD(ANO;100)
#   d $13 = b \ 4
#   e $14 = MOD(b;4)
#   f $15 = (b + 8) \ 25
#   g $16 = (b - f + 1) \ 3
#   h $17 = MOD((19 × a + b - d - g + 15);30)
#   i $18 = c \ 4
#   k $19 = MOD(c;4)
#   l $20 = MOD((32 + 2 × e + 2 × i - h - k);7)
#   m $21 = (a + 11 × h + 22 × L) \ 451
#   MÊS($9) = (h + L - 7 × m + 114) \ 31
#   DIA($8) = MOD((h + L - 7 × m + 114);31) + 1

#$8 = DIA / $9 = MES / $7 = ANO
	
	addi $22, $0, 19 #$22 = 19
	div $7, $22 #ano / 19
	mfhi $10 #$10 = MOD(ANO;19)
	addi $22, $0, 100 #$22 = 100
	div $7, $22 #ano / 100
	mflo $11 # $11 = ANO \ 100
	mfhi $12 #$12 = MOD(ANO;100)
	addi $22, $0, 4
	div $11, $22 #b / 4
	mflo $13 #$13 = b \ 4
	mfhi $14 #$14 = MOD(b;4)
	addi $22, $0, 8
	add $15, $11, $22 #$15 = (b + 8)
	addi $22, $0, 25
	div $15, $22 # (b + 8) \ 25
	mflo $15 #$15 = (b + 8) \ 25	
	addi $22, $0, 3
	addi $16, $15, 1 #f + 1
	sub $16, $11, $16 #b -(f + 1)
	div $16, $22 #(b - f + 1) / 3
	mflo $16 #$16 = (b$11 - f$15 + 1) \ 3
	addi $22, $0, 19
	mul $17, $10, $22 #19 * a
	add $17, $17, $11 #(19 × a) + b
	sub $17, $17, $13 #(19 × a) + b - d
	sub $17, $17, $16 #(19 × a) + b - d - g
	addi $17, $17, 15 #(19 × a) + b - d - g + 15
	addi $22, $0, 30
	div $17, $22 #((19 × a) + b - d - g + 15)/30
	mfhi $17 #MOD((19 × a) + b - d - g + 15)/30
	addi $22, $0, 4
	div $12, $22 #c/4
	mflo $18 #$18 = c \ 4
	mfhi $19 #$19 = MOD(c;4)
	addi $22, $0, 2
	mul $20, $22, $14 #2 * e
	mul $23, $22, $18 #2 * i
	add $20, $20, $23 #2 × e + 2 × i
	addi $20, $20, 32 #32 + 2 × e + 2 × i
	sub $20, $20, $17 #32 + 2 × e + 2 × i - h
	sub $20, $20, $19 #32 + 2 × e + 2 × i - h - k
	addi $22, $0, 7
	div $20, $22 #(32 + 2 × e + 2 × i - h - k) / 7
	mfhi $20 #$20 = MOD ((32 + 2 × e + 2 × i - h - k) / 7)
	addi $22, $0, 11
	mul $21, $22, $17 #11 × h
	addi $22, $0, 22
	mul $23, $22, $20 #22 * l
	add $21, $21, $23 # 11 × h + 22 × L
	add $21, $21, $10 # a + 11 × h + 22 × L
	addi $22, $0, 451
	div $21, $22 #(a + 11 × h + 22 × L)/451
	mflo $21
	addi $22, $0, 7
	mul $23, $22, $21 # 7 * m
	add $9, $17, $20 # h + l
	sub $9, $9, $23 # h + l - (7 * m)
	addi $22, $0, 114 
	add $9, $9, $22 # h + l - (7 * m) + 114
	addi $22, $0, 31
	div $9, $22 # (h + l - (7 * m) + 114) / 31
	mflo $9
	mfhi $8
	addi $8, $8, 1
	
print:	lui $4, 0x1001 #print "Data da páscoa:" - p3
	addi $4, $4, 0x12
	addi $2, $0, 4
	syscall

#print dia
	addi $10, $0, 10 #$10 = 10
	slt $10, $8, $10 #se o dia é menor ou maior que 10
	beq $10, $0, dia #se o dia é maior ou igual a 10 => dia
	add $4, $0, $0 #print 0
	addi $2, $0, 1
	syscall
			
dia:	add $4, $0, $8 #print dia
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print "/" - p2
	addi $4, $4, 0x10
	addi $2, $0, 4
	syscall

#print mes
	add $4, $0, $0 #print 0
	add $2, $0, 1
	syscall
	add $4, $0, $9 #print mes
	add $2, $0, 1
	syscall
		
fim:	addi $2, $0, 10
	syscall
