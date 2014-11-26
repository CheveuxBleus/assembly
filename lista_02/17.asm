.data
.asciiz "\n"
.asciiz "Digite quantos números desejar (o zero finaliza):"
.asciiz "Números digitados:"
.asciiz "A soma dos números:"
.text
main:	lui $4, 0x1001 #imprimi a segunda string
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
	# $7 = qtd/ $8 = soma
teste:	addi $2, $0, 5 #recebe um número
	syscall
	beq $2, $0, fim #se num = 0 => fim
	addi $7, $7, 1 #qtd = qtd +1
	add $8, $8, $2 #soma = soma + num
	j teste
fim:	addi $4, $4, 50 #imprimi a terceira string
	addi $2, $0, 4
	syscall
	add $4, $0, $7 #imprimi a qtd
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #imprimi quebra de linha
	addi $2, $0, 4
	syscall
	addi $4, $4, 71 #imprimi a quarta string
	addi $2, $0, 4
	syscall
	add $4, $0, $8 #imprimi a soma
	addi $2, $0, 1
	syscall
	nop