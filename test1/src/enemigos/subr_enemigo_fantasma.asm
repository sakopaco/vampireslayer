;;=====================================================
;;CONTANTES FANTASMA
;;=====================================================
datos_fantasma:
			DB		TIPOFANTASMA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;00000000b / 00000001b / 00000010b / 00000100b
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		FANTASMA_LIM_PASOS	;(pasos) TIEMPO QUE ESPERA PARA PASAR DE UNA ESCAA A OTRA
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_fantasma	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		FANTASMA_SPRITE1A;izq arriba
			DB		FANTASMA_SPRITE2A;der_arriba
			DB		FANTASMA_SPRITE1B;izq abajo
			DB		FANTASMA_SPRITE2B;der_abajo
			

posiciones_fantasmax:
			DB		80,94,24,200
posiciones_fantasmay:
			DB		32,32,64,64


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
; salida: 	posicion_anterior_fantasma
; toca:		-
actualiza_valores_fantasma:
.asigna_valores_posicion_x:	
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), FANTASMA_INIX
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), FANTASMA_INIY
fin_actualiza_valores_fantasma:
		RET
		
		
;;=====================================================
;;MOVER_FANTASMA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el fantasma: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_fantasma:
		;~ ;CALL		calcula_fantasma_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		;~ CALL		calcula_fantasma_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		calcula_fantasma_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		LD			 A, 1
		LD			(IY + 3), A
		LD			(IY + 7), A
fin_mover_fantasma:
		RET


;;=====================================================
;;CALCULA_FANTASMA_ESCENA
;;=====================================================	
calcula_fantasma_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z
		
.direccion_izquierda:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena2
.escena1:
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), FANTASMA_SPRITE1A
				;LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_b), FANTASMA_SPRITE2A
				RET
.escena2:
				LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), FANTASMA_SPRITE1B
				;LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_b), FANTASMA_SPRITE2B
				RET		
fin_calcula_fantasma_escena:


;;=====================================================
;;CALCULA_LOBO_INCREMENTOY
;;=====================================================	
		

;;=====================================================
;;CALCULA_LOBO_INCREMENTOX
;;=====================================================	
calcula_fantasma_incrementox:
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
		
		;SI Y = LOBO_LIMDER
		CP			LOBO_LIMDER
			RET			NZ
		;DIRECCION = LOBO
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRIZQUIERDA
	;FIN SI
;FIN SI
fin_calcula_fantasa_incrementox:
		RET
		
