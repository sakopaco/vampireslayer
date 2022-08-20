;;=====================================================
;;COSNTANTES ESQUELETO
;;=====================================================		
datos_esqueleto:
			DB		TIPOESQUELETO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		ESQUELETO_POSX	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		ESQUELETO_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_esqueleto		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		ESQUELETO_SPRITE1A	;izq arriba
			DB		ESQUELETO_SPRITE2A	;der_arriba
			DB		ESQUELETO_SPRITE3A	;izq abajo
			DB		ESQUELETO_SPRITE4A	;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE ESQUELETO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_ESQUELETO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del lobo en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_esqueleto:
		LD			HL, datos_esqueleto
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_esqueleto:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_ESQUELETO 
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_esqueleto:
fin_actualiza_valores_esqueleto:
		
		
;;=====================================================
;;MOVER_ESQUELETO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el esqueleto: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_esqueleto:
		CALL		calcula_esqueleto_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		ADD			16
		LD			(IY + 4), A
		
		CALL		calcula_esqueleto_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		
		CALL		calcula_esqueleto_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea esqueleto
		LD			(IY + 3), ESQUELETO_COLOR
		LD			(IY + 7), ESQUELETO_COLOR
fin_mover_esqueleto:
		RET


;;=====================================================
;;CALCULA_ESQUELETO_ESCENA
;;=====================================================	
calcula_esqueleto_escena:
		LD			 A, (heartbeat_esqueleto)
		OR			00010000b
		RET			 Z

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), ESQUELETO_SPRITE1A
			RET
.escena_derecha2:
			LD			 (IX + ESTRUCTURA_ENEMIGO.sprite_a), ESQUELETO_SPRITE3A
			RET
fin_calcula_esqueleto_escena:
		;RET


;;=====================================================
;;CALCULA_ESQUELETO_INCREMENTOY
;;=====================================================	
calcula_esqueleto_incrementoy:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		AND			00111111b ;63
		CP			00100000b ;32
		JP			NC, .bajo
.subo:
			DEC			(IX + ESTRUCTURA_ENEMIGO.posy)
			RET
.bajo:
			INC			(IX + ESTRUCTURA_ENEMIGO.posy)
			RET
fin_calcula_esqueleto_incrementoy:
		

;;=====================================================
;;CALCULA_ESQUELETO_INCREMENTOX
;;====================================================	
calcula_esqueleto_incrementox:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		INC			 A
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A	
fin_calcula_esqueleto_incrementox:
		RET
