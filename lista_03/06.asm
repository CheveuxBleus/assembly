.data
p1: 	.asciiz "Digite 10 números:\n"
p2:	.asciiz " é o maior número\n"
p3:	.asciiz "Índice: "
.text
main:	lui $4, 0x1001 #print "Digite 10 números"
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	#$15 = maior / $16 = indice
teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste
print:	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para acessar os dadosyscall
	lw $15, 0($7) 	#passa o primeiro dado para o registrador $15
	subi $16, $6, 1 #passa o indice para o $16
	addi $5, $0, 10 #$5 = fim = 10
teste2:	beq $6, $5, fim #se $6(inicio) = 11 => fim
	addi $6, $6, 1 #incremento $6
	addi $7, $7, 4 #incremento $7
	lw $4, 0($7) 	#passa os dados para o registrador $4	
	slt $13, $4, $15 #se num < que $15 = 1, se num > $15 = 0;
	beq $13, $0, troca
	j teste2
troca:	add $15, $0, $4 #salva o num em $15
	subi $16, $6, 1 #passa o indice para o $16
	j teste2
fim: 	add $4, $0, $15 #print o maior numero
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print segunda string
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	lui $4, 0x1001 #print terceira string
	addi $4, $4, 0x28
	addi $2, $0, 4
	syscall
	add $4, $0, $16 #print o valor do indice
	addi $2, $0, 1
	syscall
	addi $2, $0, 10
	syscall
