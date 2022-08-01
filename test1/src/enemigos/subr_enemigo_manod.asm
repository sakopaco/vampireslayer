;;=====================================================
;;CONTANTES MANODERECHA
;;=====================================================
datos_manod:
			DB		TIPOMANODERECHA		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MANOD_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MANOD_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		MANOD_INCREMENTO;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MANOD_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_manod		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MANOD_SPRITE1A	;izq arriba
			DB		MANOD_SPRITE1B	;der_arriba
			DB		0		;izq abajo
			DB		0		;der_abajo


array_manod_derecha_posx:
			DB		64,67,70,72,75,78,80,83,85,88,91,94,96,99,102,104,107,110,112,115,118,120,123,126,128,131,134,136,139,142,144,147,150,152,155,158,160

array_manod_derecha_posy:
			DB		55,40,32,24,18,14,12,10,8,6,4,3,3,2,2,1,0,0,0,0,0,1,2,2,3,3,4,6,8,10,12,14,18,24,32,40,55


;;=====================================================
;;SUBRUTINAS MANEJO DE MANODERECHA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MANODERECHA
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base de la mano derecha en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_manod:
		LD			HL, datos_manod
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_manod:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_MANODERECHA
;;=====================================================	
; función: 	inicializa valores aleatorios de la mano derecha
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_manod:
fin_actualiza_valores_manod:
		
		
;;=====================================================
;;MOVER_MANO DERECHA
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en la mano derecha: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_manod:
		DEC			(IX + ESTRUCTURA_ENEMIGO.incx)
		RET			NZ
		
		LD			(IX + ESTRUCTURA_ENEMIGO.incx), MANOD_INCREMENTO
		
		CALL		calcula_manod_incrementoxy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A

		CALL		calcula_manod_escena
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		
		;colorea mano
		LD			(IY + 3), MANOD_COLOR
fin_mover_manod:
		RET


;;=====================================================
;;CALCULA_MANODERECHA_ESCENA
;;=====================================================	
calcula_manod_escena:
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
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), MANOD_SPRITE1A
				RET
.escena2:
				LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), MANOD_SPRITE1B
				RET	
fin_calcula_manod_escena:
		

;;=====================================================
;;CALCULA_MANODERECHA_INCREMENTOXY
;;=====================================================	
calcula_manod_incrementoxy:
		LD			HL, array_manod_derecha_posx
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
			
		LD			HL, array_manod_derecha_posy
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
		
		;implica que se han terminado los pasos
		LD			(IX + ESTRUCTURA_ENEMIGO.pasos), MANOD_PASOS
fin_calcula_manod_incrementoxy:
		RET

