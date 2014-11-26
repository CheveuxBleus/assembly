.data

p1: 	.asciiz "Digite 20 números:\n"
p2:	.asciiz "Array modificado: \n"
p3:	.asciiz " "

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite 20 números"
	addi $2, $0, 4
	syscall
	addi $5, $0, 21 #$5 = 21(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	
#recebe os 20 numeros e salva na memória

teste:	beq $6, $5, print #se $6(inicio) = 21 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 4 #incrementa o valor do $7
	addi $6, $6, 1 #incremento do $6
	j teste

#Print array inverso

print:	lui $4, 0x1001 #print "Array modificado: \n"
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	lui $8, 0x1002
	
teste2:	subi $7, $7, 4 #subtrai o valor de $7
	lw $4, 0($7) #salva no $4
	addi $2, $0, 1 #imprimi o dado
	syscall
	lui $4, 0x1001 
	addi $4, $4, 0x28
	addi $2, $0, 4
	syscall
	beq $7, $8, fim #se for igual a 0, termina
	j teste2

fim:	addi $2, $0, 10
	syscall