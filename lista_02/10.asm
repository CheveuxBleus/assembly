.data
.asciiz "Quantas vezes:"
.asciiz "Digite os números:"
.asciiz "A soma é: "
.text

main:	lui $4, 0x1001 #ler a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #ler um numero
	syscall
	add $20, $0, $2 # a qtd de vezes vai para o $20
	addi $4, $4, 15 #ler a segunda string
	addi $2, $0, 4
	syscall	
	addi $6, $0, 1 #inicio = 1
	addi $7, $20, 1 #fim = qtd de vezes + 1
teste:	beq $6, $7, fim
	addi $2, $0, 5 #ler um numero
	syscall
	add $5, $5, $2 #soma = soma + num
	addi $6, $6, 1
	j teste
fim:	addi $4, $4, 19 #ler a segunda string
	addi $2, $0, 4
	syscall
	add $4, $0, $5
	addi $2, $0, 1
	syscall
	nop