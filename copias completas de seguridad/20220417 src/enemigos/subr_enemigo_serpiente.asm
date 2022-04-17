;;=====================================================
;;SUBRUTINAS MANEJO DE SERPIENTE
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_SERPIENTE
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la serpiente en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_serpiente:
		LD			HL, datos_serpiente
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_serpiente:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_SERPIENTE
;;=====================================================	
; función: 	inicializa valores aleatorios de la serpiente
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_serpiente:
		EXX
.calcula_posicion:
.asigna_valores_posicion_x:		
		;calcula posición inicial sumando a su líete izq un offset
		LD			 A, R
		AND			00011111b
		LD			 B, A ; dejo un copia en B del valor de A 
		LD			 A, SERPIENTE_LIMIZQ
		ADD			 B
		
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), SERPIENTE_POSY

		EXX
fin_actualiza_valores_serpiente:
		RET
		
		
;;=====================================================
;;MOVER_SERPIENTE
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la serpiente: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_serpiente:
		;la parte y no se modifica
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		CALL		calcula_serpiente_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		
		CALL		calcula_serpiente_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A		
		
		LD			(IY + 3), SERPIENTE_COLOR
fin_mover_serpiente:
		RET


;;=====================================================
;;CALCULA_SERPIENTE_ESCENA
;;=====================================================	
calcula_serpiente_escena:
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
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE1B
			RET
.escena_izquierda2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE2B
			RET
			
.direccion_derecha:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE1A
			RET
.escena_derecha2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), SERPIENTE_SPRITE2A
			RET
fin_calcula_serpiente_escena:


;;=====================================================
;;CALCULA_SERPIENTE_INCREMENTOY
;;=====================================================	
		

;;=====================================================
;;CALCULA_SERPIENTE_INCREMENTOX
;;=====================================================	
calcula_serpiente_incrementox:
;SI DIRECCION = DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .serpiente_derecha
.serpiente_izquierda:
		;DECREMENTA X => SERPIENTE IZQUIERDA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI X = SERPIENTE_LIMIZQ 
		CP			SERPIENTE_LIMIZQ
		RET			NZ
		;DIRECCION = DERECHA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRDERECHA
		;FIN SI
		RET
;SINO
.serpiente_derecha:
		;INCREMENTA X => serpiete DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		;SI Y = SERPIENTE_LIMDER
		CP			SERPIENTE_LIMDER
		RET			NZ
		;DIRECCION = IZQUIERDA
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRIZQUIERDA
	;FIN SI
;FIN SI
fin_calcula_serpiente_incrementox:
		RET
