;;=====================================================
;;SUBRUTINAS MANEJO DE LOBO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_LOBO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del lobo en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_lobo:
		LD			HL, datos_lobo
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_lobo:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_LOBO
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_lobo:
		EXX
.calcula_posicion:
.asigna_valores_posicion_x:		
		;calcula posición inicial sumando a su líete izq un offset
		LD			 A, R
		AND			00111111b
		ADD			LOBO_LIMIZQ
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), LOBO_POSY

		EXX
fin_actualiza_valores_lobo:
		RET
		
		
;;=====================================================
;;MOVER_LOBO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la serpiente: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_lobo:
		;no se mueve en el eje y
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		CALL		calcula_lobo_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		calcula_lobo_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		LD			 A, LOBO_COLOR
		LD			(IY + 3), A
		LD			(IY + 7), A
fin_mover_lobo:
		RET


;;=====================================================
;;CALCULA_LOBO_ESCENA
;;=====================================================	
calcula_lobo_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z
			
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
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE1B
				RET
.escena_izquierda2:
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE3B
				RET
			
.direccion_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_derecha2
.escena_derecha1:
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE1A
				RET
.escena_derecha2:
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), LOBO_SPRITE3A
				RET
fin_calcula_lobo_escena:
		RET


;;=====================================================
;;CALCULA_SERPIENTE_INCREMENTOY
;;=====================================================	
		

;;=====================================================
;;CALCULA_LOBO_INCREMENTOX
;;=====================================================	
calcula_lobo_incrementox:
;SI DIRECCION = DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .lobo_derecha
.lobo_izquierda:
		;DECREMENTA X => LOBO IZQUIERDA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI X = LOBO_LIMIZQ 
		CP			LOBO_LIMIZQ
			RET			NZ
		;DIRECCION = DERECHA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRDERECHA
		;FIN SI
		RET
;SINO
.lobo_derecha:
		;INCREMENTA X => LOBO DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI Y = SERPIENTE_LIMDER
		CP			LOBO_LIMDER
			RET			NZ
		;DIRECCION = LOBO
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRIZQUIERDA
	;FIN SI
;FIN SI
fin_calcula_lobo_incrementox:
		RET
