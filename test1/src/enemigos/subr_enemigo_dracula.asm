;;=====================================================
;;COSNTANTES DRACULA
;;=====================================================		
datos_dracula:
			DB		TIPODRACULA					;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0							;(escena) sprite a mostrar 1/2
			DB		00010000b					;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		DRACULA_ENERGIA				;(energia) energía del enemigo antes de morir
			DB		DRACULA_X2					;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		DRACULA_Y					;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		0							;(incx) incremento x para mover
			DB		0							;(inxy) incremento y para mover
			DB		DIRIZQUIERDA				;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0							;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		DRACULA_PASOS				;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		DRACULA_POCAVIDA			;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_dracula				;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		DRACULA_SPRITE1A			;izq arriba
			DB		DRACULA_SPRITE1B			;der_arriba
			DB		DRACULA_SPRITE2A			;izq abajo
			DB		DRACULA_SPRITE2B			;der_abajo
			DB		DRACULA_DANO 				;dano
			DW		check_colision_enemigo16x32	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)


;;=====================================================
;;SUBRUTINAS MANEJO DE DRACULA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_DRACULA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del dracula en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_dracula:
		LD			HL, datos_dracula
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_dracula:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_DRACULA
;;=====================================================	
; función: 	inicializa valores aleatorios del dracula
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_dracula:
fin_actualiza_valores_dracula:

		
;;=====================================================
;;MOVER_DRACULA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el dracula: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_dracula:
		CALL		calcula_dracula_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), 		A
		LD			(IY + 8), 	A
		ADD			16
		LD			(IY + 4),  	A
		LD			(IY + 12), 	A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1),  A
		LD			(IY + 5),  A
		LD			(IY + 9),  A
		LD			(IY + 13), A
		
		;CALL		calcula_dracula_escena		;no es necesario
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		ADD			 4
		LD			(IY + 14), A
		
		;colorea dracula
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
		SUB			DRACULA_POCAVIDA;(IX + ESTRUCTURA_ENEMIGO.pocavida)
		JP			 NC, .nointercambiacolor
			LD			 A, R
			AND			00000001b
			JP			 Z, .nointercambiacolor	
				LD			(IY + 3), COLROJO
				LD			(IY + 7), COLROJO
				LD			(IY + 11), DRACULA_COLOR2
				LD			(IY + 15), DRACULA_COLOR3
				RET
.nointercambiacolor:		
		LD			(IY + 3),   DRACULA_COLOR1
		LD			(IY + 7),   DRACULA_COLOR1
		LD			(IY + 11),  DRACULA_COLOR2
		LD			(IY + 15),  DRACULA_COLOR3
fin_mover_dracula:
		RET


;;=====================================================
;;CALCULA_DRACULA_ESCENA
;;=====================================================	
calcula_dracula_escena:
fin_calcula_dracula_escena:


;;=====================================================
;;CALCULA_DRACULA_INCREMENTOXY
;;=====================================================	
calcula_dracula_incrementoxy:
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
		
		LD			(IX + ESTRUCTURA_ENEMIGO.pasos), DRACULA_PASOS
		LD			 A, R
.mira_posicion0:
		BIT			 0, A
		JR			 Z, .mira_posicion1
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), DRACULA_Y
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), DRACULA_X2
		RET
		
.mira_posicion1:
		BIT			 1, A
		JR			 Z, .mira_posicion2
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), DRACULA_Y
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), DRACULA_X3
		RET
		
.mira_posicion2:
		BIT			 2, A
		JR			 Z, .mira_posicion3
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), DRACULA_Y
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), DRACULA_X1
		RET
		
.mira_posicion3:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), DRACULA_Y
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), DRACULA_X4
		RET
fin_calcula_dracula_incrementoxy:

