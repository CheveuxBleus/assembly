.data
.asciiz "Digite 10 números:"
.asciiz "A soma é: "
.text

main:	lui $4, 0x1001 #ler a primeira string
	addi $2, $0, 4
	syscall
	addi $6, $0, 1 #inicio = 1
	addi $7, $0, 11 #fim = 11
teste:	beq $6, $7, fim
	addi $2, $0, 5 #ler um numero
	syscall
	add $5, $5, $2 #soma = soma + num
	addi $6, $6, 1
	j teste
fim:	lui $4, 0x1001 #ler a segunda string
	addi $4, $4, 19
	addi $2, $0, 4
	syscall
	add $4, $0, $5
	addi $2, $0, 1
	syscall
	nop