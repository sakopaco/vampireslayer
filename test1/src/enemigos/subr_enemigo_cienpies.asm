;;=====================================================
;;CONTANTES CIENPIES
;;=====================================================
;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_cienpies_x:
			DB		240,100,175,150,200,75,16,125,25
posiciones_cienpies_y:
			DB		60,72,24,36,108,84,12,96,48

datos_cienpies:	
			DB		TIPOCIEMPIES		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0					;(escena) sprite a mostrar 1/2
			DB		0					;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		CIENPIES_ENERGIA	;(energia) energía del enemigo antes de morir
			DB		0					;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0					;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		CIENPIES_RADIOX		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		CIENPIES_RADIOY		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0					;(incx) incremento x para mover
			DB		0					;(inxy) incremento y para mover
			DB		0					;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0					;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0					;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0					;(pocavida) si el enemigo está muerto
			DW		mover_cienpies		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		CIENPIES_SPRITE1A	;izq arriba
			DB		CIENPIES_SPRITE1B	;izq abajo
			DB		CIENPIES_SPRITE1A	;der_arriba
			DB		CIENPIES_SPRITE1B	;der_abajo
			DB		CIENPIES_DANO 		;dano


;;=====================================================
;;SUBRUTINAS MANEJO DE CIENPIES
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_CIENPIES/ARANA/SERPIENTE/MURCIELAGO/LOBO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del cienpies en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_cienpies:
		LD			HL, datos_cienpies
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_cienpies:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_CIENPIES
;;=====================================================	
; función: 	inicializa valores aleatorios del cienpies
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1), posiciones_iniciales_cienpies_x, posiciones_iniciales_cienpies_y
; salida: 	posicion_anterior_cienpies
; toca:		-
actualiza_valores_cienpies:
;actualiza_valores_aleatorios_cienpies
.calcula_posicion:
		;calcula posición de 0 a 8 porque es el primer cienpies
		LD			 A, R
		AND			00000111b
		LD			 B, A ; dejo un copia en B del valor de A 
		
.asigna_valores_posicion_x:
		LD			HL, posiciones_cienpies_x
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

.asigna_valores_posicion_y:
		LD			 A, B
		LD			HL, posiciones_cienpies_y
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
fin_actualiza_valores_cienpies:
		RET


;;=====================================================
;;MOVER_CIENPIES
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_cienpies:
		LD			A, (IX + ESTRUCTURA_ENEMIGO.dano)	;IF DAÑO = 0
		OR 			A
		JP			 Z, cienpies_muerto
			;calcula posición Y
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			LD			(IY), A
		
			;calcula posición X
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
			LD			(IY + 1), A

			CALL		calcula_cienpies_escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
			LD			(IY + 2), A	
		
			;colorea cienpies
			LD			(IY + 3), CIENPIES_COLOR
		
			RET
cienpies_muerto:									;ELSE
			LD			(IY + 3), 15
			
			CALL		test_OK
			RET
fin_mover_cienpies:


;;=====================================================
;;CALCULA_CIENPIES_ESCENA
;;=====================================================	
; función: calcula la escena que toca mostrar para el cienpies y la pone en variable
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
calcula_cienpies_escena:
		LD			 A, (heartbeat_cienpies)
		AND			CIENPIES_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena del cienpies
			XOR			 A
			LD			(heartbeat_cienpies), A
		
			;hace daño
			LD			 B, (IX + ESTRUCTURA_ENEMIGO.dano)
			CALL		enemigo_hace_dano
			
			;cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, CIENPIES_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, CIENPIES_SPRITE1B
.fin_enemigo1_poner_escena2:								; END IF
;.fin_cambia_escena_enemigo1:							; END IF			
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_cienpies_escena:
		RET
		
