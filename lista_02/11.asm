.data
.asciiz "\n"
.asciiz "x"
.asciiz "="
.asciiz "Digite um número:"
.text
main:	lui $4, 0x1001 #imprime a ultima string
	addi $4, $4, 6
	addi $2, $0, 4
	syscall	
	addi $2, $0, 5 #recebe um inteiro
	syscall
	add $5, $0, $2 #num => $5
	addi $6, $0, 1 #Inicio: $6 = 1
	addi $7, $0, 11 #Fim: $7 = 11
teste:	beq $6, $7, fim
	add $4, $0, $5 # $4 recebe o num	
	addi $2, $0, 1 #imprime o num
	syscall
	lui $4, 0x1001 #imprime "x"
	add $4, $4, 2 
	addi $2, $0, 4
	syscall
	add $4, $0, $6 #imprimi $6
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprime "="
	addi $4, $4, 4
	addi $2, $0, 4
	syscall
	mul $4, $5, $6 #resultado da multiplicação => $4
	addi $2, $0, 1 #imprime resultado
	syscall
	lui $4, 0x1001 #imprime quebra de linha
	addi $2, $0, 4
	syscall
	addi $6, $6, 1
	j teste
fim:	nop
