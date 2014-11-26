.data
.asciiz "Esses são os multiplos de 3 ou de 5 entre 1 e 200:\n"
.asciiz "\n"
.text
main:	lui $4, 0x1001 #imprime a primeira string
	addi $2, $0, 4
	syscall
	addi $5, $0, 1 #inicio => $5 = 1
	addi $6, $0, 201 #fim => $6 = 201
	addi $7, $0, 3 #$7 = 3
	addi $10, $0, 5 #$10 = 5
teste:	beq $6, $5, fim #Se $5 = $6 => fim
	div $5, $7 #divide $5 por 3
	mfhi $8 #salva resto no $8
	beq $8, $0, imprimi #se $8 igual a 0 => imprimi
	div $5, $10 #senao divide $5 por 10
	mfhi $8 #salva resto no $8
	beq $8, $0, imprimi #se $8 igual a 0 => imprimi
	j mais
imprimi:add $4, $0, $5 #imprime o valor de $5
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $4, $4, 52
	addi $2, $0, 4
	syscall
mais:	addi $5, $5, 1 #incremento
	j teste
fim:	nop
