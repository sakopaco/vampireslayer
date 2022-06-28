;;=====================================================
;;CONTANTES MAGIA
;;=====================================================
datos_magia:
			DB		TIPOMAGIA		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MAGIA_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MAGIA_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MAGIA_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_lobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MAGIA_SPRITE1A	;izq arriba
			DB		MAGIA_SPRITE2A	;der_arriba
			DB		MAGIA_SPRITE1B	;izq abajo
			DB		MAGIA_SPRITE2B	;der_abajo


array_magia_posx:
			DB		48,50,52,54,56,58,60,62,64,66,68,70,72,74,76,78,80,82,84,86,88,90,92,94,96,98,100,102,104,106,108,110,112,114,116,118,120,122,124,126,128,130,132,134,136,138,140,142,144,146,148,150,152,154,156,158,160,162,164,166,168,170,172,174,176
array_magia_posyder:
			DB		64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,23,20,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,36,39,41,44,46,48
			



;;=====================================================
;;SUBRUTINAS MANEJO DE MAGIA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MAGIA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la magia en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_magia:
		LD			HL, datos_magia
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_magia:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_MAGIA
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_magia:
fin_actualiza_valores_magia:
		RET
		
		
;;=====================================================
;;MOVER_MAGIA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el lobo: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_magia:
		;CALL		calcula_magia_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		calcula_magia_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea magia
		LD			(IY + 3), MAGIA_COLOR
		LD			(IY + 7), MAGIA_COLOR
fin_mover_magia:
		RET


;;=====================================================
;;CALCULA_MAGIA_ESCENA
;;=====================================================	
calcula_magia_escena:
fin_calcula_magia_escena:
		RET
		

;;=====================================================
;;CALCULA_LOBO_INCREMENTOXY
;;=====================================================	
calcula_magia_incrementoxy:
fin_calcula_magia_incrementoxy:
		RET
