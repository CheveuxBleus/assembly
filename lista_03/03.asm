.data
p1: 	.asciiz "Digite 10 números:\n"
p2: 	.asciiz "Números digitados:\n"
p3:	.asciiz " - par\n"
p4:	.asciiz " - impar\n"
.text
main:	lui $4, 0x1001 #print a primeira string
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dado
	lui $4, 0x1001 #print a terceira string
	addi $4, $4, 0x16 #
	addi $2, $0, 4
	syscall
teste2:	beq $6, $5, fim #se $6(inicio) = 11 => fim
	lw $4, 0($7) #passa os dados para o registrador $4
	addi $8, $0, 2 #$8 = 2
	div $4, $8 #num / 2
	mfhi $9
	beq $9, $0, par #se resto = 0 => par		
	addi $2, $0, 1 #print o dado
	syscall
	lui $4, 0x1001 #print string impar
	addi $4, $4, 0x30 
	addi $2, $0, 4
	syscall
	j inc
par:	addi $2, $0, 1 #print o dado
	syscall
	lui $4, 0x1001 #print par
	addi $4, $4, 0x28
	addi $2, $0, 4
	syscall	
inc:	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste2
fim: 	addi $2, $0, 10
	syscall
