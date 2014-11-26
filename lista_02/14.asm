.data
.asciiz "\n"
.asciiz "Digite 30 notas:\n"
.asciiz "A maior é:"
.asciiz "A menor é:"
.asciiz "A média é:"
.text
main:	lui $4, 0x1001 #imprime a segunda string
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
	addi $5, $0, 2 #$5 => Inicio = 2
	addi $6, $0, 31 #$6 => Fim = 31
	addi $7, $0, 30 #$7 => Divisor = 30
	#$8 => soma / $9 => menor / $10 => maior / $11 => media 
	addi $2, $0, 5 #recebe um numero
	syscall
	add $8, $8, $2 # soma = soma + num
	add $9, $0, $2 #maior recebe o primeiro numero
	add $10, $0, $2 #menor recebe o primeiro numero
teste:	beq $5, $6, fim #comparação
	addi $2, $0, 5 #recebe um numero
	syscall
	add $8, $8, $2 # soma = soma + num
	slt $12, $2, $9 # se num < menor =>$12 = 1, se num > menor => $12 = 0
	beq $12, $0, maior #num > menor => maior
	add $9, $0, $2 #num < menor => menor = num
	j mais
maior:	slt $12, $2, $10 #se num < maior =>$12 = 1, se num > maior => $12 = 0
	bne $12, $0, mais #num < maior => mais
	add $10, $0, $2 #num > maior => maior = num
mais:	addi $5, $5, 1 #incremento
	j teste
fim:	div $8, $7 #soma / 30 = media
	mflo $11 #$11 = media
	addi $4, $4, 18 #imprimi string maior
	addi $2, $0, 4
	syscall
	add $4, $0, $10 #imprimi valor maior
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $2, $0, 4
	syscall
	addi $4, $4, 31 #imprimi string menor
	addi $2, $0, 4
	syscall
	add $4, $0, $9 #imprimi valor menor
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $2, $0, 4
	syscall
	addi $4, $4, 42 #imprimi string media
	addi $2, $0, 4
	syscall
	add $4, $0, $11 #imprimi valor media
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $2, $0, 4
	syscall
	nop