.data

p1: 	.asciiz "Digite o primeiro array (8 números):\n"
p2: 	.asciiz "Digite o segundo array (8 números):\n"
p3:	.asciiz "Array1: \n"
p4:	.asciiz "Array2: \n"
p5:	.asciiz " "
p6:	.asciiz "\n"

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite o primeiro array (8 números):\n" - p1
	addi $2, $0, 4
	syscall
	addi $8, $0, 8 #$8 = 8
	lui $9, 0x1002 #registrador q vai ser usado para salvar os dados
	
#recebe os 8 numeros e salva na memória => Primeiro array

teste:	beq $8, $0, print #se $8(inicio) = 0 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 8 #incrementa o valor do $9 pulando um espaço
	subi $8, $8, 1 #decremento do $8
	j teste

#Imprime segunda string

print:	lui $4, 0x1001 #print "Digite o segundo array (8 números):\n" - p2
	addi $4, $4, 0x26
	addi $2, $0, 4
	syscall
	lui $9, 0x1002 #inicio do endereço na memoria
	addi $9, $9, 4
	addi $8, $0, 8 #$8 = 8
	
#recebe os 8 numeros e salva na memória => Segundo array

teste2:	beq $8, $0, troca #se $8(inicio) = 0 => troca
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 8 #incrementa o valor do $9 pulando um espaço
	subi $8, $8, 1 #decremento do $8
	j teste2
	
#troca os elementos do primeiro array pelos elementos do segundo e vice versa
	
troca:	lui $9, 0x1002 #inicio do endereço na memoria
	addi $8, $0, 8 #$8 = 8
	
teste3:	beq $8, $0, print2 #se $8(inicio) = 0 => print2	
	lw $10, 0($9) #salva no $10 o valor do array1
	addi $9, $9, 4
	lw $11, 0($9) #salva no $11 o valor do array2
	sw $10, 0($9) #armazena no array2 o valor do array1
	subi $9, $9, 4
	sw $11, 0($9) #armazena no array1 o valor do array2
	addi $9, $9, 8 #incremento
	subi $8, $8, 1 #decremento do $8
	j teste3

#Print array1

print2:	lui $4, 0x1001 #print "Array1: \n" - p3
	addi $4, $4, 0x4b
	addi $2, $0, 4
	syscall
	lui $9, 0x1002 #inicio do endereço na memoria
	addi $8, $0, 8 #$8 = 8
	
loop:	beq $8, $0, print3
	lw $4, 0($9) #salva o valor da memoria no $4
	addi $2, $0, 1 #print valor
	syscall
	lui $4, 0x1001 #print espaço - p5
	addi $4, $4, 0x5f
	addi $2, $0, 4
	syscall
	addi $9, $9, 8 #incremento
	subi $8, $8, 1 #decremento do $8
	j loop
	
#Print array2

print3:	lui $4, 0x1001 #print quebra de linha - p6
	addi $4, $4, 0x61
	addi $2, $0, 4
	syscall
	lui $4, 0x1001 #print "Array2: \n" - p4
	addi $4, $4, 0x55
	addi $2, $0, 4
	syscall
	lui $9, 0x1002 #inicio do endereço na memoria
	addi $9, $9, 4
	addi $8, $0, 8 #$8 = 8
	
loop2:	beq $8, $0, fim
	lw $4, 0($9) #salva o valor da memoria no $4
	addi $2, $0, 1 #print valor
	syscall
	lui $4, 0x1001 #print espaço - p5
	addi $4, $4, 0x5f
	addi $2, $0, 4
	syscall
	addi $9, $9, 8 #incremento
	subi $8, $8, 1 #decremento do $8
	j loop2	

fim:	addi $2, $0, 10
	syscall
