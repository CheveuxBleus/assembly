.data
.asciiz "Digite um número:"
.asciiz "Números:\n"
.asciiz " é/são par(es).\n"
.asciiz " é/são impar(es)."
.text
main:	lui $4, 0x1001 #imprime a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe um numero
	syscall
	add $5, $0, $2 #$5 salva num
	addi $4, $4, 18 #imprimi a string números
	addi $2, $0, 4
	syscall
	addi $6, $0, 1 #$6 = inicio = 1
	addi $7, $5, 1 #$7 = fim = num + 1
	addi $10, $0, 2 #$10 = 2
	#$8 => par / $9 => impar
teste:	beq $6, $7, fim
	addi $2, $0, 5 #recebe um numero
	syscall
	div $2, $10
	mfhi $11
	beq $11, $0, par
	addi $9, $9, 1
	j mais
par:	addi $8, $8, 1
mais:	addi $6, $6, 1	
	j teste
fim:	add $4, $0, $8 #imprimi a qtd de pares
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi terceira string
	addi $4, $4, 28
	addi $2, $0, 4
	syscall
	add $4, $0, $9 #imprimi a qtd de impares
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi quarta string
	addi $4, $4, 45
	addi $2, $0, 4
	syscall
	nop
	