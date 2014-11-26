.data
 .asciiz "Quantos números: "
 .asciiz " é/são primo(s)\n"
 .asciiz " não é/são primo(s)"
 .asciiz "Digite o(s) número(s):\n"
.text
main:	lui $4, 0x1001 #print primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$5 recebe qtd
	syscall
	add $5, $0, $2 
	addi $4, $4, 55 #print quarta string
	addi $2, $0, 4
	syscall
	addi $11, $0, 1 #comp
	#$23 => primos / $24 => pares
teste:	beq $5, $7, fim
	addi $2, $0, 5 #recebe um numero
	syscall
	subi $6, $2, 1 #$6 = num -1
	add $8, $0, $0 #inicio = 0
teste2:	beq $8, $6, teste3 #se num = $8 => teste
	addi $8, $8, 1
	div $2, $8 #num / $8
	mfhi $9
	bne $9, $0, teste2
	add $10, $0, $8
	j teste2
teste3: beq $10, $11, primo
	addi $24, $24, 1
	addi $7, $7, 1
	j teste
primo:	addi $23, $23, 1
	addi $7, $7, 1
	j teste
fim:	add $4, $0, $23 #print o numero de primos
	addi $2, $0, 1 
	syscall
	lui $4, 0x1001 #print segunda string
	addi $4, $4, 18
	addi $2, $0, 4
	syscall
	add $4, $0, $24 #print o numero de nao-primos
	addi $2, $0, 1 
	syscall
	lui $4, 0x1001 #print terceira string
	addi $4, $4, 35
	addi $2, $0, 4
	syscall
	nop