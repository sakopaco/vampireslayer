;;=====================================================
;;CONTANTES ARANA
;;=====================================================
posiciones_arana_x: 		;16 posisiones iniciales posibles
			DB		0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240

datos_arana:
			DB		TIPOARANA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b	;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		LIMITEPANTALLASUP	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		DIRABAJO	;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_arana	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE ARANA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_ARANA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la araña en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_arana:
		LD			HL, datos_arana
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_arana:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_ARANA
;;=====================================================	
; función: 	inicializa valores aleatorios de la araña
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_arana:
;actualiza_valores_aleatorios_arana
.calcula_posicion:
		;calcula posición de 0 a 16
		LD			 A, R
		AND			00001111b
		LD			 B, A ; dejo un copia en B del valor de A 
		
.asigna_valores_posicion_x:
		LD			HL, posiciones_arana_x
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
fin_actualiza_valores_arana:
		RET
		
		
;;=====================================================
;;MOVER_ARANA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la arana: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_arana:
		CALL		calcula_arana_incrementoy		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		
		CALL		calcula_arana_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A		
		
		;colorea araña
		LD			(IY + 3), ARANA_COLOR
fin_mover_arana:
		RET


;;=====================================================
;;CALCULA_ARANA_ESCENA
;;=====================================================	
calcula_arana_escena:
		LD			 A, (heartbeat_arana)
		AND			ARANA_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena de la araña
			XOR			 A
			LD			(heartbeat_arana), A
		
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, ARANA_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, ARANA_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
;.fin_cambia_escena_enemigo1:							; END IF			
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_arana_escena:
		RET


;;=====================================================
;;CALCULA_ARANA_INCREMENTOY
;;=====================================================	
calcula_arana_incrementoy:
		;SI DIRECCION = ABAJO
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direcciony)
		OR			 A
		JP			 Z, .arana_baja
.arana_sube:
		;DECREMENTA Y => ARANA SUBE
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;SI Y = LIMITE SUPERIOR = 0 = LIMITEPANTALLASUP
		OR			 A
		RET			NZ
		;DIRECCION = ABAJO
			LD			(IX + ESTRUCTURA_ENEMIGO.direcciony), DIRABAJO
		;FIN SI
		RET
;SINO
.arana_baja:
		;INCREMENTA Y => ARANA BAJA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;SI Y = LIMITE INFERIOR
		OR			 A
		CP			LIMITEPANTALLAINF
		RET			NZ
		;DIRECCION = ARRIBA
			LD			(IX + ESTRUCTURA_ENEMIGO.direcciony), DIRARRIBA
	;FIN SI
;FIN SI
fin_calcula_arana_incrementoy:
		RET
		
