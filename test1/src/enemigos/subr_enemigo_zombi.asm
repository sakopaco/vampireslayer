;;=====================================================
;;COSNTANTES ZOMBI
;;=====================================================		
datos_zombi:
			DB		TIPOZOMBI	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b	;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		ZOMBI_POSX	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		ZOMBI_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_zombi		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		ZOMBI_SPRITE1A	;izq arriba
			DB		ZOMBI_SPRITE2A	;der_arriba
			DB		ZOMBI_SPRITE3A	;izq abajo
			DB		ZOMBI_SPRITE4A	;der_abajo


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
.calcula_posicion:
.asigna_valores_posicion_x:
		LD			 A, R
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), ZOMBI_POSY
fin_actualiza_valores_zombi:
		RET
		
		
;;=====================================================
;;MOVER_ZOMBI
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la serpiente: su ataque, su sptrite, etc...
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
		
		LD			 A, ZOMBI_COLOR_A
		LD			(IY + 3), A
		LD			 A, ZOMBI_COLOR_B
		LD			(IY + 7), A
fin_mover_zombi:
		RET


;;=====================================================
;;CALCULA_ZOMBI_ESCENA
;;=====================================================	
calcula_zombi_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE1A
			RET
.escena_derecha2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), ZOMBI_SPRITE3A
			RET
fin_calcula_zombi_escena:
		;RET


;;=====================================================
;;CALCULA_ZOMBI_INCREMENTOY
;;=====================================================	
calcula_zombi_incrementoy:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		;~ AND			00111111b ;63
		;~ CP			00100000b ;32
		;~ JP			NC, .bajo
;~ .subo:
			;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			;~ DEC			 A
			;~ LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			;~ RET
;~ .bajo:
			;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
			;~ INC			 A
			;~ LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
			RET
fin_calcula_zombi_incrementoy:
		

;;=====================================================
;;CALCULA_ZOMBI_INCREMENTOX
;;====================================================	
calcula_zombi_incrementox:
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		;~ INC			 A
		;~ LD			(IX + ESTRUCTURA_ENEMIGO.posx), A	
fin_calcula_zombi_incrementox:
		RET
