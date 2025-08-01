.data
	n: .double 2
	x: .double 40.67
	pi: .double 3.14159265359
	
	var: .double 1
	var2: .double 2
	var3: .double 180
.text

	#carrega as variaveis
	ldc1 $f8, n
	ldc1 $f10, x
	ldc1 $f26, pi
	ldc1 $f28, var3
	
	#converter numero para radianos
	mul.d $f10, $f10, $f26
	div.d $f10, $f10, $f28
	
	ldc1 $f22, var #sequencia
	addiu $a0, $zero, 1 #cont sequencia	
	addiu $a1, $zero, 7 #condicao de parada 
	addiu $a2, $zero, 1 #variavel para verificar sinal
	ldc1 $f24, var2 # = 2
	
	loop_sequencia:
		#inicializa as variaveis
		ldc1 $f12, var #fat
		ldc1 $f14, var #cont fat
		ldc1 $f16, var # = 1
		ldc1 $f18, var #potenciacao
		ldc1 $f20, var #cont pot
	
		jal calcula_fatorial
		jal calcula_potenciacao
		
		div.d $f18, $f18, $f12
		
		#verificar se a interacao e par ou impar para achar o sinal
		bgtz $a2, subtracao
		
		soma:
			add.d $f22, $f22, $f18
			addiu $a2, $zero, 1
			
			j incrementa_cont_loop
		
		subtracao:
			sub.d $f22, $f22, $f18
			addiu $a2, $zero, 0
		
		incrementa_cont_loop:
			add $a0, $a0, 1
			add.d $f8, $f8, $f24 
			
		verifica_condicao_loop:
			blt $a0, $a1, loop_sequencia
			j imprime_cosseno
			
		 
	
	calcula_fatorial:
		mul.d $f12, $f12, $f14
		
		incrementa_cont_fat:
			add.d  $f14, $f14, $f16
		
		verifica_condicao_fatorial:
			c.le.d $f14, $f8
			bc1t calcula_fatorial 
			jr $ra
	
	calcula_potenciacao:
		mul.d $f18, $f18, $f10
		
		incrementa_cont_ptenciacao:
			add.d  $f20, $f20, $f16
		
		verifica_condicao_potenciacao:
			c.le.d $f20, $f8
			bc1t calcula_potenciacao
			jr $ra
			
	imprime_cosseno:
		mov.d $f12, $f22
		li $v0, 3
		syscall
			
	fim_programa:
		li $v0, 10
		syscall
		
