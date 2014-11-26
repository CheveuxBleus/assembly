# Crie uma função em assembly que receba a data de nascimento e a data do dia atual e retorne a quantidade de dias que essa 
# pessoa viveu na terra.

.data

p1:	.asciiz "Digite a data do seu nascimento"
p2:	.asciiz "\nDia: "
p3:	.asciiz "Mes: "
p4:	.asciiz "Ano: "
p5:	.asciiz "Digite a data atual"
p6:	.asciiz "Dias de vida: "
p7:	.asciiz "Data inválida"

.text

#$5 = dia_nasc / $6 = mes_nasc / $7 = ano_nasc / $8 = dia_atual / $9 = mes_atual / $10 = ano_atual

main:	
	lui $4, 0x1001 #print "Digite a data do seu nascimento" - p1
	addi $2, $0, 4
	syscall
#DIA NASC:
	addi $4, $4, 0x20	#print "Dia: " - p2
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe dia
	syscall
	add $5, $0, $2 #Dia => $8
#MES NASC:
	lui $4, 0x1001 #print "Mes: " - p3
	addi $4, $4, 0x27	
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe mes
	syscall
	add $6, $0, $2 #Dia => $9	
#ANO NASC:
	lui $4, 0x1001 #print "Ano: " - p4
	addi $4, $4, 0x2d	
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe ano
	syscall
	add $7, $0, $2 #Dia => $10
	
#DATA ATUAL

	lui $4, 0x1001 #print "Digite a data atual" - p5
	addi $4, $4, 0x33
	addi $2, $0, 4
	syscall
#DIA ATUAL:
	lui $4, 0x1001 #print "Dia: " - p2
	addi $4, $4, 0x20
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe dia
	syscall
	add $8, $0, $2 #Dia => $11
#MES ATUAL:
	lui $4, 0x1001 #print "Mes: " - p3
	addi $4, $4, 0x27	
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe mes
	syscall
	add $9, $0, $2 #Mes => $12
#ANO ATUAL:
	lui $4, 0x1001 #print "Ano: " - p4
	addi $4, $4, 0x2d	
	addi $2, $0, 4
	syscall
	addi $2, $0, 5 #recebe ano
	syscall
	add $10, $0, $2 #Ano => $13

#$5 = dia_nasc / $6 = mes_nasc / $7 = ano_nasc / $8 = dia_atual / $9 = mes_atual / $10 = ano_atual
#$11 = total de dias

#ERRO:

	blez $5, erro #se dia <= 0 - erro
    	blez $6, erro #se mes <= 0 - erro
    	blez $7, erro #se ano <= 0 - erro
    	blez $8, erro #se dia <= 0 - erro
    	blez $9, erro #se mes <= 0 - erro
    	blez $10, erro #se ano <= 0 - erro

#MESES:

	addi $19, $0, 1
    	addi $20, $0, 2
    	addi $21, $0, 3
    	addi $22, $0, 4
    	addi $23, $0, 5
    	addi $24, $0, 6
    	addi $25, $0, 7
    	addi $26, $0, 8
    	addi $27, $0, 9
    	addi $28, $0, 10
    	addi $29, $0, 11
    	addi $30, $0, 12

#TESTE:

loop:	bne $5, $8, cont
	bne $6, $9, cont
	bne $7, $10, cont
	j fim
	
cont:	beq $6, $19, m31 #janeiro => 31
    	beq $6, $20, m28
    	beq $6, $21, m31
    	beq $6, $22, m30
    	beq $6, $23, m31
    	beq $6, $24, m30
    	beq $6, $25, m31
    	beq $6, $26, m31
    	beq $6, $27, m30
    	beq $6, $28, m31
    	beq $6, $29, m30
    	beq $6, $30, m31 #dezembro
	beq $0, $0, erro #se for maior que 12 => erro

#Meses com 30 dias
	
m30:	addi $12, $0, 30 #$12 = 30
	beq $5, $12, dia1 #se dia = 30 => dia1
	addi $5, $5, 1 #senao dia = dia+1
	addi $11, $11, 1 #incremento do total de dias
	j loop
	
#Meses com 31 dias:	

m31:	addi $12, $0, 31 #$12 = 31
	beq $5, $12, dia1 #se dia = 31 => dia1
	addi $5, $5, 1 #senao dia = dia+1
	addi $11, $11, 1 #incremento do total de dias
	j loop
	
#Meses com 28 dias:
	
m28:	addi $12, $0, 28 #$12 = 28
	addi $13, $0, 29 #$13 = 29
	beq $5, $13, dia1 #se dia = 29 => dia1
	beq $5, $12, bi #se dia = 28 => bissexto
	addi $5, $5, 1 #senao dia = dia+1
	addi $11, $11, 1 #incremento do total de dias
	j loop
	
#Primeiro dia do mes:

dia1:	addi $5, $0, 1 #dia = 1
	addi $11, $11, 1 #incremento do total de dias
	addi $12, $0, 12 #$12 = 12
	beq $6, $12, mes1 #se mes = 12 => mes1
	addi $6, $6, 1 #senao mes = mes +1
	j loop	

#Primeiro mes do ano:

mes1:	addi $6, $0, 1 #mes = 1
	addi $7, $7, 1 #ano = ano + 1
	j loop
	
#Ano Bissexto:		
				
bi:	addi $14, $0, 4 #$11 = 4
	addi $12, $0, 400 #$12 = 400
	addi $13, $0, 100 #$13 = 100
	div $7, $14 #ano / 4
	mfhi $14 #resto
	bne $14, $0, dia1 #se resto diferente de 0 => nao é bissexto => dia1
	
	div $7, $13 #senao ano/ 100
	mfhi $14 #resto
	beq $14, $0, teste #tem q ver se eh divisivel por 400
	add $5, $0, 29 #se nao for divisivel por 100, é bissexto e o dia = 29
	addi $11, $11, 1 #incremento do total de dias
	j loop
	
teste:	div $7, $12 #ano / 400
	mfhi $14
	bne $14, $0, dia1 #se nao for divisivel por 400, nao é bissexto => dia1
	addi $11, $11, 1 #incremento do total de dias
	j loop

#PRINT ERRO:	
			
erro: 	lui $4, 0x1001 #print "Data inválida" - p7
	addi $4, $4, 0x56
	addi $2, $0, 4
	syscall
	j fim2
	
#FIM:

fim:	lui $4, 0x1001 #print "\nDias de vida: " - p6
	addi $4, $4, 0x47
	addi $2, $0, 4
	syscall
	add $4, $0, $11 #print total de dias
	addi $2, $0, 1
	syscall 
	
fim2:	addi $2, $0, 10
	syscall

