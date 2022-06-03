;;=====================================================
;;CONTANTES FANTASMA
;;=====================================================
datos_fantasma:
			DB		TIPOFANTASMA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_fantasma	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		FANTASMA_SPRITE1;izq arriba
			DB		FANTASMA_SPRITE2;der_arriba
			DB		FANTASMA_SPRITE3;izq abajo
			DB		FANTASMA_SPRITE4;der_abajo
			

posiciones_fantasmay:
			DB		0,75,150,224
posiciones_fantasmax:
			DB		0,75,150,224


;;=====================================================
;;SUBRUTINAS MANEJO DE FANTASMA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_FANTASMA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del fantasma en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_fantasma:
		LD			HL, datos_fantasma
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_fantasma:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_FANTASA
;;=====================================================	
; función: 	inicializa valores aleatorios del fantasma
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_fantasma
; toca:		-
actualiza_valores_fantasma:
.asigna_valores_posicion_x:	
		;calcula posición inicial sumando a su líete izq un offset
		LD			 A, 0
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
.asigna_valores_posicion_y:
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
fin_actualiza_valores_fantasma:
		RET
		
		
;;=====================================================
;;MOVER_FANTASMA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el fantasma: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_fantasma:
		;CALL		calcula_fantasma_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		;CALL		calcula_fantasma_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		;CALL		calcula_fantasma_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		LD			 A, FANTASMA_COLOR
		LD			(IY + 3), A
		LD			(IY + 7), A
fin_mover_fantasma:
		RET


;;=====================================================
;;CALCULA_FANTASA_ESCENA
;;=====================================================	
calcula_fantasma_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z

fin_calcula_fantasma_escena:
		RET


;;=====================================================
;;CALCULA_FANTASMA_INCREMENTOY
;;=====================================================	
calcula_fantasma_incrementoy:
fin_calcula_fantasma_incrementoy:
		RET


;;=====================================================
;;CALCULA_FANTASMA_INCREMENTOX
;;=====================================================	
calcula_fantasma_incrementox:
fin_calcula_fantasma_incrementox:
		RET
