;;=====================================================
;;CONTANTES FUEGO
;;=====================================================
datos_fuego:
			DB		TIPOFUEGO				;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0						;(escena) sprite a mostrar 1/2
			DB		00010000b				;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		FUEGO_ENERGIA			;(energia) energía del enemigo antes de morir
			DB		FUEGO_POS1X				;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		FUEGO_POS1Y				;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		0						;(incx) incremento x para mover
			DB		0						;(inxy) incremento y para mover
			DB		00000001				;(direccionx) 00000001 derecha // 00000010 abajo // 00000100 izquierda // 00001000 arriba
			DB		0						;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		FUEGO_PASOSX			;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0						;(radio) radio para movimientos circulares
			DW		mover_fuego				;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		FUEGO_SPRITE1A			;izq arriba
			DB		FUEGO_SPRITE1A			;izq abajo
			DB		FUEGO_SPRITE1A			;der_arriba
			DB		FUEGO_SPRITE1A			;der_abajo
			DB		FUEGO_DANO 				;dano
			DW		check_colision_enemigo16x16		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)


;;=====================================================
;;SUBRUTINAS MANEJO DE FUEGO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_FUEGO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del fuego en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_fuego:
		LD			HL, datos_fuego
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_fuego:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_FUEGO
;;=====================================================	
; función: 	inicializa valores aleatorios del murciélago
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_fuego:
fin_actualiza_valores_fuego:
		
		
;;=====================================================
;;MOVER_FUEGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el muerciélago: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_fuego:
		CALL		calcula_fuego_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		ADD			16
		LD			(IY + 4), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		
		CALL		calcula_fuego_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea fuego
		LD			(IY + 3), FUEGO_COLOR1
		LD			(IY + 7), FUEGO_COLOR2
fin_mover_fuego:
		RET


;;=====================================================
;;CALCULA_FUEGO_ESCENA
;;=====================================================	
calcula_fuego_escena:
		LD			 A, (heartbeat_fuego)
		AND			FUEGO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del fuego
			XOR			 A
			LD			(heartbeat_fuego), A
			
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano
			
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), FUEGO_SPRITE1A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), FUEGO_SPRITE1B
				RET
.enemigo1_poner_escena2:									; ELSE
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), FUEGO_SPRITE2A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), FUEGO_SPRITE2B
				RET
fin_calcula_fuego_escena:


;;=====================================================
;;CALCULA_FUEGO_INCREMENTOY
;;=====================================================	
;~ a: 15,15	b: 223,15
;~ c: 15,79	d: 223,79
calcula_fuego_incrementoxy:
.examino_sentido_derecha:
		BIT			 0, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		JP			 Z, .examino_sentido_abajo
		INC			(IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			RL			(IX + ESTRUCTURA_ENEMIGO.direccionx)
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), FUEGO_PASOSY
		RET		
.examino_sentido_abajo:
		BIT			 1, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		JP			 Z, .examino_sentido_izquierda
		INC			(IX + ESTRUCTURA_ENEMIGO.posy)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			RL			(IX + ESTRUCTURA_ENEMIGO.direccionx)
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), FUEGO_PASOSX
		RET
.examino_sentido_izquierda:
		BIT			 2, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		JP			 Z,.examino_sentido_arriba
		DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			RL			(IX + ESTRUCTURA_ENEMIGO.direccionx)
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), FUEGO_PASOSY
		RET
.examino_sentido_arriba:
		DEC			(IX + ESTRUCTURA_ENEMIGO.posy)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), FUEGO_PASOSX
		RET
fin_calcula_fuego_incrementoxy:
