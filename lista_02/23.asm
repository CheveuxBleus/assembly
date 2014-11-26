.data
 .asciiz "Digite um número: "
 .asciiz " é primo"
 .asciiz " não é primo"
.text
main:	lui $4, 0x1001 #print primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$5 recebe A
	syscall
	add $5, $0, $2
	addi $10, $0, 1 #saida = 1
	addi $19, $0, 1 #comparação
	subi $6, $5, 1 #$6 = $5 - 1
	addi $7, $0, 1 #inicio $7 = 1
teste:	beq $6, $7, comp 
	addi $7, $7, 1 #incremento
	div $5, $7 #divide o menor por $7
	mfhi $11 #$11 = resto
	bne $11, $0, teste #se resto diferente de zero => teste	
	add $10, $0, $7 #senao saida recebe $7
	j teste
comp:	add $4, $0, $5 #print o numero
	addi $2, $0, 1 
	syscall
	beq $10, $19, primo #se saida = 1 => primo
	lui $4, 0x1001 #print terceira string
	addi $4, $4, 28
	addi $2, $0, 4
	syscall
	j fim
primo:	lui $4, 0x1001 #print segunda string
	addi $4, $4, 19
	addi $2, $0, 4
	syscall
fim:	nop