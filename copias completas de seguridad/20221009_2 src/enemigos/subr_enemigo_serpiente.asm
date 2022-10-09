;;=====================================================
;;CONTANTES SERPIENTE
;;=====================================================
posiciones_serpiente_y:	;16 posisiones iniciales posibles
			DB			80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,125
			
datos_serpiente:
			DB		TIPOSERPIENTE		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0					;(escena) sprite a mostrar 1/2
			DB		00010000b			;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		SERPIENTE_ENERGIA	;(energia) energía del enemigo antes de morir
			DB		SERPIENTE_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		SERPIENTE_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8					;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8					;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0					;(incx) incremento x para mover
			DB		0					;(inxy) incremento y para mover
			DB		DIRDERECHA			;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0					;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		SERPIENTE_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0					;(radio) radio para movimientos circulares
			DW		mover_serpiente		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		SERPIENTE_SPRITE1A	;izq arriba
			DB		SERPIENTE_SPRITE2A	;izq abajo
			DB		SERPIENTE_SPRITE1B	;der_arriba
			DB		SERPIENTE_SPRITE2B	;der_abajo
			DB		SERPIENTE_DANO 		;dano
			
						
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
fin_actualiza_valores_serpiente:
		
		
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
		
		;colorea serpiente
		LD			(IY + 3), SERPIENTE_COLOR
fin_mover_serpiente:
		RET


;;=====================================================
;;CALCULA_SERPIENTE_ESCENA
;;=====================================================	
calcula_serpiente_escena:
		LD			 A, (heartbeat_serpiente)
		AND			SERPIENTE_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			
			;reseteo el cambio de escena de la serpiente
			XOR			 A
			LD			(heartbeat_serpiente), A
			
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
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			NZ, .sentido_izquierda
.sentido_derecha:
		INC			(IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRIZQUIERDA
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), SERPIENTE_PASOS
		RET	
.sentido_izquierda:
		DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), DIRDERECHA
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), SERPIENTE_PASOS
		RET	
fin_calcula_serpiente_incrementox:
