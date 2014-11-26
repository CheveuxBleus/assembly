.data
.asciiz "A soma é:"
.text
main:	lui $4, 0x1001 #ler a string
	addi $2, $0, 4
	syscall
	addi $7, $0, 1 #inicio => $7 = 1
	addi $8, $0, 51 #final => $8 = 51
	addi $11, $0, 1 #numero impar
teste:	beq $7, $8, fim #se $7 = $8 =>fim
	div $11, $7 #divide (o impar)$11 por $7
	mflo $12 #resultado => $12
	add $20, $20, $12 #soma = soma + resultado
	addi $7, $7, 1 #incremento $7 + 1
	addi $11, $11, 2 #incremento $11 + 2
	j teste	
fim:	add $4, $0, $20 #soma => $4
	addi $2, $0, 1 #imprimi o valor da soma
	syscall
	nop
	
	
