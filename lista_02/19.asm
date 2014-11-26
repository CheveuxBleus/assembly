.data
.asciiz "Digite um número: "
.asciiz "O fatorial de "
.asciiz " é "
.asciiz "Erro"
.text
main:	lui $4, 0x1001 #imprimi a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$5 recebe o num
	syscall
	add $5, $0, $2
	bltz $5, erro #se for menor que zero => erro
	beq $5, $0, zero #se for igual a zero
	add $10, $0, 1 #resultado recebe 1
	addi $6, $0, 1 #$6 = inicio = 1
teste:	beq $5, $6, print
	addi $6, $6, 1
	mul $10, $10, $6
	j teste	
erro:	lui $4, 0x1001 #imprime a quarta string
	addi $4, $4, 38
	addi $2, $0, 4
	syscall
	j fim
zero:	addi $10, $0, 1 #!0 = 1
print:	addi $4, $4, 19 #imprime a segunda string
	addi $2, $0, 4 
	syscall
	add $4, $0, $5 #imprime o num
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime a terceira string
	addi $4, $4, 34 
	addi $2, $0, 4 
	syscall
	add $4, $0, $10 #imprime o resultado
	addi $2, $0, 1
	syscall	
fim:	nop