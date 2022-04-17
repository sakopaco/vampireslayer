;;=====================================================
;;SUBRUTINAS MANEJO DE MURCIÉLAGO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MURCIELAGO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del murciélago en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_murcielago:
		LD			HL, datos_murcielago
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_murcielago:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_MURCUELAGO
;;=====================================================	
; función: 	inicializa valores aleatorios del murciélago
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_murcielago:
		EXX
;actualiza_valores_aleatorios_serpiente
.calcula_posicion:
		EXX
		
.asigna_valores_posicion_x:
		LD			 A, R
		AND			01111111b
		ADD			MURCIELAGO_LIMIZQ
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), MURCIELAGO_HORIZON
		
		EXX
fin_actualiza_valores_murcielago:
		RET
		
		
;;=====================================================
;;MOVER_MURCIELAGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el muerciélago: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_murcielago:
		CALL		calcula_murcielago_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		CALL		calcula_murcielago_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		CALL		calcula_murcielago_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		
		LD			(IY + 3), MURCIELAGO_COLOR
fin_mover_murcielago:
		RET


;;=====================================================
;;CALCULA_MURCIÉLAGO_ESCENA
;;=====================================================	
calcula_murcielago_escena:
		LD			 A, (heartbeat)
		OR			00000001b
		JP			 Z, .fin_cambia_escena_enemigo1   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, MURCIELAGO_SPRITE1A
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, MURCIELAGO_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF	
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_murcielago_escena:
		RET


;;=====================================================
;;CALCULA_ARANA_INCREMENTOY
;;=====================================================	
calcula_murcielago_incrementoy:
		LD			HL, variacion_murcielagoy
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		AND			00011111b
		CALL		suma_A_HL
		
		LD			 B, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			 A, (HL)
		ADD			 B
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
fin_calcula_murcielago_incrementoy:
		RET
		

;;=====================================================
;;CALCULA_ARANA_INCREMENTOx
;;=====================================================	
calcula_murcielago_incrementox:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .mueve_derecha
.mueve_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
			DEC			 A
			JP			.fin_mueve
.mueve_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
			INC			 A
.fin_mueve:		
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

		CP			MURCIELAGO_LIMIZQ
		JP			NZ, .no_gira_derecha
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRDERECHA

.no_gira_derecha:
		CP			MURCIELAGO_LIMDER
		JP			NZ, .no_gira_izquierda
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRIZQUIERDA
.no_gira_izquierda:
fin_calcula_murcielago_incrementox:
		RET
