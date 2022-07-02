;;=====================================================
;;CONTANTES JEFELOBO
;;=====================================================
datos_jefelobo:
			DB		TIPOJEFELOBO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		JEFELOBO_LIMIZQ1;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFELOBO_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
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

; se utilizar la misma subrutina que la del lobo: actualiza_valores_lobo
		
		
;;=====================================================
;;MOVER_JEFELOBO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefelobo: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefelobo:	


;;;; copiar movimiento tipo fantasma para jefe lobo


		CALL		calcula_jefelobo_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		CALL		calcula_lobo_incrementox		;se reutiliza calcula_lobo_incrementox que valdría como calcula_jefelobo_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
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
;;CALCULA_JEFELOBO_INCREMENTOY
;;=====================================================	
calcula_jefelobo_incrementoy:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			OR			 A
			RET			 Z
			
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.posx)
			
.examina_mov_izquierda_sube:
			LD			 A, 168
			CP			 B
			JP			NC, .examina_mov_izquierda_baja
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			SUB			 1
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			RET
			
.examina_mov_izquierda_baja:
			LD			 A, 56
			CP			 B
			RET			 C

			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			ADD			 1
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			RET
fin_calcula_jefelobo_incrementoy:


;;=====================================================
;;CALCULA_LOBO_INCREMENTOX
;;=====================================================	
;se utiliza la misma subrutina de incremento de x que la del lobo normal: calcula_lobo_incrementox

