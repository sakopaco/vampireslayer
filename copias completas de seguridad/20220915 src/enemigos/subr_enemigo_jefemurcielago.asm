;;=====================================================
;;CONTANTES JEFEMURCIELAGO
;;=====================================================
datos_jefemurcielago:
			DB		TIPOJEFEMURCIELAGO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRABAJO;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefemurcielago	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFEMURCIELAGO_SPRITE1A	;izq arriba
			DB		JEFEMURCIELAGO_SPRITE2A	;der_arriba
			DB		JEFEMURCIELAGO_SPRITE3A	;izq abajo
			DB		JEFEMURCIELAGO_SPRITE4A	;der_abajo
			
posiciones_iniciales_jefemurcielago:
			DB		0,75,150,224

		
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
; función: 	inicializa valores aleatorios del jefemurciélago
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_jefemurcielago:
.asigna_valores_posicion_x:
		LD			 A, R
		AND			00000011b
		LD			HL, posiciones_iniciales_jefemurcielago
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), 0
		
		;miro si el nivel es 6
		LD			 A, (prota_nivel)
		BIT			 0, A
		RET			NZ
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), 64
		
		
		;quitar cuando proceda
		LD			(IX + ESTRUCTURA_ENEMIGO.pocavida), 1
fin_actualiza_valores_jefemurcielago:
		RET
		
		
;;=====================================================
;;MOVER_JEFEMURCIELAGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefemurcielago: su ataque, su sptrite, etc...
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
		
		CALL		calcula_jefemurcielago_incrementox	
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

		;colorea jefemurcielago
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
		LD			(IY + 3),  JEFEMURCIELAGO_COLOR
		LD			(IY + 7),  JEFEMURCIELAGO_COLOR
		LD			(IY + 11), JEFEMURCIELAGO_COLOR
		LD			(IY + 15), JEFEMURCIELAGO_COLOR
fin_mover_jefemurcielaro:
		RET


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_ESCENA
;;=====================================================	
calcula_jefemurcielago_escena:
		LD			 A, (heartbeat_general)
		AND			JEFEMURCIELAGO_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del jefemurcielago
			XOR			 A
			LD			(heartbeat_general), A
		
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .poner_escena2			; IF ESCENA 1 THEN
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEMURCIELAGO_SPRITE1A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEMURCIELAGO_SPRITE2A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEMURCIELAGO_SPRITE3A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEMURCIELAGO_SPRITE4A
		
				JP			fin_calcula_jefemurcielago_escena
.poner_escena2:									; ELSE
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEMURCIELAGO_SPRITE1B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEMURCIELAGO_SPRITE2B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEMURCIELAGO_SPRITE3B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEMURCIELAGO_SPRITE4B
;.fin_enemigo1_poner_escena2:								; END IF
;.fin_cambia_escena_enemigo1:							; END IF
fin_calcula_jefemurcielago_escena:
		RET


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_INCREMENTOY
;;=====================================================	
calcula_jefemurcielago_incrementoy:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JR			 Z, .baja_jefemurcielago
		
.sube_jefemurcielago:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		DEC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		;CP			JEFEMURCIELAGO_LIMIABA no necesario
		RET			NZ
		LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 0
		RET
		
.baja_jefemurcielago:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		ADD			 4
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		
		CP			JEFEMURCIELAGO_LIMIABA
		RET			NZ
		LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), 1
		RET
fin_calcula_jefemurcielago_incrementoy:


;;=====================================================
;;CALCULA_JEFEMURCIELAGO_INCREMENTOX
;;=====================================================	
calcula_jefemurcielago_incrementox:
		;si no llega al tope superior no tiene que cambiar el valor X
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		OR			 A
		RET			NZ
		
		;calcula nueva columna donde aparecerá el jefemurcielago
		LD			 A, R
		AND			00000011b
		LD			HL, posiciones_iniciales_jefemurcielago
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
fin_calcula_jefemurcielago_incrementox:
		RET
