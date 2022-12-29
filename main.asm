.data
	textos: .asciiz "textos.txt" ##o arquivo para ler e escrever os dados
	textBoolean: .asciiz "textBoolean.txt" ##quando ta F é para o assembly jogar, V é para java Jogar
	lerBoo: .space 2 ##aqui eh para ler do textboolean.txt e se tiver o valor "f" o assembly jogar
	falso: .asciiz "f" ##aqui eh pra fazer a comparacao se no textboolean.txt tem o valor "f" para o assembly jogar
	trur: .asciiz "v" ##aqui serve para gravar no textboolean.txt o valor "v" que eh para o java jogar
	
	welcome: .asciiz "### Bem-vindo ao jogo da vida! ###\n\nComo jogar?\n"
	instr1: .asciiz "Abrindo o executavel ass.jar abrira uma tela feita em\n"
	instr2: .asciiz "java para dar suporte ao assembly! Para jogar, basta\n"
	instr3: .asciiz "digitar um inteiro 0 para finalizar ou 1 para jogar\n"
	instr4: .asciiz "Se acertar, vai pular casas, se errar,\n"
	instr5: .asciiz "voltara casas!\n###############################\n\n"
	
	ask: .asciiz "\n\n##### Digite 0 para sair e 1 para jogar! ##### "
	esperaAss: .asciiz "\n@@@@@@@ Precisa interagir com a interface! @@@@@@@"
	
	
	p1: .asciiz "Bolsonaro\nLula\nFaz o L\nBarba Branca\nQuem ganhou a eleicao de 2022?\n2\n"
	p2: .asciiz "Kal-El\nSuper man\nClark Kent\nBatman\nQual o VERDADEIRO nome do Superman?\n1\n"
	p3: .asciiz "19/11\n20/11\n21/11\n22/11\nQual dia este projeto foi finalizado em 2022?\n3\n"
	p4: .asciiz "Alcidez\nAndre Luiz\nRaphael\nMay Li\nQuem foi o professor deste projeto?\n2\n"
	p5: .asciiz "Jaine\nPaola\nNicolas\nJordan\nQual desses alunos estudou no mesmo periodo?\n4\n"
	p6: .asciiz "Milena\nEricles\nJoJo\nNadianne\nQual desses alunos estudou no mesmo periodo?\n4\n"
	p7: .asciiz "Marcao\nPalmas\nMuzan\nDias\nQual o apelido de Marcos Venicios da Palmas Dias?\n3\n"
	p8: .asciiz "Thalyta\nJason\nBeatriz\nNayara\nQual desses alunos estudou no mesmo periodo?\n1\n"
	p9: .asciiz "Verenilson\nIcaro\nLuiz\nNagibe\nQuem tem o sufixo LINDO como apelido no final do nome?\n1\n"
       p10: .asciiz "Joanne\nKevenny\nMilena\nMc Chocolate\nQuem tem o apelido de M1LGR4L?\n3\n"
       p11: .asciiz "10/11\n15/11\n17/11\n19/11\nQuando Verelindo completa ano?\n1\n"
       p12: .asciiz "OAB\nAOC\nAAC\nOAC\nQual a sigla desta disciplina?\n4\n"
       p13: .asciiz "Windows\nMAC\nLinux\nHaiku\nQual o sistema operacional mais usado do mundo?\n1\n"
       p14: .asciiz "Assembly\nJava\nC#\nDart\nQual a linguagem que foi utilizada para fazer esta interface?\n2\n"
       p15: .asciiz "Opera GX\nSafari\nChrome\nMozila Firefox\nQual o navegador mais utilizado do mundo?\n3\n"
       p16: .asciiz "Reckless Love\nFake Love\nLove Game\nI love Rock 'n' Roll\nQual dessas musicas eh de romance?\n1\n"

.text
.globl main

main:
	li $v0, 4 
	li $t0, 1 #Qual casa estou?
	li $t1, 1 #temporaria para pedir o inteiro do usuario
	li $t2, 1 #perguntar se o usuario digitou algo maior que 2
	li $t3, 0 #perguntar se digitou menor que zero
	li $t4, 0 #eh pra dizer se vai fazer chamada da funcao pra jogar
	li $t5, 16 #quantidade de perguntas
	li $t9, 0 #auxiliar, pode usar a qualquer momento
	
	jal fAux1
	##### comeca o jogo #####
