;;=====================================================
;;CONTANTES MANO DERECHA
;;=====================================================
datos_manod:
			DB		TIPOMANODERECHA	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0				;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		MANOD_ENERGIA	;(energia) energía del enemigo antes de morir
			DB		MANOD_POSX		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		MANOD_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8				;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8				;(radioy) radio y del enemigo para cuando se dispare encima
			DB		MANOD_INCREMENTO;(incx) incremento x para mover
			DB		0				;(inxy) incremento y para mover
			DB		DIRIZQUIERDA	;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0				;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		MANOD_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		1				;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_manod		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		MANOD_SPRITE1A	;izq arriba
			DB		MANOD_SPRITE1B	;der_arriba
			DB		MANOD_SPRITE1A	;izq abajo
			DB		MANOD_SPRITE1B	;der_abajo
			DB		MANOD_DANO	 	;dano

array_manod_derecha_posx:
			DB		143,145,148,151,153,156,159,161,164,167,169,172,175,177,180,183,185,188,191,193,196,199,201,204,207,209,212,215,218,220,223,225,228,231,233,236,239

array_manod_izquierda_posx:
			DB		239,236,233,231,228,225,223,220,218,215,212,209,207,204,201,199,196,193,191,188,185,183,180,177,175,172,169,167,164,161,159,156,153,151,148,145,143

;Esta variable es igual en ambas manos, no merece la pena repetirla. Está de forma real en mano izquierda
;~ array_mano_derecha_posy:
			;~ DB		55,40,32,24,18,14,12,10,8,6,4,3,3,2,2,1,0,0,0,0,0,1,2,2,3,3,4,6,8,10,12,14,18,24,32,40,55
;~ array_mano_izquierda_posy:
			;~ DB		55,71,79,87,90,96,98,100,102,104,106,107,108,109,109,110,110,111,111,111,110,110,109,109,108,107,106,104,102,100,98,96,90,87,79,71,55
			
			
;;=====================================================
;;SUBRUTINAS MANEJO DE MANO DERECHA
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_MANO DERECHA
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
;;ACTUALIZA_VALORES_MANO DERECHA
;;=====================================================	
; función: 	inicializa valores aleatorios de la mano derecha
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	posicion_anterior_arana
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
		
		;colorea mano DERECHA
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pocavida)
		OR			 A
		JP			 Z, .nointercambiacolor
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			OR			 A
			JP			 Z, .nointercambiacolor	
				LD			(IY + 3),  COLROJO
				RET
.nointercambiacolor:
		LD			(IY + 3), MANOD_COLOR
fin_mover_manod:
		RET


;;=====================================================
;;CALCULA_MANO DERECHA_ESCENA
;;=====================================================	
calcula_manod_escena:
		LD			 A, (heartbeat_general)
		AND			MANOD_VELESCENA
		RET			 Z   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			;reseteo el cambio de escena de la mano derecha
			XOR			 A
			LD			(heartbeat_general), A
			
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
;;CALCULA_MANO DERECHA_INCREMENTOXY
;;=====================================================	
calcula_manod_incrementoxy:
		BIT			 0, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		JP			NZ, .direccion_izquierda
		
.direccion_derecha:		
			LD			HL, array_manod_derecha_posx
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

			LD			HL, array_mano_derecha_posy
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

			JP			.fin_direccion
.direccion_izquierda:
			LD			HL, array_manod_izquierda_posx
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posx), A

			LD			HL, array_mano_izquierda_posy
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.pasos)
			CALL		suma_A_HL
			LD			 A, (HL)
			LD			(IX + ESTRUCTURA_ENEMIGO.posy), A

.fin_direccion:
		DEC			(IX + ESTRUCTURA_ENEMIGO.pasos)
		RET			NZ
			;implica que se han terminado los pasos y hay que cambiar de sentido
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.direccionx), A
			LD			(IX + ESTRUCTURA_ENEMIGO.pasos), MANOD_PASOS
fin_calcula_manod_incrementoxy:
		RET
