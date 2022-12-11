;;=====================================================
;;COSNTANTES ZOMBI
;;=====================================================		
datos_zombi:
			DB		TIPOZOMBI		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0				;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		ZOMBI_ENERGIA	;(energia) energía del enemigo antes de morir
			DB		ZOMBI_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		ZOMBI_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8				;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8				;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0				;(incx) incremento x para mover
			DB		0				;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0				;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		ZOMBI_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0				;(radio) radio para movimientos circulares
			DW		mover_zombi		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		ZOMBI_SPRITE1A	;izq arriba
			DB		ZOMBI_SPRITE2A	;der_arriba
			DB		ZOMBI_SPRITE3A	;izq abajo
			DB		ZOMBI_SPRITE4A	;der_abajo
			DB		ZOMBI_DANO 		;dano


;;=====================================================
;;SUBRUTINAS MANEJO DE ZOMBI
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_ZOMBI
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del zombi en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_zombi:
		LD			HL, datos_zombi
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_zombi:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_ZOMBI 
;;=====================================================	
; función: 	inicializa valores aleatorios del zombi
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_zombi:
fin_actualiza_valores_zombi:
		
		
;;=====================================================
;;MOVER_ZOMBI
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el zombi: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_zombi:
		CALL		calcula_zombi_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		ADD			16
		LD			(IY + 4), A
		
		CALL		calcula_zombi_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		
		CALL		calcula_zombi_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea zombi
		LD			(IY + 3), ZOMBI_COLOR_A
		LD			(IY + 7), ZOMBI_COLOR_B
fin_mover_zombi:
		RET


;;=====================================================
;;CALCULA_ZOMBI_ESCENA
;;=====================================================	
calcula_zombi_escena:
		LD			 A, (heartbeat_zombi)
		AND			ZOMBI_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del zombi
			XOR			 A
			LD			(heartbeat_zombi), A
			
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano

.direccion_izquierda:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_izquierda2
.escena_izquierda1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE1B
			RET
.escena_izquierda2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE3B
			RET

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE1A
			RET
.escena_derecha2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE3A
			RET
fin_calcula_zombi_escena:


;;=====================================================
;;CALCULA_ZOMBI_INCREMENTOY
;;=====================================================	
calcula_zombi_incrementoy:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		AND			00000100b
		JP			 Z, .bajo
.subo:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			DEC			 A
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			RET
.bajo:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			INC			 A
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			RET
fin_calcula_zombi_incrementoy:
		

;;=====================================================
;;CALCULA_ZOMBI_INCREMENTOX
;;====================================================	
calcula_zombi_incrementox:
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			OR			 A
			JP			 Z, .mueve_derecha
.mueve_izquierda:
				DEC			(IX + ESTRUCTURA_ENEMIGO.posx)
				DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
				JP			.fin_mueve_posx
.mueve_derecha:
[2]				INC			(IX + ESTRUCTURA_ENEMIGO.posx)
[2]				DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
.fin_mueve_posx:
			
			RET			NZ
				;cambio dirección
				LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
				XOR			00000001b
				LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
				;resetea pasos
				LD			(IX + ESTRUCTURA_ENEMIGO.pasos), ZOMBI_PASOS
				;resetea pos y
				LD			(IX + ESTRUCTURA_ENEMIGO.posy),  ZOMBI_POSY
fin_calcula_zombi_incrementox:
			RET
