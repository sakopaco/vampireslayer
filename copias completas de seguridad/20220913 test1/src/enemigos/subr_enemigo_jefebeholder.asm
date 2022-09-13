;;=====================================================
;;CONTANTES JEFEBEHOLDER
;;=====================================================
datos_jefebeholder:
			DB		TIPOJEFEBEHOLDER	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		JEFEBEHOLDER_POSX	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFEBEHOLDER_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		JEFEBEHOLDER_INCREMENTO	;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		JEFEBEHOLDER_PASOS	;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefebeholder		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFEBEHOLDER_SPRITE1A	;izq arriba
			DB		JEFEBEHOLDER_SPRITE2A	;der_arriba
			DB		JEFEBEHOLDER_SPRITE1B	;izq abajo
			DB		JEFEBEHOLDER_SPRITE2B	;der_abajo

array_jefebeholder_derecha_posx:
			DB		0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124,128,132,136,140,144,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220
			
array_jefebeholder_derecha_posy:
			DB		48,40,30,26,24,21,19,17,14,13,12,11,10,9,8,7,6,5,4,4,3,3,2,2,1,1,0,0,0,0,1,1,2,2,3,3,4,4,5,6,7,8,9,10,11,12,13,14,17,19,21,24,26,30,40,48

array_jefebeholder_izquierda_posx:
			DB		220,216,212,208,204,200,196,192,188,184,180,176,172,168,164,160,156,152,148,144,140,136,132,128,124,120,116,112,108,104,100,96,92,88,84,80,76,72,68,64,60,56,52,48,44,40,36,32,28,24,20,16,12,8,4,0
			
array_jefebeholder_izquierda_posy:
			DB		48,56,66,70,72,75,77,79,82,83,84,85,86,87,88,89,90,91,92,92,93,93,94,94,95,95,96,96,96,96,95,95,94,94,93,93,92,92,91,90,89,88,87,86,85,84,83,82,79,77,75,72,70,66,56,48


;;=====================================================
;;SUBRUTINAS MANEJO DE JEFEBEHOLDER
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFEBEHOLDER
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la jefebeholder en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefebeholder:
		LD			HL, datos_jefebeholder
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefebeholder:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_JEFEBEHOLDER
;;=====================================================	
; función: 	inicializa valores aleatorios del jefebeholder
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_jefebeholder_BR:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), 64
		
		;quitar cuando se cree el daño a los jefes
		LD			 (IX + ESTRUCTURA_ENEMIGO.pocavida), 1
fin_actualiza_valores_jefebeholder_BR:
		RET
		
		
;;=====================================================
;;MOVER_JEFEBEHOLDER
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefebeholder: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefebeholder:
		DEC			(IX + ESTRUCTURA_ENEMIGO.incx)
		RET			NZ
		
		LD			(IX + ESTRUCTURA_ENEMIGO.incx), JEFEBEHOLDER_INCREMENTO
		
		CALL		calcula_jefebeholder_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
		CALL		calcula_jefebeholder_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A
		
		;colorea jefebeholder
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
		LD			(IY + 3), JEFEBEHOLDER_COLOR
		LD			(IY + 7), JEFEBEHOLDER_COLOR
		LD			(IY + 11),JEFEBEHOLDER_COLOR
		LD			(IY + 15),JEFEBEHOLDER_COLOR
fin_mover_jefebeholder:
		RET


;;=====================================================
;;CALCULA_JEFEBEHOLDER_ESCENA
;;=====================================================	
calcula_jefebeholder_escena:
		LD			 A, (heartbeat_general)
		AND			JEFEBEHOLDER_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del jefebeholder
			XOR			 A
			LD			(heartbeat_general), A
			
			;THEN cambia escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena2
.escena1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE1A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE2A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE3A
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE4A
				RET
.escena2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE1B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE2B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE3B
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEBEHOLDER_SPRITE4B
				RET	
fin_calcula_jefebeholder_escena:
		RET
		

;;=====================================================
;;CALCULA_JEFEBEHOLDER_INCREMENTOXY
;;=====================================================	
calcula_jefebeholder_incrementoxy:
		BIT			 0, (IX + ESTRUCTURA_ENEMIGO.direccionx)	
		JP			NZ, .direccion_izquierda	
		
.direccion_derecha:		
			LD			HL, array_jefebeholder_derecha_posx
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

			LD			HL, array_jefebeholder_derecha_posy
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

			JP			.fin_direccion
.direccion_izquierda:
			LD			HL, array_jefebeholder_izquierda_posx
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

			LD			HL, array_jefebeholder_izquierda_posy
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

.fin_direccion:
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		
		RET			NZ
		
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), JEFEBEHOLDER_PASOS
			
			;para darle un poco de aleatoriedad al movimiento puede que continue la elipse o la reinicie
			LD			 A, R
			BIT			 0, A
			RET			NZ
			
			;implica que se han terminado los pasos y hay que cambiar de sentido
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
fin_calcula_jefebeholder_incrementoxy:
		RET
