;;=====================================================
;;CONTANTES JEFELOBO
;;=====================================================
datos_jefelobo:
			DB		TIPOJEFELOBO;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		JEFELOBO_X	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFELOBO_Y	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		00000001b	;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		JEFELOBO_LIM_PASOS1	;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefelobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFELOBO_SPRITE1A	;izq arriba
			DB		JEFELOBO_SPRITE2A	;der_arriba
			DB		JEFELOBO_SPRITE3A	;izq abajo
			DB		JEFELOBO_SPRITE4A	;der_abajo
			
			
;;=====================================================
;;SUBRUTINAS MANEJO DE JEFELOBO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFELOBO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del lobo en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefelobo:
		LD			HL, datos_jefelobo
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefelobo:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_LOBO
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_jefelobo_BR:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), 64
		
		;quitar cuando se cree el daño a los jefes
		LD			 (IX + ESTRUCTURA_ENEMIGO.pocavida), 1
fin_actualiza_valores_jefelobo_BR:
		RET

		
;;=====================================================
;;MOVER_JEFELOBO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefelobo: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefelobo:	
		CALL		calcula_jefelobo_posyx
		
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
		
		CALL		verifica_siguiente_posicion_jefelobo
		
		CALL		calcula_jefelobo_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A

		;colorea jefelobo
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
		LD			(IY + 3),  JEFELOBO_COLOR
		LD			(IY + 7),  JEFELOBO_COLOR
		LD			(IY + 11), JEFELOBO_COLOR
		LD			(IY + 15), JEFELOBO_COLOR
fin_mover_jefelobo:
		RET


;;=====================================================
;;CALCULA_JEFELOBO_ESCENA
;;=====================================================	
calcula_jefelobo_escena:
		LD			 A, (heartbeat_general)
		AND			JEFELOBO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del jefelobo
			XOR			 A
			LD			(heartbeat_general), A
			
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .direccion_derecha
.direccion_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_izquierda2
.escena_izquierda1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFELOBO_SPRITE1C
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFELOBO_SPRITE2C
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFELOBO_SPRITE3C
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFELOBO_SPRITE4C
				RET
.escena_izquierda2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFELOBO_SPRITE1D
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFELOBO_SPRITE2D
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFELOBO_SPRITE3D
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFELOBO_SPRITE4D
				RET
			
.direccion_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_derecha2
.escena_derecha1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFELOBO_SPRITE1A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFELOBO_SPRITE2A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFELOBO_SPRITE3A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFELOBO_SPRITE4A
				RET
.escena_derecha2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFELOBO_SPRITE1B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFELOBO_SPRITE2B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFELOBO_SPRITE3B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFELOBO_SPRITE4B
				RET
fin_calcula_jefelobo_escena:

;;=====================================================
;;CALCULA_JEFELOBO_POSYX
;;=====================================================	
calcula_jefelobo_posyx:
		LD			 B, (IX + ESTRUCTURA_ENEMIGO.direcciony)

.mira_posicion0:
		LD			 A, B
		AND			00000001b
		JR			 Z, .mira_posicion1
		INC			(IX + ESTRUCTURA_ENEMIGO.posx)
		RET
		
.mira_posicion1:
		LD			 A, B
		AND			00000010b
		JR			 Z, .mira_posicion2
		DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			(IX + ESTRUCTURA_ENEMIGO.posy)
		RET
		
.mira_posicion2:
		LD			 A, B
		AND			00000100b
		JR			 Z, .mira_posicion3
		DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
		RET
		
.mira_posicion3:
		LD			 A, B
		AND			00001000b
		JR			 Z, .resetea_posicion
		DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
		INC			(IX + ESTRUCTURA_ENEMIGO.posy)
		RET
		
.resetea_posicion:
		LD			(IX + ESTRUCTURA_ENEMIGO.direcciony), 00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 0
		LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFELOBO_LIM_PASOS1
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), JEFELOBO_X
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), JEFELOBO_Y
fin_calcula_jefelobo_posyx:
		RET


;;=====================================================
;;VERIFICA_SIGUIENTE_POSICION_JEFELOBO
;;=====================================================			
verifica_siguiente_posicion_jefelobo:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		OR			 A
		JP			 Z, .modifica_posicion_jefelobo
.no_modifica_posicion_fantasma:
			DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
			RET
.modifica_posicion_jefelobo:		
			;paso a la siguiente posición
			RLC			(IX + ESTRUCTURA_ENEMIGO.direcciony)
						
.mira_posicion1:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direcciony)
			AND			00000010b
			JR			 Z, .mira_posicion2
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 1
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFELOBO_LIM_PASOS2
			
			RET
.mira_posicion2:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direcciony)
			AND			00000100b
			JR			 Z, .mira_posicion3
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFELOBO_LIM_PASOS3
			
			RET
.mira_posicion3:
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFELOBO_LIM_PASOS4
fin_verifica_siguiente_posicion_jefelobo:
			RET


