.data
.asciiz "Digite o valor da base: "
.asciiz "Digite o valor do expoente: "
.asciiz "Resultado: "
.asciiz "Erro"
.text
main:	lui $4, 0x1001 #imprimi a primeira string
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$5 recebe o valor da base
	syscall
	add $5, $0, $2
	lui $4, 0x1001 #imprimi a segunda string
	addi, $4, $4, 25
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #$6 recebe o valor da potencia
	syscall
	add $6, $0, $2
	bltz $6, print1 #se for menor que zero => erro
	beq $6, $0, zero #se for igual a zero
	addi $7, $0, 1 #$7(inicio) = 1
	add $10, $0, $5 #resultado recebe o valor da base
teste:	beq $7, $6, print2
	mul $10, $10, $5
	addi $7, $7, 1 #incremento
	j teste
print1:	addi $4, $4, 42 #imprimi a quarta string 
	addi $2, $0, 4
	syscall
	j fim
zero:	addi $10, $0, 1 #se o expoente for zero => resultado = 1
print2:	lui $4, 0x1001 #imprimi a terceira string
	addi $4, $4, 54
	addi $2, $0, 4
	syscall
	add $4, $0, $10 #imprime o valor do resultado
	addi $2, $0, 1
	syscall
fim:	nop