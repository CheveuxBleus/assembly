.data

p1: 	.asciiz "Digite 10 números:\n"
p2:	.asciiz "Saída: \n"
p3:	.asciiz " - "
p4:	.asciiz "\n"

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite 10 números"
	addi $2, $0, 4
	syscall
	addi $5, $0, 11 #$5 = 11(fim)
	addi $6, $0, 1 #$6 = 1(inicio)
	lui $7, 0x1002 #registrador q vai ser usado para salvar os dados
	
#recebe os 10 numeros e salva na memória

teste:	beq $6, $5, print #se $6(inicio) = 11 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($7) #salva na memoria
	addi $7, $7, 8 #incrementa o valor do $7 pulando um espaço
	addi $6, $6, 1 #incremento do $6
	j teste

#Imprime "Saida" e salva parametros

print:	lui $4, 0x1001 #print "Saída: \n"
	addi $4, $4, 0x14
	addi $2, $0, 4
	syscall
	lui $7, 0x1002 #inicio do endereço na memoria
	addi $6, $0, 1 #$6 =1 (inicio)

#Cria o segundo array (quadrado do primeiro)
			
teste2:	beq $6, $5, print2 #se $6(inicio) = 11 => print2
	lw $8, 0($7) #salva no $8 o valor da memória
	mul $8, $8, $8 #$8 salva o valor quadrado do num salvo na memoria
	addi $7, $7, 4 #espaço em branco
	sw $8, 0($7) #salva o quadrado do valor no espaço em branco
	addi $7, $7, 4 #incremento
	addi $6, $6, 1 #incremento
	j teste2

print2:	addi $6, $0, 1  #$6 =1 (inicio)
	lui $7, 0x1002 #inicio do endereço na memoria
	
#Print a valor do primeiro array seguido pelo segundo (o quadrado do primeiro)

teste3:	beq $6, $5, fim
	lw $4, 0($7) #print valor do primeiro array
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print " - "
	addi $4, $4, 0x1d
	addi $2, $0, 4
	syscall
	addi $7, $7, 4 #incremento1
	lw $4, 0($7) #print valor do segundo array (quadrado do primeiro)
	addi $2, $0, 1
	syscall
	lui $4, 0x1001 #print quebra de linha
	addi $4, $4, 0x21
	addi $2, $0, 4
	syscall
	addi $7, $7, 4 #incremento2
	addi $6, $6, 1 #incremento
	j teste3

fim:	addi $2, $0, 10
	syscall