loop:
	slt $t9, $t5, $t0
	beq $t9, 1, reset
	
	la $a0, ask
	li $v0, 4
	syscall ##vai printar o ask, perguntar o inteiro
	
	li $v0, 5 
	syscall #usuario digita o inteiro e guarda em $v0
	move $t1, $v0 #atualiza o $t1 oque o usuario digitou
	beq $t1, $zero, exit # se digitou 0, finaliza o programa
	
	###### \/ condicao pra saber se digitou algo maior que 3 ou menor que 0 \/ ######
	slt $t9, $t2, $t1 #if $t1 > $t2 guarda o valor em $t9
	bne $t9, $zero, loop #se for maior, volta e perguta de novo
	
	slt $t9, $t1, $t3 #if 0 > oque o usuario digitou
	bne $t9, $zero, loop #se for menor, volta e pergunta dee novo
	###### /\ condicao pra saber se digitou algo maior que 3 ou menor que 0 /\ ######
	
	#Aqui significa que vai ler do txt, se tiver "f" eh porque o mips pode jogar
	
	##### \/ Validar instrucao \/ #####
	li $v0, 13 # mudar sistema pra ler de arquivo
	la $a0, textBoolean # o diretorio do arquivo pra ler
	li $a1, 0 # 0 significa pra leitura, 1 significa pra escrever
	syscall
	move $s0, $v0
	
	# agora vamos ler oque tem dentro #
	li $v0, 14 # muda o sistema pra pegar do arquivo oque tem dentro
	move $a0, $s0 # muda o nome do diretorio de leitura pra $s0
	la $a1, lerBoo # variavel que vai guardar 't' ou 'f'
	la $a2, 2 # limite de caracter, pelo q entendi pode ignorar eu acho
	syscall
	
	li $v0, 16 #daq ate syscall significa fechar o arquivo de leitura
	move $a0, $s0
	syscall
	
	#li $v0,4
	#la $a0, lerBoo
	#syscall ##aqui vai ler do txt "textBoolean.txt" o valor "v" ou "f" e printar
	
	#la $a0, falso
	#syscall #aqui vai ler o "f" da variavel falso e vai printar
	
	lb $t8, falso
	lb $t7, lerBoo
	
	slt $t9, $t8, $t7
	
	#caso caia na msg, $t4 recebe zero e volta pro loop, se nao, significa que
	#eh pro Mips jogar e o $t4 recebe 1 para a proxima vez estar atualizado
	li $t4, 1 
	bne $t9, $zero, msg
	#beq $t4, $zero, loop
	
	##### /\ Validar instrucao /\ #####
	####### \/ Aqui fica as funcoes \/ #######
	beq $t0, 1, funcao1
	beq $t0, 2, funcao2
	beq $t0, 3, funcao3
	beq $t0, 4, funcao4
	beq $t0, 5, funcao5
	beq $t0, 6, funcao6
	beq $t0, 7, funcao7
	beq $t0, 8, funcao8
	beq $t0, 9, funcao9
	beq $t0,10, funcao10
	beq $t0,11, funcao11
	beq $t0,12, funcao12
	beq $t0,13, funcao13
	beq $t0,14, funcao14
	beq $t0,15, funcao15
	beq $t0,16, funcao16
	
	####### /\ Termino das funcoes /\ #######
	
	j loop
	
funcao16:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p16
	la $a2, 91
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
	
funcao15:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p15
	la $a2, 81
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
	
funcao14:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p14
	la $a2, 85
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
	
funcao13:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p13
	la $a2, 73
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao12:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p12
	la $a2, 48
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao11:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p11
	la $a2, 56
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao10:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p10
	la $a2, 67
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao9:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p9
	la $a2, 85
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao8:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p8
	la $a2, 75
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao7:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p7
	la $a2, 76
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao6:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p6
	la $a2, 75
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao5:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p5
	la $a2, 73
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao4:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p4
	la $a2, 71
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra

funcao3:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p3
	la $a2, 71
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
			
funcao2:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p2
	la $a2, 72
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
	
funcao1:
	#addi $sp, $sp, -4
	li $v0, 13
	la $a0, textos
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, p1
	la $a2, 68
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	###################################
	li $v0, 13
	la $a0, textBoolean
	li $a1, 1
	syscall
	move $s1, $v0
	
	li $v0, 15
	move $a0, $s1
	la $a1, trur
	la $a2, 2
	syscall
	
	li $v0, 16
	move $a0, $s1
	syscall
	
	
	addi $t0, $t0, 1
	#addi $sp, $sp, 4
	jr $ra
	
exit:
	li $v0, 10
	syscall
	#termino do programa


fAux1:
	#addi $sp, $sp, -4
	li $v0, 4 ##carrega o valor para ler no console
	la $a0, welcome ##ler o endereco da variavel para o $a0 para printar no console
	syscall #aqui a gente pintra ela no console
	la $a0, instr1
	syscall
	la $a0, instr2
	syscall
	la $a0, instr3
	syscall
	la $a0, instr4
	syscall
	la $a0, instr5
	syscall
	
	#addi $sp, $sp, 4
	jr $ra ##aqui eh para voltar na primeira funcao chamada

reset:
	
	li $t0, 1
	#li $v0, 4
	#la $a0, resetado
	syscall
	jr $ra

msg:
	li $v0, 4
	la $a0 esperaAss
	li $t4, 0
	syscall
	jr $ra
