;;=====================================================
;;CONTANTES FANTASMA
;;=====================================================
datos_fantasma:
			DB		TIPOFANTASMA				;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0							;(escena) sprite a mostrar 1/2
			DB		00000001b					;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		FANTASMA_ENERGIA			;(energia) energía del enemigo antes de morir
			DB		FANTASMA_X1					;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		FANTASMA_Y1					;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8							;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8							;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0							;(incx) incremento x para mover
			DB		0							;(inxy) incremento y para mover
			DB		1							;(direccionx) 00000001b / 00000010b / 00000100b / 00001000b (las 4 posiciones posibles)
			DB		0							;(direcciony) no se usa
			DB		FANTASMA_LIM_PASOS			;(pasos) TIEMPO QUE ESPERA PARA PASAR DE UNA ESCAA A OTRA
			DB		0							;(radio) radio para movimientos circulares
			DW		mover_fantasma				;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		FANTASMA_SPRITE1A			;izq arriba
			DB		FANTASMA_SPRITE2A			;der_arriba
			DB		FANTASMA_SPRITE1B			;izq abajo
			DB		FANTASMA_SPRITE2B			;der_abajo
			DB		FANTASMA_DANO 				;dano
			DW		check_colision_enemigo16x16		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)


;;=====================================================
;;SUBRUTINAS MANEJO DE FANTASMA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_FANTASMA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del fantasma en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_fantasma:
		LD			HL, datos_fantasma
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_fantasma:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_FANTASMA
;;=====================================================	
; función: 	inicializa valores aleatorios del fantasma
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_fantasma:
fin_actualiza_valores_fantasma:
		
		
;;=====================================================
;;MOVER_FANTASMA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el fantasma: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_fantasma:
		CALL		calcula_fantasma_posyx
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		verifica_siguiente_posicion_fantasma
		
		CALL		calcula_fantasma_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea fantasma
		LD			(IY + 3), FANTASMA_COLOR
		LD			(IY + 7), FANTASMA_COLOR
fin_mover_fantasma:
		RET


;;=====================================================
;;CALCULA_FANTASMA_ESCENA
;;=====================================================	
calcula_fantasma_escena:
		LD			 A, (heartbeat_fantasma)
		AND			FANTASMA_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del fantasma
			XOR			 A
			LD			(heartbeat_fantasma), A
			
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano
			
			;THEN cambia escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena2
.escena1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), FANTASMA_SPRITE1A
				RET
.escena2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), FANTASMA_SPRITE1B
				RET	
fin_calcula_fantasma_escena:


;;=====================================================
;;CALCULA_FANTASMA_POSYX
;;=====================================================	
calcula_fantasma_posyx:
		LD			 B, (IX + ESTRUCTURA_ENEMIGO.direccionx)

.mira_posicion0:
		LD			 A, B
		AND			00000001b
		JR			 Z, .mira_posicion1
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), FANTASMA_Y1
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), FANTASMA_X1
		RET
		
.mira_posicion1:
		LD			 A, B
		AND			00000010b
		JR			 Z, .mira_posicion2
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), FANTASMA_Y2
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), FANTASMA_X2
		RET
		
.mira_posicion2:
		LD			 A, B
		AND			00000100b
		JR			 Z, .mira_posicion3
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), FANTASMA_Y3
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), FANTASMA_X3
		RET
		
.mira_posicion3:
		LD			 A, B
		AND			00001000b
		JR			 Z, .resetea_posicion
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), FANTASMA_Y4
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), FANTASMA_X4
		RET
.resetea_posicion:
		LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 00000001b
fin_calcula_fantasma_posyx:
		RET


;;=====================================================
;;VERIFICA_SIGUIENTE_POSICION_FANTASMA
;;=====================================================			
verifica_siguiente_posicion_fantasma:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		
		OR			 A
		JP			 Z, .modifica_posicion_fantasma
.no_modifica_posicion_fantasma:
			DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
			RET
.modifica_posicion_fantasma:
			;reseteo pasos
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), FANTASMA_LIM_PASOS
			;paso a la siguiente posición
			RLC			(IX + ESTRUCTURA_ENEMIGO.direccionx)
fin_verifica_siguiente_posicion_fantasma:
			RET
