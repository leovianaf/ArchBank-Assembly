.data
    	MAX_CLIENTES: .word 50
    	cliente0: .space 64  # Espaco para armazenar informacoes do cliente0 (Cada cliente possui 64 bytes, sendo 11 para cpf, 8 para a conta, 6 para o saldo (em centavos), 6 para o limite (em centavos), 6 para a fatura/divida (em centavos) e 27 para o nome)
    	cliente1: .space 64
    	cliente2: .space 64
    	cliente3: .space 64
    	cliente4: .space 64
    	cliente5: .space 64
    	cliente6: .space 64
    	cliente7: .space 64
    	cliente8: .space 64
    	cliente9: .space 64
    	cliente10: .space 64
    	cliente11: .space 64
    	cliente12: .space 64
    	cliente13: .space 64
    	cliente14: .space 64
    	cliente15: .space 64
    	cliente16: .space 64
    	cliente17: .space 64
    	cliente18: .space 64
    	cliente19: .space 64
    	cliente20: .space 64
    	cliente21: .space 64
    	cliente22: .space 64
    	cliente23: .space 64
    	cliente24: .space 64
    	cliente25: .space 64
    	cliente26: .space 64
    	cliente27: .space 64
    	cliente28: .space 64
    	cliente29: .space 64
    	cliente30: .space 64
    	cliente31: .space 64
    	cliente32: .space 64
    	cliente33: .space 64
    	cliente34: .space 64
    	cliente35: .space 64
    	cliente36: .space 64
    	cliente37: .space 64
    	cliente38: .space 64
    	cliente39: .space 64
    	cliente40: .space 64
    	cliente41: .space 64
    	cliente42: .space 64
    	cliente43: .space 64
    	cliente44: .space 64
    	cliente45: .space 64
    	cliente46: .space 64
    	cliente47: .space 64
    	cliente48: .space 64
    	cliente49: .space 64
    	
    	nomeBancoBanner: .asciiz "ArchBank-shell>> "
    	hifen: .asciiz " - "
    	LIMITE_ATINGIDO_MSG: .asciiz "\nLimite de clientes atingido.\n"
   	CLIENTE_CADASTRADO_MSG: .asciiz "\nCliente cadastrado com sucesso. Número da conta: "
   	CLIENTE_INVALIDO_MSG: .asciiz "\nNumero da conta do cliente invalido.\n"
   	COMANDO_NAO_EXISTE: .asciiz "\nO comando inserido não existe, tente novamente.\n"
   	LIMITE_ALTERADO_MSG: .asciiz "\nLimite alterado com sucesso. Número da conta: "
   	NOVO_LIMITE_MSG: .asciiz "Novo limite: "
   	CONTA_FECHADA_MSG: .asciiz "Conta fechada com sucesso" 
   	CONTA_NAOZERADA_MSG: .asciiz "Falha: saldo devedor ainda não quitado.\n Saldo da conta corrente R$"
	FATURA_NAOPAGA_MSG: .asciiz "Limite de crédito devido(fatura): R$ "
   	CPF_INVALIDO_MSG: .asciiz "Falha: CPF não possui cadastro\n"
   	
   	conta_cadastrar: .asciiz "conta_cadastrar"
   	conta_format: .asciiz "conta_format"
   	debito_extrato: .asciiz "debito_extrato"
   	credito_extrato: .asciiz "credito_extrato"
   	transferir_debito: .asciiz "transferir_debito"
   	transferir_credito: .asciiz "transferir_credito"
   	pagar_fatura: .asciiz "pagar_fatura"
   	sacar: .asciiz "sacar"
   	depositar: .asciiz "depositar"
   	alterar_limite: .asciiz "alterar_limite"
   	conta_fechar: .asciiz "conta_fechar"
   	data_hora: .asciiz "data_hora"
   	
   	# Strings sem hifen
   	salvar_str: .asciiz "salvar"
   	recarregar_str: .asciiz "recarregar"
   	formatar_str: .asciiz "formatar"
	
	# Para as funcoes que recebem duas contas como argumento
	contaComDigito1: .space 9	# Para receber a primeira conta de um comando com 2 contas
	contaComDigito2: .space 9	# Para receber a segunda conta de um comando com 2 contas
	contaAtual1: .space 9		# Para comparar no vetor de clientes, se o clienteAtual1 eh igual ao contaComDigito1
	contaAtual2: .space 9		# Para comparar no vetor de clientes, se o clienteAtual2 eh igual ao contaComDigito2
	
	# Para funcoes que recebem apenas uma conta como argumento
   	contaComDigito: .space 9	# Para receber a conta de um comando
   	contaAtual: .space 9		# Para comparar no vetor de clientes, se o clienteAtual eh igual a contaComDigito
   	
   	# Para funcoes que recebem valor como argumento
   	valor: .space 6
   	
   	#Conta atual do meu loop de buscar nos clientes
   	cpfAtual: .space 12
   	
   	# Saldo atual do meu loop de buscar nos clientes
   	saldoAtual: .space 6
   	
   	# fatura atual do meu loop de buscar nos clientes
   	faturaAtual: .space 6

   	# Para selecao do metodo de pegamento da funcao para fatura
   	metodoPagamento: .space 1
   	
   	# Para funcao dataHora
   	data: .space 8 # formato DDMMAAAA dia/mes/ano
   	hora: .space 6 # formato HHMMSS hora/min/seg
   	
   	# Pra armazenar apenas os comandos inseridos na input_string  	
 	stringComando: .space 20 
   	
   	# String digitada pelo usuario no terminal do programa
   	input_string: .space 70
   	
   	teste: .asciiz "to aqui"
   	
   	cpf: .space 11	 	# Espaco na memoria para armazenar o cpf lido no input
	conta: .space 6 	# Espaco na memoria para armazenar o numero da conta lido no input
	saldo: .asciiz "000000"		# Valor padrao para um saldo ao cadastrar o cliente
	limite: .asciiz "150000"	# Valor padrao para um limite ao cadastrar o cliente
	fatura: .asciiz "000000"	# Valor padrao para uma fatura ao cadastrar o cliente
	nome: .space 27		# Espaco na memoria para armazenar o nome lido no input

.macro print_int(%inteiro)	# Macro para imprimir um inteiro, passado como parametro
	addi $v0, $0, 1		# Codigo do syscall para imprimir um inteiro
    	add $a0, $0, %inteiro	# Coloque o valor a ser impresso em $a0 
    	syscall
.end_macro

.macro print_str(%string)	# Macro para imprimir uma string, passada como parametro
	addi $v0, $0, 4		# Codigo do syscall para imprimir uma string
    	la $a0, %string		# Carrega o endereco da striing em $a0
    	syscall
.end_macro

.macro print_bl			# Macro para imprimir uma quebra de linha
    	addi $v0, $0, 11	# Codigo do syscall para imprimir um caractere
    	addi $a0, $0, '\n'	# Carrega \n em $a0 para uma quebra de linha
    	syscall
.end_macro

.macro guardar_ra_pilha
	addi $sp, $sp, -4
    	sw $ra, 0($sp)
.end_macro

.macro carregar_ra_pilha
	lw $ra, 0($sp)
	addi $sp, $sp, 4
.end_macro

.text
    	.globl main

	main:
    		# Inicializacao de variaveis
    		li $s0, 0          	# $s0 = numClientes
    		la $s1, cliente0   	# $s1 = endereco do cliente0
    		lw $s2, MAX_CLIENTES	# $s2 = 50 (num Max de clientes)

		main_loop:		
			#print_str(data)
			
			#li $v0, 4
   			#la $a0, hifen #Imprime o hifen para separar a data da hora
   			#syscall
   			
			#print_str(hora)	
			
			#li $v0, 4
   			#la $a0, hifen #Imprime o hifen para separar a hora de "ArchBank-shell>>"
   			#syscall
   			
    			print_str(nomeBancoBanner)	# Imprime o banner "ArchBank-shel>> "

			#jal aumentar_segundo #Funcao para aumentar os segundos
    			
    			# Aguarda até o próximo segundo usando syscall 32
    			#li $v0, 32
    			#li $a0, 1  # 1 segundo
    			#syscall

   	 		li $v0, 8           	# Codigo do syscall para pegar input de uma string
    			la $a0, input_string	# Endereco do espaco na memoria para guardar o input
    			li $a1, 70		# Quantidade maxima de caracteres para serem lidos no input
    			syscall

			# Atualmente se o comando for "salvar" fecha o programa
    			jal decodificaInput  # Jump para funcao que decodifica o comando para saber o que fazer

			la $a0, stringComando
			jal zerarString

    			j main_loop	# Continua pedindo comandos ate que leia "salvar"
    	
    	# Teste: 
    	# conta_cadastrar-13967492419-100010-Marceline
    	# conta_cadastrar-98765432101-000222-Robson
    	# conta_format-10010-X
    	# debito_extrato-10010-X
    	# credito_extrato-10010-X
    	# transferir_debito-100010-X-000222-7-001000
    	# transferir_credito-100010-X-000222-7-001000
    	# pagar_fatura-100010-X-001000-S
    	# sacar-100010-X-002000
    	# depositar-100010-X-010000
    	# alterar_limite-100010-X-333333
    	# alterar_limite-000222-7-777777
    	# conta_fechar-000222-7
    	# data_hora-16092012-132000
    	# salvar
    	# recarregar
    	# formatar
    	
    	decodificaInput: # Funcao para decodificar o input inserido pelo cliente
    		move $t0, $a0 # Move o endereco de input_string para $t0
    		li $t1, '-' # Carrega o hifen em $t1
    		la $t2, stringComando # Carrega o endereco da string a ser preenchida com o comando para ser comparado
    	
    		copiaComando:
    		lb $t3, 0($t0)  # Carrega byte por byte do comando em $t3
        	beq $t3, $t1, comparaComando  # Se encontrar o hifen, pula para a funcao comparaComando
        	beq $t3, 10, comparaComando # Se encontrar uma quebra de linha também pula pra funcao comparaComando
        	sb $t3, 0($t2) # Copia o byte em $t0 para o endereço em $t2
        	addi $t2, $t2, 1 # Incrementa o endereco de stringComando para copiar o próximo byte
        	addi $t0, $t0, 1  # Incrementa o endereco do comando em $t0 para verificar o byte seguinte
        	j copiaComando
        	
        	comparaComando:
        	
        	# Para verificar se é conta_cadastrar
    		la $a0, stringComando	# Carrega em $a0 a string do comando (tudo que tinha antes do '-')
    		la $a1, conta_cadastrar	# Carrega em $a0 a string "conta_cadastrar" para saber se eh essa operacao
    		guardar_ra_pilha() # Salva o $ra atual na pilha
    		jal strcmp	# Jump para funcao string compare
    		beq $v0, $zero, decodificaCadastrarCliente	# $v0 possui o resultado de strcmp, se for 0 vai para a funcao do comando especifico
    		
    		# Para verificar se é conta_format
    		la $a0, stringComando
    		la $a1, conta_format
    		jal strcmp
    		beq $v0, $zero, decodificaContaFormat
    		
    		# Para verificar se é de debito_extrato
    		la $a0, stringComando
    		la $a1, debito_extrato
    		jal strcmp
    		beq $v0, $zero, decodificaDebitoExtrato
    		
    		# Para verificar se é credito_extrato
    		la $a0, stringComando
    		la $a1, credito_extrato
    		jal strcmp
    		beq $v0, $zero, decodificaCreditoExtrato
    		
    		# Para verificar se é transferir_debito
    		la $a0, stringComando
    		la $a1, transferir_debito
    		jal strcmp
    		beq $v0, $zero, decodificaTransferirDebito

    		# Para verificar se é transferir_credito
    		la $a0, stringComando
    		la $a1, transferir_credito
    		jal strcmp
    		beq $v0, $zero, decodificaTransferirCredito
    		
    		# Para verificar se é pagar_fatura
    		la $a0, stringComando
    		la $a1, pagar_fatura
    		jal strcmp
    		beq $v0, $zero, decodificaPagarFatura
    		
    		# Para verificar se é sacar
    		la $a0, stringComando
    		la $a1, sacar
    		jal strcmp
    		# beq $v0, $zero, decodificaSacar
    		
    		# Para verificar se é depositar
    		la $a0, stringComando
    		la $a1, depositar
    		jal strcmp
    		# beq $v0, $zero, decodificaDepositar
    		
    		# Para verificar se é alterar_limite
    		la $a0, stringComando
    		la $a1, alterar_limite
    		jal strcmp
    		beq $v0, $zero, decodificaAlterarLimite
    		
    		# Para verificar se é contar_fechar
    		la $a0, stringComando
    		la $a1, conta_fechar
    		jal strcmp
    		beq $v0, $zero, decodificaContaFechar
    		
    		# Para verificar se é data_hora
    		la $a0, stringComando
    		la $a1, data_hora
    		jal strcmp
    		# beq $v0, $zero, decodificaDataHora
    		
    		# Para verificar se é salvar
    		la $a0, stringComando
    		la $a1, salvar_str
    		jal strcmp
    		beq $v0, $zero, salvar
    		
    		# Para verificar se é recarregar
    		la $a0, stringComando
    		la $a1, recarregar_str
    		jal strcmp
    		# beq $v0, $zero, recarregar
    		
    		# Para verificar se é formatar
    		la $a0, stringComando
    		la $a1, formatar_str
    		jal strcmp
    		# beq $v0, $zero, formatar
    		
    		# Para comando não existente
    		li $v0, 4			# Codigo do syscall para imprimir uma string
    		la $a0, COMANDO_NAO_EXISTE	# Caso o comando nao exista, exibe a mensagem de comando invalido
    		syscall
    		
    		j fimFuncao	# Jump para fim da funcao, para retornar ao main
    	
    	decodificaCadastrarCliente: # Funcao para decodificar os atributos do cliente
    		li $a2, 11 # Num de bytes do cpf a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 16 # Endereço do começo do cpf contido na string
    		la $a0, cpf # Destination de memcpy
    		jal memcpy # Chama memcpy
    	
    		li $a2, 6 # Num de bytes do numero da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 28 # Endereço do começo do numero da conta contido na string
    		la $a0, conta # Destination de memcpy
    		jal memcpy # Chama memcpy
    	
    		la $a1, input_string # Source de strcpy
    		addi $a1, $a1, 35 # Endereço do começo do nome contido na string
    		la $a0, nome # Destination de strcpy
    		jal strcpy2 # Chama strcpy
    	
    		j cadastrarCliente # Chama funcao cadastrarCliente
    		
    	decodificaContaFormat:
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 13 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		 # j contaFormat # FUNCAO AINDA NAO CRIADA
    		 
    	decodificaDebitoExtrato:
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 15 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j debitoExtrato # FUNCAO AINDA NAO CRIADA 
    		 
    	decodificaCreditoExtrato: 
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 16 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j creditoExtrato # FUNCAO AINDA NAO CRIADA 	
    	
    	decodificaTransferirDebito:
    		# Pra string da primeira conta
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 18 # Endereço do começo do primeiro num da conta contido na string
    		la $a0, contaComDigito1 # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# Pra string da segunda conta
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 27 # Endereço do começo do segundo num da conta contido na string
    		la $a0, contaComDigito2 # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# Pra string do valor
    		li $a2, 6 # Num de bytes do valor a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 36 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		j transferirDebito
    		
    	decodificaTransferirCredito:
		# Pra string da primeira conta
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 19 # Endereço do começo do primeiro num da conta contido na string
    		la $a0, contaComDigito1 # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# Pra string da segunda conta
    		li $a2, 8 # Num de bytes do num da conta a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 28 # Endereço do começo do segundo num da conta contido na string
    		la $a0, contaComDigito2 # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# Pra string do valor
    		li $a2, 6 # Num de bytes do valor a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 37 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		j transferirCredito
    		
    	decodificaPagarFatura:
    		li $a2, 8 # Num de bytes da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 13 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito1 # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 6 # Num de bytes do valor a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 22 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 1 # Num de bytes do metodo a ser copiado
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 29 # Endereço do metodo de pagamento contido na string
    		la $a0, metodoPagamento # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j pagarFatura
    		
    	decodificaSacar:
    		li $a2, 8 # Num de bytes da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 6 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 6 # Num de bytes do valor a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 15 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j sacar FUNCAO AINDA NAO CRIADA
    		
	decodificaDepositar:
		li $a2, 8 # Num de bytes da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 10 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 6 # Num de bytes do valor a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 19 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j depositar FUNCAO AINDA NAO CRIADA
    		
    	decodificaAlterarLimite:
    		li $a2, 8 # Num de bytes da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 15 # Endereço do começo do num da conta contido na string
    		la $a0, contaComDigito # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 6 # Num de bytes do valor a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 24 # Endereço do começo do valor contido na string
    		la $a0, valor # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		j alterarLimite
    		
    	decodificaContaFechar:
    		li $a2, 11 # Num de bytes da conta a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 13 # Endereço do começo do num da conta contido na string
    		la $a0, cpf # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		j contaFechar
    		
    	decodificaDataHora:
    		li $a2, 8 # Num de bytes da data a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 10 # Endereço do começo da data/hora contida na string
    		la $a0, data # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		li $a2, 6 # Num de bytes da hora a serem copiados
    		la $a1, input_string # Source de memcpy
    		addi $a1, $a1, 19 # Endereço do começo da data/hora contida na string
    		la $a0, hora # Destination de memcpy
    		jal memcpy # Chama memcpy
    		
    		# j dataHora

	cadastrarCliente:
    		# Argumentos: $a0 = cpf, $a1 = conta, $a2 = nome
    		# Variaveis locais: $s0 = numClientes, $s1 = endereco do bloco de clientes
    		# Cada cliente tem 64 bytes e é estruturado da seguinte maneira: 0-10 bytes = CPF / 11-18 bytes = numConta / 19-24 bytes = saldo / 25-30 bytes = limite / 31-36 bytes = fatura / 37-63 bytes = nome

    		# Verificar se o limite de clientes foi atingido
   		lw $t2, MAX_CLIENTES
    		bge $s0, $t2, limiteAtingido
	
    		# Calcular o offset para o cliente atual
    		mul $t3, $s0, 64  # Cada cliente tem 64 bytes
    		add $t4, $s1, $t3 # Endereco do cliente atual

    		# Copiar informacoes para a estrutura do cliente
    		la $a0, 0($t4)	# Carrega em $a0 a posicao inicial do cpf do cliente	(cliente[numClientes].cpf[0])
    		la $a1, cpf	# Carrega em #a1 o cpf digitado pelo usuario, que estava na memoria
    		la $a2, 11	# Carrega em $a2 a quantidade de bytes a serem copiadas de "cpf"
    		jal memcpy	# Chama a funcao memcpy
    		
    		la $a0, 11($t4)	# Carrega em $a0 a posicao inicial do numero da conta do cliente (cliente[numClientes].conta[0])
    		la $a1, conta	# Carrega em #a1 o numero da conta digitado pelo usuario, que estava na memoria
    		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas de "conta"
    		jal memcpy	# Chama a funcao memcpy
    		
    		li $t9, '-'         # Carrega em $t9 o caractere '-'
   		sb $t9, 17($t4)     # clientes[numClientes].conta[7] = '-'
   		
    		la $a0, conta       # Passa o endereco da conta salva na memoria para a funcao calcularDigitoVerificador		
    		jal calcularDigitoVerificador
    		sb $v0, 18($t4)     # clientes[numClientes].conta[8] = digito verificador calculado
    		
    		la $a0, 19($t4)	# Carrega em $a0 a posicao inicial do saldo do cliente 	(cliente[numClientes].saldo[0])
    		la $a1, saldo	# Carrega em #a1 o saldo inicial para um cliente definido na memoria
    		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas de "saldo_inicial"
    		jal memcpy	# Chama a funcao memcpy
    		
    		la $a0, 25($t4)	# Carrega em $a0 a posicao inicial do limite do cliente (cliente[numClientes].limite[0])
    		la $a1, limite	# Carrega em #a1 o limite inicial para um cliente definido na memoria
    		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas de "limite_inicial"
    		jal memcpy	# Chama a funcao memcpy
    		
    		la $a0, 31($t4)	# Carrega em $a0 a posicao inicial da fatura do cliente (cliente[numClientes].fatura[0])
    		la $a1, fatura	# Carrega em #a1 o limite inicial para um cliente definido na memoria
    		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas de "limite_inicial"
    		jal memcpy	# Chama a funcao memcpy
    		
    		la $a0, 37($t4)	# Carrega em $a0 a posicao inicial do nome do cliente 	(cliente[numClientes].nome[0])
    		la $a1, nome	# Carrega em #a1 o nome digitado pelo usuario, que estava na memoria
    		jal strcpy	# Chama a funcao memcpy

    		# Mensagem de sucesso  
    		print_str(CLIENTE_CADASTRADO_MSG)  # $a0 = string para cliente cadastrado, definida no .data
    		
    		la $a0, 11($t4)		# Carrega em $a0 a posicao inicial do numero da conta do cliente (cliente[numClientes].conta[0])
		jal print_numConta      # Chama a funcao para imprimir o numero da conta com o digito verificador
		print_bl()		# Imprime uma quebra de linha	

    		# Incrementar numClientes
    		addi $s0, $s0, 1	# numClientes = numClientes + 1

    		j fimFuncao	# Jump para fim da funcao, para retornar ao main
    		
    	limiteAtingido:
   		print_str(LIMITE_ATINGIDO_MSG)  # $a0 = string para limite atingido, definida no .data

	transferirDebito:
		# Cada cliente tem 64 bytes e é estruturado da seguinte maneira: 0-10 bytes = CPF / 11-18 bytes = numConta / 19-24 bytes = saldo / 25-30 bytes = limite / 31-36 bytes = fatura / 37-63 bytes = nome
		# Variaveis locais: $s1 = endereco do bloco de clientes; $t4 = endereco do cliente atual ; $t3 = 50 (num Max de clientes)
		
		move $t4, $s1  	# Endereco para encontrar o cliente1
		move $t5, $s1  	# Endereco para encontrar o cliente2
    		lw $t3, MAX_CLIENTES	# $t3 = 50 (num Max de clientes)
    		li $t6, 0	# $t6 = 0, contador para saber se ja passou por todos os clientes
    		
        	loop_contaCliente1:	# Loop para buscar um cliente pelo numero da conta
        		
        		beq $t3, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
        		la $a0, contaAtual1	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o num da conta do cliente atual 1
        		la $a1, 11($t4)		# Carrega em #a1 a posicao inicial do num da conta do cliente atual
        		la $a2, 8		# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy		# Chama memcpy
		
			la $a0, contaComDigito1	# Carrega em $a0 a contaComDigito1, tirada do input
    			la $a1, contaAtual1	# Carrega em $a1 a contaAtual1, para verificar se o num da conta eh igual ao do input
    			jal strcmp		# Compara as duas strings,  se forem iguais, achou o cliente1
    			
    			beqz $v0, loop_contaCliente2  # Se $v0 = 0, cliente1 foi encontrado, vai para loop_contaCliente2 buscar o cliente2
    			
    			addi $t4, $t4, 64	# Avanca 64 bytes para ir para o num da conta do proximo cliente
    			addi $t6, $t6, 1	# Acrescenta 1 ao contador de clientes procurados

    			beq $s2, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
    			j loop_contaCliente1	# Enquanto $v0 != 0 e o contador nao chegar a 50 clientes, continua procurando
    			
    		li $t6, 0	# $t6 = 0, contador para saber se ja passou por todos os clientes
    			
    		loop_contaCliente2:	# Loop para buscar outro cliente pelo numero da conta
        		
        		beq $t3, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
        		la $a0, contaAtual2	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o num da conta do cliente atual 1
        		la $a1, 11($t5)		# Carrega em #a1 a posicao inicial do num da conta do cliente atual
        		la $a2, 8		# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy		# Chama memcpy
		
			la $a0, contaComDigito2	# Carrega em $a0 a contaComDigito2, tirada do input
    			la $a1, contaAtual2	# Carrega em $a1 a contaAtual2, para verificar se o num da conta eh igual ao do input
    			jal strcmp		# Compara as duas strings,  se forem iguais, achou o cliente2
    			
    			beqz $v0, clientes_encontradosDebito  # Se $v0 = 0, pula para clientes_encontradosDebito
    			
    			addi $t5, $t5, 64	# Avanca 64 bytes para ir para o num da conta do proximo cliente
    			addi $t6, $t6, 1	# Acrescenta 1 ao contador de clientes procurados

    			beq $s2, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
    			j loop_contaCliente2	# Enquanto $v0 != 0 e o contador nao chegar a 50 clientes, continua procurando
    		
    		clientes_encontradosDebito:
    		# Neste momento, na memoria em $t4 esta o endereco do meu cliente1 e $t5 esta o endereco do meu cliente2
    		
    		# Agora eh necessario a funcao que converte de string pra int, para operar o limite e saldo dos clientes
    			
    		j fimFuncao

	transferirCredito:	
 		# Cada cliente tem 64 bytes e é estruturado da seguinte maneira: 0-10 bytes = CPF / 11-18 bytes = numConta / 19-24 bytes = saldo / 25-30 bytes = limite / 31-36 bytes = fatura / 37-63 bytes = nome
		# Variaveis locais: $s1 = endereco do bloco de clientes; $t4 = endereco do cliente atual ; $s2 = 50 (num Max de clientes)
		
		move $t4, $s1  	# Endereco para encontrar o cliente1
		move $t5, $s1  	# Endereco para encontrar o cliente2
    		li $t6, 0	# $t6 = 0, contador para saber se ja passou por todos os clientes
    		
        	loop_contaCliente3:	# Loop para buscar um cliente pelo numero da conta
        		
        		beq $t3, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
        		la $a0, contaAtual1	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o num da conta do cliente atual 1
        		la $a1, 11($t4)		# Carrega em #a1 a posicao inicial do num da conta do cliente atual
        		la $a2, 8		# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy		# Chama memcpy
		
			la $a0, contaComDigito1	# Carrega em $a0 a contaComDigito1, tirada do input
    			la $a1, contaAtual1	# Carrega em $a1 a contaAtual1, para verificar se o num da conta eh igual ao do input
    			jal strcmp		# Compara as duas strings,  se forem iguais, achou o cliente1
    			
    			beqz $v0, loop_contaCliente4  # Se $v0 = 0, cliente1 foi encontrado, vai para loop_contaCliente4 buscar o cliente2
    			
    			addi $t4, $t4, 64	# Avanca 64 bytes para ir para o num da conta do proximo cliente
    			addi $t6, $t6, 1	# Acrescenta 1 ao contador de clientes procurados

    			beq $s2, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
    			j loop_contaCliente3	# Enquanto $v0 != 0 e o contador nao chegar a 50 clientes, continua procurando
    			
    		li $t6, 0	# $t6 = 0, contador para saber se ja passou por todos os clientes
    			
    		loop_contaCliente4:	# Loop para buscar outro cliente pelo numero da conta
        		
        		beq $t3, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
        		la $a0, contaAtual2	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o num da conta do cliente atual 1
        		la $a1, 11($t5)		# Carrega em #a1 a posicao inicial do num da conta do cliente atual
        		la $a2, 8		# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy		# Chama memcpy
		
			la $a0, contaComDigito2	# Carrega em $a0 a contaComDigito2, tirada do input
    			la $a1, contaAtual2	# Carrega em $a1 a contaAtual2, para verificar se o num da conta eh igual ao do input
    			jal strcmp		# Compara as duas strings,  se forem iguais, achou o cliente2
    			
    			beqz $v0, clientes_encontradosCredito  # Se $v0 = 0, pula para clientes_encontradosCredito
    			
    			addi $t5, $t5, 64	# Avanca 64 bytes para ir para o proximo cliente
    			addi $t6, $t6, 1	# Acrescenta 1 ao contador de clientes procurados

    			beq $s2, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
    			j loop_contaCliente4	# Enquanto $v0 != 0 e o contador nao chegar a 50 clientes, continua procurando
    		
    		clientes_encontradosCredito:
    		# Neste momento, em $t4 esta o endereco do meu cliente1 e $t5 esta o endereco do meu cliente2
    		
    		# Agora eh necessario a funcao que converte de string pra int, para operar o limite e credito dos clientes
    			
    		j fimFuncao
    		
    	alterarLimite:
		# Cada cliente tem 64 bytes e é estruturado da seguinte maneira: 0-10 bytes = CPF / 11-18 bytes = numConta / 19-24 bytes = saldo / 25-30 bytes = limite / 31-36 bytes = fatura / 37-63 bytes = nome
		# Variaveis locais: $s1 = endereco do bloco de clientes; $t4 = endereco do cliente atual ; $s2 = 50 (num Max de clientes)
		
		move $t4, $s1  	# Endereco para encontrar o cliente que vai ter o limite alterado
    		li $t6, 0	# $t6 = 0, contador para saber se ja passou por todos os clientes
    		
        	loop_contaCliente:	# Loop para buscar um cliente pelo numero da conta
        		
        		
        		la $a0, contaAtual	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o num da conta do cliente atual 1
        		la $a1, 11($t4)		# Carrega em #a1 a posicao inicial do num da conta do cliente atual
        		la $a2, 8		# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy		# Chama memcpy
		
			la $a0, contaComDigito	# Carrega em $a0 a contaComDigito, tirada do input
    			la $a1, contaAtual	# Carrega em $a1 a contaAtual, para verificar se o num da conta eh igual ao do input
    			jal strcmp		# Compara as duas strings,  se forem iguais, achou o cliente
    			
    			beqz $v0, cliente_encontrado  # Se $v0 = 0, pula para label cliente_enconrtado
    			
    			addi $t4, $t4, 64	# Avanca 64 bytes para ir para o proximo cliente
    			addi $t6, $t6, 1	# Acrescenta 1 ao contador de clientes procurados
						
			beq $s2, $t6, cliente_invalido	# Caso o contador chegue em 50 (maximo) = passou por todos e nao encontrou, ai vai para o erro
    			j loop_contaCliente	# Enquanto $v0 != 0 e o contador nao chegar a 50 clientes, continua procurando
    		
    		cliente_encontrado:
    			# Neste momento, $t4 possui o valor do cliente que sera alterado o limite
    			la $a0, 25($t4)	# Carrega em $a0 a posicao inicial do limite do cliente (cliente[numClientes].limite[0])
    			la $a1, valor	# Carrega em #a1 o valor do limite digitado no input, que foi salvo na memoria
    			la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas de "valor"
    			jal memcpy	# Chama a funcao memcpy	

			# Mensagem de sucesso  
    			print_str(LIMITE_ALTERADO_MSG)  # $a0 = string para limite alterado, definida no .data
    		
    			la $a0, 11($t4)		# Carrega em $a0 a posicao inicial do numero da conta do cliente (cliente[numClientes].conta[0])
			jal print_numConta      # Chama a funcao para imprimir o numero da conta com o digito verificador
			print_bl()		# Imprime uma quebra de linha
		
			# Exibe o novo limite 
			print_str(NOVO_LIMITE_MSG)  # $a0 = string para novo limite, definida no .data
			print_str(valor)		# $a0 = valor do novo limite, apos alteracao
			print_bl()		# Imprime uma quebra de linha
		
    		j fimFuncao	# Jump para fim da funcao, para retornar ao main
    		
        contaFechar:
        	# Variaveis locais: $s1 = endereco do bloco de clientes
    		move $t4, $s1  # Endereco dos clientes 
    		li $t5, 0
    		
        	loop_cpfCliente:
    			# Cada cliente tem 64 bytes e é estruturado da seguinte maneira: 0-10 bytes = CPF / 11-18 bytes = numConta / 19-24 bytes = saldo / 25-30 bytes = limite / 31-36 bytes = fatura / 37-63 bytes = nome
        		la $a0, cpfAtual	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o CPF do cliente atual
        		la $a1, 0($t4)		# Carrega em #a1 a posicao inicial do cpf do cliente atual
        		la $a2, 11	# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy	# Chama memcpy // copita até um byte específico, nesse caso 11
		
			la $a0, cpf
    			la $a1, cpfAtual
    			jal strcmp
    			
    			beqz $v0, verificaSaldo  # Se $v0 = 0, pula para label verificaSaldo
    			
    			addi $t4, $t4, 64
    			addi $t5, $t5, 1
			
			beq $s2, $t5, erro_Cpf #contador para verificar se já passou por todos os clientes e da erro, caso nao encontradro
    			bnez $v0, loop_cpfCliente # Compara se o $v0 é diferente de 0. Se for, continua o loop.
    		
    		verificaSaldo:
    			la $a0, saldoAtual	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar o saldo do cliente atual
        		la $a1,19($t4)	# Carrega em #a1 a posicao inicial do saldo da conta do cliente atual
        		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy	# Chama memcpy // copita ate um byte especifico, nesse caso 5
    			
    			la $a0, saldo
    			la $a1, saldoAtual
    			jal strcmp
    			
    			bnez $v0, conta_NaoZerada
    			
    		verificaFatura:
    			la $a0, faturaAtual	# Carrega em $a0 a posicao inicial do espaco na memoria para guardar a fatura do cliente atual
        		la $a1, 31($t4)	# Carrega em #a1 a posicao inicial da fatura da conta do cliente atual
        		la $a2, 6	# Carrega em $a2 a quantidade de bytes a serem copiadas do cliente atual
        		jal memcpy	# Chama memcpy // copita até um byte específico, nesse caso 5
    			
    			la $a0, fatura # Carrega em $a0 a string da minha fatura exemplo da memoria 
    			la $a1, faturaAtual # Carrega em $a0 a string da fatura copiada
    			jal strcmp # Faz a comparacao entre fatura atual e fatura
    		
    			bnez $v0, conta_NaoZerada # Se a compracao nao for igual, $v0 != de 0, exception 
    		
    		print_str(CONTA_FECHADA_MSG)
    
    		la $a0, 0($t4) # Carrega em $a0 a posicao inicial do meu cliente a ser zerado
    		#jal zerarString # Chama a funcao zerar string
    		
    		j fimFuncao
	
	cliente_invalido:
		li $v0, 4			# Codigo do syscall para imprimir uma string
    		la $a0, CLIENTE_INVALIDO_MSG	# Caso o cliente nao exista, exibe a mensagem de cliente invalido
    		syscall

    		j fimFuncao

   	
	conta_NaoZerada:
    		print_str(CONTA_NAOZERADA_MSG) 	# Endereço da string de aviso
    		la $a0, 19($t4)		# Carrega em $a0 a posicao inicial do saldo do cliente (cliente[numClientes].saldo[0])
		jal print_valor     	# Chama a funcao para imprimir um valor
		print_bl()		# Imprime uma quebra de linha
		
		print_str(FATURA_NAOPAGA_MSG)  # $a0 = string para a fatura nao paga, definida no .data
		la $a0, 31($t4)		# Carrega em $a0 a posicao inicial da fatura do cliente (cliente[numClientes].fatura[0])
		jal print_valor     	# Chama a funcao para imprimir um valor
		print_bl()		# Imprime uma quebra de linha
			
    		j fimFuncao
    		
    	erro_Cpf:

    		print_str(CPF_INVALIDO_MSG) 	# Endereço da string de aviso
    		j fimFuncao


	#aumentar_segundo:
    		# Carrega a string de hora
    		#la $a0, hora

    		# Carrega os segundos
    		#lb $t0, 4($a0)   # Byte dos segundos
    		# Converter de caractere para inteiro FAZER
		
    		# Incrementa os segundos
    		#addi $t0, $t0, 1

    		# Verifica se os segundos ultrapassaram 59
    		# li $t1, 10        # 10 em ASCII
    		# bge $t0, $t1, ajustar_minuto

    		# Converte de inteiro para caractere FAZER (ou nao caso nao precise to pensando ainda)
    		#sb $t0, 4($a0)    # Atualiza os segundos
    		
    		#j fimFuncao
    		# jr $ra

	#ajustar_minuto:
    		# Carrega os minutos
    		#lb $t2, 2($a0)   # Byte dos minutos

    		# Incrementa os minutos
    		#addi $t2, $t2, 1

    		# Verifica se os minutos ultrapassaram 59
    		#bge $t2, $t1, ajustar_hora


    		#sb $t2, 2($a0)    # Atualiza os minutos
    		#li $t0, 0       # Reseta os segundos para '0'
    		#sb $t0, 4($a0)    # Atualiza os segundos
    		#jr $ra

	#ajustar_hora:
    		# Carrega as horas
    		#lb $t3, 0($a0)   # Byte das horas

    		# Incrementa as horas
    		#addi $t3, $t3, 1

    		# Verifica se as horas ultrapassaram 23
    		#bge $t3, $t1, hora_limite

    		#sb $t3, 0($a0)    # Atualiza as horas
    		#li $t2, 0       # Reseta os minutos para '0'
    		#sb $t2, 2($a0)    # Atualiza os minutos
    		#sb $t0, 4($a0)    # Atualiza os segundos
    		#jr $ra

		#hora_limite:
    		# Se as horas ultrapassarem 23, reinicia para '00'
    		#li $t3, '0'
    		#sb $t3, 0($a0)    # Atualiza as horas
    		#sb $t3, 2($a0)    # Atualiza os minutos
    		#sb $t3, 4($a0)    # Atualiza os segundos
    		#jr $ra

	fimFuncao:
		carregar_ra_pilha()	# Carrega o $ra do main, salvo na pilha	
    		jr $ra			# Jump para o para o main_loop, para o usuario digitar outro comando	   		        	
                     
        salvar:
        	j exit	# Jump para exit, para encerrar o programa
        	
	exit:
       		li $v0, 10        # Codigo do syscall para encerrar o programa
        	syscall
        
