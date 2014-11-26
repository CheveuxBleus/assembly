.data
 .asciiz "Número 1: "
 .asciiz "Número 2: "
 .asciiz "MDC: "
.text
main:	lui $4, 0x1001 #print primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$5 recebe A
	syscall
	add $5, $0, $2
	addi $4, $4, 11 #print segunda string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$6 recebe B
	syscall
	add $6, $0, $2
	addi $10, $0, 1 #saida = 1
	addi $7, $0, 1 #Inicio => $7 = 1
	slt $8, $5, $6 #$5 - $6 
	beq $8, $0, menor #$6 é o menor
	add $9, $0, $5 #$5 é o menor
	add $19, $0, $6
	j teste
menor:	add $9, $0, $6
	add $19, $0, $5
teste:	beq $9, $7, fim #qd o menor = $7 => fim
	addi $7, $7, 1 #incremento
	div $9, $7 #divide o menor por $7
	mfhi $11 #$11 = resto
	bne $11, $0, teste #se resto diferente de zero => teste
	div $19, $7 #divide o maior por $7
	mfhi $11 #$11 = resto
	bne $11, $0, teste #se resto diferente de zero => teste	
	add $10, $0, $7 #senao salva na saida => $10
	j teste
fim:	addi $4, $4, 11 #print terceira string
	addi $2, $0, 4
	syscall
	add $4, $0, $10
	addi $2, $0, 1 #print valor
	syscall
	nop