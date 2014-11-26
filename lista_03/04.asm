.data
p1: 	.asciiz " "
p2: 	.asciiz " são pares:\n"
p3:	.asciiz "Digite 20 números:\n"
.text
main:	lui $4, 0x1001 #print a ultima string
	addi $4, $4, 0xf
	addi $2, $0, 4
	syscall
	addi $5, $0, 21 #$5 = 21(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	addi $10, $0, 2 #$10 = 2
teste:	beq $6, $5, print #se $6(inicio) = 21 => print
	addi $2, $0, 5 #recebe numero
	syscall
	div $2, $10 #num / 2
	mfhi $11
	beq $11, $0, salva
	j inc
salva:	sw $2, 0($7) #salva na memoria
	addi $12, $12, 1 #qtd de pares
	addi $7, $7, 4 #incrementa o valor do $7
inc:	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dado
	add $4, $0, $12 #print qtd de pares
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print a segunda string
	addi $4, $4, 2
	addi $2, $0, 4
	syscall
teste2:	beq $6, $12, fim #se $6(inicio) = qtd de pares => fim
	lw $4, 0($7) #passa os dados para o registrador $4	
	addi $2, $0, 1 #print o dado
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $2, $0, 4
	syscall
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste2
fim: 	addi $2, $0, 10
	syscall
