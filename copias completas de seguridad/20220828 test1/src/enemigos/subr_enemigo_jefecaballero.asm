;;=====================================================
;;COSNTANTES JEFECABALLERO
;;=====================================================		
datos_jefecaballero:
			DB		TIPOJEFECABALLERO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b	;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		JCABALLERO_POSXINI	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JCABALLERO_POSYINI	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRIZQUIERDA	;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		JCABALLERO_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefecaballero	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JCABALLERO_SPRITE1A	;izq arriba
			DB		JCABALLERO_SPRITE2A	;der_arriba
			DB		JCABALLERO_SPRITE3A	;izq abajo
			DB		JCABALLERO_SPRITE4A	;der_abajo

array_jefecaballero_posicionesy:
			DB		0,14,28,42,56,69,82,96

;;=====================================================
;;SUBRUTINAS MANEJO DE JEFECABALLERO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFECABALLERO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del jefecaballero en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefecaballero:
		LD			HL, datos_jefecaballero
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefecaballero:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_JEFECABALLERO
;;=====================================================	
; función: 	inicializa valores aleatorios del jefecaballero
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_jefecaballero:
		;calcula posición y del array 0 a 7
		LD			 A, R
		AND			00000111b
		;calcula la posición y
		LD			HL, array_jefecaballero_posicionesy
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;calcula dirección 0-derecha / 1-izquierda
		LD			 A, R
		AND			00000010b
		LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
		JP			NZ, .direccion_izquierda
		;empieza en la izquierda
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), 16
		JP			.fin_direccion
		;direccion_derecha
.direccion_izquierda:
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), 220
.fin_direccion:	

		;resetea pasos del movimiento
		LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JCABALLERO_PASOS
		
		
;-------------------------------------		
		;quitar cuando se cree el daño a los jefes
		LD			 (IX + ESTRUCTURA_ENEMIGO.pocavida), 1

		
		LD			 A, (prota_nivel)
		BIT			 1, A
		RET			 Z
		LD			 (IX + ESTRUCTURA_ENEMIGO.energia), 64
		
fin_actualiza_valores_jefecaballero:
		RET

		
;;=====================================================
;;MOVER_JEFECABALLERO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefecaballero: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefecaballero:
		;CALL		calcula_jefecaballero_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		CALL		calcula_jefecaballero_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
		CALL		calcula_jefecaballero_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A
		
		;colorea jefecaballero
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
		LD			(IY + 3),  JCABALLERO_COLOR
		LD			(IY + 7),  JCABALLERO_COLOR
		LD			(IY + 11), JCABALLERO_COLOR
		LD			(IY + 15), JCABALLERO_COLOR
fin_mover_jefecaballero:
		RET


;;=====================================================
;;CALCULA_JEFECABALLERO_ESCENA
;;=====================================================	
calcula_jefecaballero_escena:
		LD			 A, (heartbeat_general)
		AND			JCABALLERO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del jefecaballero
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
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JCABALLERO_SPRITE1C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JCABALLERO_SPRITE2C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JCABALLERO_SPRITE3C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JCABALLERO_SPRITE4C
			RET
.escena_izquierda2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JCABALLERO_SPRITE1D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JCABALLERO_SPRITE2D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JCABALLERO_SPRITE3D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JCABALLERO_SPRITE4D
			RET

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JCABALLERO_SPRITE1A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JCABALLERO_SPRITE2A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JCABALLERO_SPRITE3A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JCABALLERO_SPRITE4A
			RET
.escena_derecha2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JCABALLERO_SPRITE1B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JCABALLERO_SPRITE2B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JCABALLERO_SPRITE3B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JCABALLERO_SPRITE4B
			RET
fin_calcula_jefecaballero_escena:


;;=====================================================
;;CALCULA_JEFECABALLERO_INCREMENTOY
;;=====================================================	
calcula_jefecaballero_incrementoy:
fin_calcula_jefecaballero_incrementoy:


;;=====================================================
;;CALCULA_JEFECABALLERO_INCREMENTOX
;;====================================================	
calcula_jefecaballero_incrementox:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			OR			 A
			JP			 Z, .mueve_derecha
.mueve_izquierda:
				DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
				JP			.fin_mueve_posx
.mueve_derecha:
				INC			(IX + ESTRUCTURA_ENEMIGO.posx)
.fin_mueve_posx:

			DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
			RET			NZ
			
			;cambio dirección
			JP			actualiza_valores_jefecaballero
fin_calcula_jefecaballero_incrementox:
