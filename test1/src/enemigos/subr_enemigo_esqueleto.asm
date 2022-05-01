;;=====================================================
;;CONTANTES ESQUELETO
;;=====================================================
datos_esqueleto:
			DB		TIPOESQUELETO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		ESQUELETO_LIMIZQ;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		ESQUELETO_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_esqueleto		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		ESQUELETO_SPRITE1A	;izq arriba
			DB		ESQUELETO_SPRITE2A	;der_arriba
			DB		ESQUELETO_SPRITE3A	;izq abajo
			DB		ESQUELETO_SPRITE4A	;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE ESQUELETO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_ESQUELETO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del lobo en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_esqueleto:
		LD			HL, datos_esqueleto
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_esqueleto:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_ESQUELETO 
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_esqueleto:
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
fin_actualiza_valores_esqueleto:
		RET
		
		
;;=====================================================
;;MOVER_ESQUELETO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la serpiente: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_esqueleto:
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
fin_mover_esqueleto:
		RET


;;=====================================================
;;CALCULA_LOBO_ESCENA
;;=====================================================	
calcula_esqueleto_escena:
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
fin_calcula_esqueleto_escena:
		RET


;;=====================================================
;;CALCULA_ESQUELETO_INCREMENTOY
;;=====================================================	
		

;;=====================================================
;;CALCULA_ESQUELETO_INCREMENTOX
;;=====================================================	
calcula_esqueleto_incrementox:
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
fin_calcula_esqueleto_incrementox:
		RET
