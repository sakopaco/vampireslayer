;;=====================================================
;;CONTANTES MURCIELAGO
;;=====================================================
datos_murcielago:
			DB		TIPOMURCIELAGO		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0					;(escena) sprite a mostrar 1/2
			DB		00010000b			;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		MUERCIELAGO_ENERGIA	;(energia) energía del enemigo antes de morir
			DB		16					;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MURCIELAGO_HORIZON	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8					;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8					;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0					;(incx) incremento x para mover
			DB		0					;(inxy) incremento y para mover
			DB		DIRDERECHA			;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0					;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MURCIELAGO_PASOS	;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0					;(radio) radio para movimientos circulares
			DW		mover_murcielago	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MURCIELAGO_SPRITE1A	;izq arriba
			DB		MURCIELAGO_SPRITE1B	;izq abajo
			DB		MURCIELAGO_SPRITE1A	;der_arriba
			DB		MURCIELAGO_SPRITE1B	;der_abajo
			DB		MURCIELAGO_DANO 	;dano


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
; salida: 	-
; toca:		-
actualiza_valores_murcielago:
fin_actualiza_valores_murcielago:
		
		
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
		
		;colorea murcielago
		LD			(IY + 3), MURCIELAGO_COLOR
fin_mover_murcielago:
		RET


;;=====================================================
;;CALCULA_MURCIÉLAGO_ESCENA
;;=====================================================	
calcula_murcielago_escena:
		LD			 A, (heartbeat_murcielago)
		AND			MURCIELAGO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del murcielago
			XOR			 A
			LD			(heartbeat_murcielago), A
			
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano
		
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, MURCIELAGO_SPRITE1A
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, MURCIELAGO_SPRITE1B
.fin_enemigo1_poner_escena2:								; END IF
;.fin_cambia_escena_enemigo1:							; END IF	
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_murcielago_escena:
		RET


;;=====================================================
;;CALCULA_MURCIELAGO_INCREMENTOY
;;=====================================================	
calcula_murcielago_incrementoy:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		AND			00100000b
		JP			NZ, .baja
.sube:
		DEC			(IX + ESTRUCTURA_ENEMIGO.posy)
		RET
.baja:
		INC			(IX + ESTRUCTURA_ENEMIGO.posy)
		RET
fin_calcula_murcielago_incrementoy:

		

;;=====================================================
;;CALCULA_MURCIELAGO_INCREMENTOx
;;=====================================================	
calcula_murcielago_incrementox:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .mueve_derecha
.mueve_izquierda:
			DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
			JP			.fin_mueve
.mueve_derecha:
			INC			(IX + ESTRUCTURA_ENEMIGO.posx)
.fin_mueve:

		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		OR			 A
		RET			NZ
			;cambia sentido
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			XOR			 00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), MURCIELAGO_PASOS
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), MURCIELAGO_HORIZON
fin_calcula_murcielago_incrementox:
		RET
