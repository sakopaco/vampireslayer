;;=====================================================
;;CONTANTES FUEGO
;;=====================================================
datos_fuego:
			DB		TIPOFUEGO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b	;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		16		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0			;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		FUEGO_PASOSX;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_fuego	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE FUEGO
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_FUEGO
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del fuego en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_fuego:
		LD			HL, datos_fuego
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_fuego:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_FUEGO
;;=====================================================	
; función: 	inicializa valores aleatorios del murciélago
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_fuego:
fin_actualiza_valores_fuego:
		
		
;;=====================================================
;;MOVER_FUEGO
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el muerciélago: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_fuego:
		CALL		calcula_fuego_incrementoy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		ADD			16
		LD			(IY + 4), A
		
		CALL		calcula_fuego_incrementox
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		
		CALL		calcula_fuego_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea fuego
		LD			(IY + 3), FUEGO_COLOR1
		LD			(IY + 7), FUEGO_COLOR2
fin_mover_fuego:
		RET


;;=====================================================
;;CALCULA_FUEGO_ESCENA
;;=====================================================	
calcula_fuego_escena:
fin_calcula_fuego_escena:
		RET


;~ a: 15,15	b: 223,15
;~ c: 15,79	d: 223,79


;;=====================================================
;;CALCULA_FUEGO_INCREMENTOY
;;=====================================================	
calcula_fuego_incrementoy:
fin_calcula_fuego_incrementoy:
		RET
		

;;=====================================================
;;CALCULA_FUEGO_INCREMENTOx
;;=====================================================	
calcula_fuego_incrementox:
fin_calcula_fuego_incrementox:
		RET