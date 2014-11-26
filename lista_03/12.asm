.data

p1: 	.asciiz "Digite o primeiro array (10 números):\n"
p2: 	.asciiz "Digite o segundo array (10 números):\n"
p3:	.asciiz "Terceiro array:\n"
p4:	.asciiz " "

.text

#imprimi a primeira string

main:	lui $4, 0x1001 #print "Digite o primeiro array (10 números):\n" - p1
	addi $2, $0, 4
	syscall
	jal inicio
	
#recebe os 10 numeros e salva na memória => Primeiro array

teste:	beq $8, $0, print #se $8(inicio) = 0 => print
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 12 #incrementa o valor do $9 e deixa dois espaços
	subi $8, $8, 1 #decremento do $8
	j teste

#Imprime segunda string

print:	lui $4, 0x1001 #print "Digite o segundo array (10 números):\n" - p2
	addi $4, $4, 0x27
	addi $2, $0, 4
	syscall
	jal inicio
	addi $9, $9, 4 #endereço onde começa o segundo array
	
	
#recebe os 10 numeros e salva na memória => Segundo array

teste2:	beq $8, $0, array3 #se $8(inicio) = 0 => troca
	addi $2, $0, 5 #recebe numero
	syscall
	sw $2, 0($9) #salva na memoria
	addi $9, $9, 12 #incrementa o valor do $9 pulando dois espaço
	subi $8, $8, 1 #decremento do $8
	j teste2
	
#cria o terceiro array => array1 * array2
	
array3:	jal inicio
	
teste3:	beq $8, $0, print2 #se $8(inicio) = 0 => print2	
	lw $10, 0($9) #salva no $10 o valor do array1
	addi $9, $9, 4
	lw $11, 0($9) #salva no $11 o valor do array2
	mul $12, $10, $11 #salva no $12 o valor da multiplacação do elem do array1 pelo elem do array2
	addi $9, $9, 4
	sw $12, 0($9) #salva o valor do $12 na memoria
	addi $9, $9, 4 #incremento
	subi $8, $8, 1 #decremento do $8
	j teste3
	
#Print array3

print2:	lui $4, 0x1001 #print "Terceiro array:\n" - p3
	addi $4, $4, 0x4d
	addi $2, $0, 4
	syscall
	jal inicio
	addi $9, $9, 8 #começo do endereço do array3
	
loop:	beq $8, $0, fim
	lw $4, 0($9) #salva o valor da memoria no $4
	addi $2, $0, 1 #print valor
	syscall
	lui $4, 0x1001 #print espaço - p4
	addi $4, $4, 0x5e
	addi $2, $0, 4
	syscall
	addi $9, $9, 12 #incremento
	subi $8, $8, 1 #decremento do $8
	j loop

fim:	addi $2, $0, 10
	syscall
	
#Valores iniciais

inicio:	addi $8, $0, 10 #$8 = 10
	lui $9, 0x1002 #endereço para salvar na memória
	jr $31