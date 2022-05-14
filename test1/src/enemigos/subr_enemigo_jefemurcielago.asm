;;=====================================================
;;CONTANTES JEFEMURCIELAGO
;;=====================================================
datos_jefemurcielago:
			DB		TIPOJEFEMURCIELAGO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRABAJO;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_jefemurcielago	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFEMURCIELAGO_SPRITE1A	;izq arriba
			DB		JEFEMURCIELAGO_SPRITE2A	;der_arriba
			DB		JEFEMURCIELAGO_SPRITE3A	;izq abajo
			DB		JEFEMURCIELAGO_SPRITE4A	;der_abajo
			
;ARRAY POSICIONES Y MURCIELAGO
;*******************************************************************************************







			
;;=====================================================
;;SUBRUTINAS MANEJO DE JEFEMURCIELAGO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFEMURCIELAGO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del lobo en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefemurcielago:
		LD			HL, datos_jefemurcielago
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefemurcielago:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_JEFEMURCIELAGO
;;=====================================================	
; función: 	inicializa valores aleatorios del zombi
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_jefemurcielago:
;~ .asigna_valores_posicion_x:
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.posx), ZOMBI_POSX
		
;~ .asigna_valores_posicion_y:
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.posy), ZOMBI_POSY
fin_actualiza_valores_jefemurcielago:
		RET
		
		
;;=====================================================
;;MOVER_JEFEMURCIELAGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefelobo: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefemurcielago:
		CALL		calcula_jefemurcielago_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		CALL		calcula_jefemurcielago_incrementox		;se reutiliza calcula_lobo_incrementox que valdría como calcula_jefelobo_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
		CALL		calcula_jefemurcielago_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A

		LD			 A, JEFEMURCIELAGO_COLOR
		LD			(IY + 3), A
		LD			(IY + 7), A
		LD			(IY + 11), A
		LD			(IY + 15), A
fin_mover_jefemurcielaro:
		RET


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_ESCENA
;;=====================================================	
calcula_jefemurcielago_escena:
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
fin_calcula_jefemurcielago_escena:


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_INCREMENTOY
;;=====================================================	
calcula_jefemurcielago_incrementoy:
			;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			;~ OR			 A
			;~ RET			 Z
			
			;~ LD			 B, (IX + ESTRUCTURA_ENEMIGO.posx)
			
;~ .examina_mov_izquierda_sube:
			;~ LD			 A, 168
			;~ CP			 B
			;~ JP			NC, .examina_mov_izquierda_baja
			;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			;~ SUB			 1
			;~ LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			;~ RET
			
;~ .examina_mov_izquierda_baja:
			;~ LD			 A, 56
			;~ CP			 B
			;~ RET			 C

			;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			;~ ADD			 1
			;~ LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			;~ RET
fin_calcula_jefemurcielago_incrementoy:


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_INCREMENTOX
;;=====================================================	
calcula_jefemurcielago_incrementox:
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		;~ OR			 A
		;~ JP			NZ, .camina_izquierda
;~ .camina_derecha:
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
;~ [2]		INC			 A
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.posx), A	
;~ .verifica_limite_derecha:
		;~ CP			ZOMBI_LIMX_DER
		;~ RET			NZ
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		;~ XOR			00000001b
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
		;~ RET
;~ .camina_izquierda:
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		;~ DEC			 A
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.posx), A	
;~ .verifica_limite_izquierda:
		;~ CP			ZOMBI_LIMX_IZQ
		;~ RET			NZ
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		;~ XOR			00000001b
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
		;~ RET
fin_calcula_jefemurcielago_incrementox:

