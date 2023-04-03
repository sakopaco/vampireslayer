;;=====================================================
;;COSNTANTES CABALLERO
;;=====================================================		
datos_caballero:
			DB		TIPOCABALLEROGRIS			;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0							;(escena) sprite a mostrar 1/2
			DB		00010000b					;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		CABALLERO_ENERGIA			;(energia) energía del enemigo antes de morir
			DB		CABALLERO_POSXINI			;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		CABALLERO_POSYINI			;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		CABALLERO_RADIOX			;(radiox) radio x del enemigo para cuando se dispare encima
			DB		CABALLERO_RADIOY			;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0							;(incx) incremento x para mover
			DB		0							;(inxy) incremento y para mover
			DB		DIRIZQUIERDA				;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0							;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		CABALLERO_PASOS				;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0							;(radio) radio para movimientos circulares
			DW		mover_caballero				;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		CABALLERO_SPRITE1A			;izq arriba
			DB		CABALLERO_SPRITE2A			;der_arriba
			DB		CABALLERO_SPRITE3A			;izq abajo
			DB		CABALLERO_SPRITE4A			;der_abajo
			DB		CABALLERO_DANO 				;dano
			DW		check_colision_enemigo16x32	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)


;;=====================================================
;;SUBRUTINAS MANEJO DE CABALLERO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_CABALLERO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del caballero gris en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_caballero:
		LD			HL, datos_caballero
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_caballero:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_CABALLERO
;;=====================================================	
; función: 	inicializa valores aleatorios del caballero gris
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_caballero:
fin_actualiza_valores_caballero:

		
;;=====================================================
;;MOVER_CABALLERO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el caballero gris: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_caballero:
		;CALL		calcula_caballero_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		ADD			16
		LD			(IY + 4), A
		
		CALL		calcula_caballero_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		
		CALL		calcula_caballero_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea caballero
		LD			(IY + 3), CABALLERO_COLOR
		LD			(IY + 7), CABALLERO_COLOR
fin_mover_caballero:
		RET


;;=====================================================
;;CALCULA_CABALLERO_ESCENA
;;=====================================================	
calcula_caballero_escena:
		LD			 A, (heartbeat_caballero)
		AND			CABALLERO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del caballero
			XOR			 A
			LD			(heartbeat_caballero), A
			
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano

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
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), CABALLERO_SPRITE1B
			RET
.escena_izquierda2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), CABALLERO_SPRITE3B
			RET

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), CABALLERO_SPRITE1A
			RET
.escena_derecha2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), CABALLERO_SPRITE3A
			RET
fin_calcula_caballero_escena:


;;=====================================================
;;CALCULA_CABALLERO_INCREMENTOY
;;=====================================================	
calcula_caballero_incrementoy:
fin_calcula_caballero_incrementoy:


;;=====================================================
;;CALCULA_CABALLERO_INCREMENTOX
;;====================================================	
calcula_caballero_incrementox:
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
				LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
				XOR			00000001b
				LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
				;resetea pasos
				LD			(IX + ESTRUCTURA_ENEMIGO.pasos), CABALLERO_PASOS
fin_calcula_caballero_incrementox:
		RET
