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
		EXX
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

		EXX
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
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
.cambiando_posx:		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		
		CALL		calcula_cienpies_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A		
		LD			(IY + 3), CIENPIES_COLOR
fin_mover_cienpies:
		RET

;;=====================================================
;;CALCULA_CIENPIES_ESCENA
;;=====================================================	
; función: calcula la escena que toca mostrar para el cienpies y la pone en variable
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
calcula_cienpies_escena:
		LD			 A, (heartbeat)
		OR			00000001b
		RET			 Z	   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, CIENPIES_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, CIENPIES_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF	
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), A
fin_calcula_cienpies_escena:
		RET
		
