;;=====================================================
;;CONTANTES MANOIZQUIERDA
;;=====================================================
datos_manoi:
			DB		TIPOMANOIZQUIERDA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MANOI_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MANOI_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		MANOI_INCREMENTO;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MANOI_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_manoi		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MANOI_SPRITE1A	;izq arriba
			DB		MANOI_SPRITE1B	;der_arriba
			DB		0		;izq abajo
			DB		0		;der_abajo


array_manoi_izquierda_posx:
			DB		160,158,155,152,150,147,144,142,139,136,134,131,128,126,123,120,118,115,112,110,107,104,102,99,96,94,91,88,85,83,80,78,75,72,70,67,64
			
array_manoi_izquierda_posy:
			DB		55,71,79,87,90,96,98,100,102,104,106,107,108,109,109,110,110,111,111,111,110,110,109,109,108,107,106,104,102,100,98,96,90,87,79,71,55


;;=====================================================
;;SUBRUTINAS MANEJO DE MANOIZQUIERDA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MANOIZUIERDA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la mano izquierda en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_manoi:
		LD			HL, datos_manoi
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_manoi:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_MANOIZQUIERDA
;;=====================================================	
; función: 	inicializa valores aleatorios de la mano izquierda
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_manoi:
fin_actualiza_valores_manoi:
		
		
;;=====================================================
;;MOVER_MANO IZQUIERDA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la mano izquierda: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_manoi:
		DEC			(IX + ESTRUCTURA_ENEMIGO.incx)
		RET			NZ
		
		LD			(IX + ESTRUCTURA_ENEMIGO.incx), MANOI_INCREMENTO
		
		CALL		calcula_manoi_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		CALL		calcula_manoi_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		
		;colorea manoi
		LD			(IY + 3), MANOI_COLOR
fin_mover_manoi:
		RET


;;=====================================================
;;CALCULA_MANOIZQUIERDA_ESCENA
;;=====================================================	
calcula_manoi_escena:
		LD			 A, (heartbeat)
		OR			00010000b
		RET			 Z
			;THEN cambia escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			OR			 A
			JP			 Z, .escena2
.escena1:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), MANOI_SPRITE1A
				RET
.escena2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), MANOI_SPRITE1B
				RET	
fin_calcula_manoi_escena:
		

;;=====================================================
;;CALCULA_MANOIZQUIERDA_INCREMENTOXY
;;=====================================================	
calcula_manoi_incrementoxy:
		LD			HL, array_manoi_izquierda_posx
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
			
		LD			HL, array_manoi_izquierda_posy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
		
		;implica que se han terminado los pasos
		LD			(IX + ESTRUCTURA_ENEMIGO.pasos), MANOI_PASOS
fin_calcula_manoi_incrementoxy:
		RET

