.data
.asciiz "\n"
.asciiz "Numero 1:"
.asciiz "Numero 2:"
.text
main:	lui $4, 0x1001 #imprimi "Numero 1:"
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe numero
	syscall
	add $5, $0, $2 #salva numero no $5
	addi $4, $4, 10 #imprimi "Numero 2:"
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe numero
	syscall
	add $6, $0, $2 #salva numero no $6
	sub $7, $5, $6
	srl $7, $7, 31
	beq $7, $0, parte1 #$5 > $6
	add $25, $0, $6 #$6 > $5
	add $24, $0, $5
	j imprimi 
parte1:	add $25, $0, $5 #$25 recebe o maior
	add $24, $0, $6 #$24 recebe o menor
imprimi:add $8, $0, $24 #inicio = numero menor
	add $9, $25, 1 #fim = numero maior + 1
teste:	beq $8, $9, fim #para quando $8 = $9
	add $4, $0, $8 #imprimi número
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi a quebra de linha
	addi $2, $0, 4
	syscall
	addi $8, $8, 1
	j teste
fim:	nop
