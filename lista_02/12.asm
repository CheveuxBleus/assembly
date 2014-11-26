.data
.asciiz "Esses são os multiplos de 3 entre 1 e 200:\n"
.asciiz "\n"
.text
main:	lui $4, 0x1001 #imprime a primeira string
	addi $2, $0, 4
	syscall
	addi $5, $0, 1 #inicio => $5 = 1
	addi $6, $0, 201 #fim => $6 = 201
	addi $7, $0, 3 #$7 = 3
teste:	beq $6, $5, fim 
	div $5, $7 #divide $5 por 3
	mfhi $8 #salva resto no $8
	bne $8, $0, mais #se $8 diferente de 0 => mais
	add $4, $0, $5 #senao => imprime o valor de $5
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $4, $4, 44
	addi $2, $0, 4
	syscall
mais:	addi $5, $5, 1 #incremento
	j teste
fim:	nop