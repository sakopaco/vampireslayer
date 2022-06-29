;;=====================================================
;;CONTANTES MAGIA
;;=====================================================
datos_magia:
			DB		TIPOMAGIA		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MAGIA_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MAGIA_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MAGIA_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_lobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MAGIA_SPRITE1A	;izq arriba
			DB		MAGIA_SPRITE2A	;der_arriba
			DB		MAGIA_SPRITE1B	;izq abajo
			DB		MAGIA_SPRITE2B	;der_abajo


array_magia_derecha_posx:
			DB		64,67,70,72,75,78,80,83,85,88,91,94,96,99,102,104,107,110,112,115,118,120,123,126,128,131,134,136,139,142,144,147,150,152,155,158,160

array_magia_derecha_posy:
			DB		55,40,32,24,18,14,12,10,8,6,4,3,3,2,2,1,0,0,0,0,0,1,2,2,3,3,4,6,8,10,12,14,18,24,32,40,55

array_magia_izquierda_posx:
			DB		160,158,155,152,150,147,144,142,139,136,134,131,128,126,123,120,118,115,112,110,107,104,102,99,96,94,91,88,85,83,80,78,75,72,70,67,64
			
array_magia_izquierda_posy:
			DB		55,95,87,79,73,69,67,65,63,61,59,58,58,57,57,56,55,55,55,55,55,56,57,57,58,58,59,61,63,65,67,69,73,79,87,95,55


;;=====================================================
;;SUBRUTINAS MANEJO DE MAGIA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MAGIA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la magia en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_magia:
		LD			HL, datos_magia
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_magia:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_MAGIA
;;=====================================================	
; función: 	inicializa valores aleatorios del lobo
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
; toca:		-
actualiza_valores_magia:
fin_actualiza_valores_magia:
		RET
		
		
;;=====================================================
;;MOVER_MAGIA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el lobo: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_magia:
		;CALL		calcula_magia_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 4), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		ADD			16
		LD			(IY + 5), A
		
		CALL		calcula_magia_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		ADD			 4
		LD			(IY + 6), A
		
		;colorea magia
		LD			(IY + 3), MAGIA_COLOR
		LD			(IY + 7), MAGIA_COLOR
fin_mover_magia:
		RET


;;=====================================================
;;CALCULA_MAGIA_ESCENA
;;=====================================================	
calcula_magia_escena:
fin_calcula_magia_escena:
		RET
		

;;=====================================================
;;CALCULA_LOBO_INCREMENTOXY
;;=====================================================	
calcula_magia_incrementoxy:
fin_calcula_magia_incrementoxy:
		RET
