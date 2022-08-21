;;=====================================================
;;CONTANTES JEFEFANTASMA
;;=====================================================
datos_jefefantasma:
			DB		TIPOJEFEFANTASMA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00000001b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		JEFEFANTASMA_X1	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFEFANTASMA_Y1	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		1		;(direccionx) 00000001b / 00000010b / 00000100b / 00001000b (las 4 posiciones posibles)
			DB		0		;(direcciony) no se usa
			DB		JEFEFANTASMA_LIM_PASOS	;(pasos) TIEMPO QUE ESPERA PARA PASAR DE UNA ESCAA A OTRA
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefefantasma	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFEFANTASMA_SPRITE1A;izq arriba
			DB		JEFEFANTASMA_SPRITE2A;der_arriba
			DB		JEFEFANTASMA_SPRITE3A;izq abajo
			DB		JEFEFANTASMA_SPRITE4A;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE JEFEFANTASMA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFEFANTASMA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del jefefantasma en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefefantasma:
		LD			HL, datos_jefefantasma
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefefantasma:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_JEFEFANTASMA
;;=====================================================	
; función: 	inicializa valores aleatorios del jefefantasma
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_jefefantasma_BR:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), 64
		
		;quitar cuando se cree el daño a los jefes
		LD			 (IX + ESTRUCTURA_ENEMIGO.pocavida), 1
fin_actualiza_valores_jefefantasma_BR:
		RET
		
		
;;=====================================================
;;MOVER_JEFEFANTASMA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefefantasma: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefefantasma:
		CALL		calcula_jefefantasma_posyx
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
		CALL		verifica_siguiente_posicion_jefefantasma
		
		CALL		calcula_jefefantasma_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A
		
		;color jefefantasma
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pocavida)
		OR			 A
		JP			 Z, .nointercambiacolor
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			OR			 A
			JP			 Z, .nointercambiacolor	
				LD			(IY + 3),  COLROJO
				LD			(IY + 7),  COLROJO
				LD			(IY + 11), COLROJO
				LD			(IY + 15), COLROJO
				RET
.nointercambiacolor:
		LD			(IY + 3),  JEFEFANTASMA_COLOR
		LD			(IY + 7),  JEFEFANTASMA_COLOR
		LD			(IY + 11), JEFEFANTASMA_COLOR
		LD			(IY + 15), JEFEFANTASMA_COLOR
fin_mover_jefefantasma:
		RET


;;=====================================================
;;CALCULA_JEFEFANTASMA_ESCENA
;;=====================================================	
calcula_jefefantasma_escena:
		LD			 A, (heartbeat_jefefantasma)
		AND			JEFEFANTASMA_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del jefefantasma
			XOR			 A
			LD			(heartbeat_jefefantasma), A
			
			;THEN cambia escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena2
.escena1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEFANTASMA_SPRITE1A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEFANTASMA_SPRITE2A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEFANTASMA_SPRITE3A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEFANTASMA_SPRITE4A
				RET
.escena2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEFANTASMA_SPRITE1B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEFANTASMA_SPRITE2B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEFANTASMA_SPRITE3B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEFANTASMA_SPRITE4B
				RET		
fin_calcula_jefefantasma_escena:


;;=====================================================
;;CALCULA_JEFEFANTASMA_POSYX
;;=====================================================	
calcula_jefefantasma_posyx:
		LD			 B, (IX + ESTRUCTURA_ENEMIGO.direccionx)

.mira_posicion0:
		LD			 A, B
		AND			00000001b
		JR			 Z, .mira_posicion1
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y1
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X1
		RET
		
.mira_posicion1:
		LD			 A, B
		AND			00000010b
		JR			 Z, .mira_posicion2
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y2
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X2
		RET
		
.mira_posicion2:
		LD			 A, B
		AND			00000100b
		JR			 Z, .mira_posicion3
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y3
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X3
		RET
		
.mira_posicion3:
		LD			 A, B
		AND			00001000b
		JR			 Z, .mira_posicion4
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y4
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X4
		RET
.mira_posicion4:
		LD			 A, B
		AND			00010000b
		JR			 Z, .mira_posicion5
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y5
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X5
		RET
.mira_posicion5:
		LD			 A, B
		AND			00100000b
		JR			 Z, .mira_posicion6
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y6
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X6
		RET
.mira_posicion6:
		LD			 A, B
		AND			01000000b
		JR			 Z, .mira_posicion7
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y7
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X7
		RET
.mira_posicion7:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFEFANTASMA_Y8
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFEFANTASMA_X8
		RET
fin_calcula_jefefantasma_posyx:


;;=====================================================
;;VERIFICA_SIGUIENTE_POSICION_JEFEFANTASMA
;;=====================================================			
verifica_siguiente_posicion_jefefantasma:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		
		OR			 A
		JP			 Z, .modifica_posicion_jefefantasma
.no_modifica_posicion_jefefantasma:
			DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
			RET
.modifica_posicion_jefefantasma:
			;reseteo pasos
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFEFANTASMA_LIM_PASOS
			;paso a la siguiente posición
			RLC			(IX + ESTRUCTURA_ENEMIGO.direccionx)
fin_verifica_siguiente_posicion_jefefantasma:
			RET
