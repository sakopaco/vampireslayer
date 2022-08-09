;;=====================================================
;;COSNTANTES JEFEZOMBI
;;=====================================================		
datos_jefezombi:
			DB		TIPOJEFEZOMBI	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b	;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		128		;(energia) energía del enemigo antes de morir
			DB		JEFEZOMBI_POSX	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFEZOMBI_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		JEFEZOMBI_PASOS		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;pocavida 0 y 1 para indicar cuando le queda poca vida al enemigo
			DW		mover_jefezombi		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFEZOMBI_SPRITE1A	;izq arriba
			DB		JEFEZOMBI_SPRITE2A	;der_arriba
			DB		JEFEZOMBI_SPRITE3A	;izq abajo
			DB		JEFEZOMBI_SPRITE4A	;der_abajo


;;=====================================================
;;SUBRUTINAS MANEJO DE JEFEZOMBI
;;=====================================================	


;;=====================================================
;;ANADE_ENEMIGO_JEFEZOMBI
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del jefezombi en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_jefezombi:
		LD			HL, datos_jefezombi
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_jefezombi:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_JEFEZOMBI 
;;=====================================================	
; función: 	inicializa valores aleatorios del zombi
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; toca:		-
actualiza_valores_jefezombi_BR:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), 64
		
		;quitar cuando se cree el daño a los jefes
		LD			 (IX + ESTRUCTURA_ENEMIGO.pocavida), 1
fin_actualiza_valores_jefezombi_BR:
		RET
		
		
;;=====================================================
;;MOVER_JEFEZOMBI
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al programa enfocarse en el jefezombi: su ataque, su sptrite, etc...
; entrada: IX (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_jefezombi:
		CALL		calcula_zombi_incrementoy	;se usa el movimiento del zombi normal
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			(IY + 8), A
		ADD			16
		LD			(IY + 4), A
		LD			(IY + 12), A
		
		CALL		calcula_zombi_incrementox	;se usa el movimiento del zombi normal
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		LD			(IY + 5), A
		ADD 		16
		LD			(IY + 9), A
		LD			(IY + 13), A
		
		CALL		calcula_jefezombi_escena		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_a)
		LD			(IY + 2), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_b)
		LD			(IY + 6), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_c)
		LD			(IY + 10), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_d)
		LD			(IY + 14), A
		
		;colorea jefe zombi
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.pocavida)
		OR			 A
		JP			 Z, .nointercambiacolor
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			OR			 A
			JP			 Z, .nointercambiacolor	
				LD			(IY + 3),  COLROJO
				LD			(IY + 7),  COLROJO
				LD			(IY + 11), COLROJO
				LD			(IY + 15), COLROJO
				RET
.nointercambiacolor:		
		LD			(IY + 3),  JEFEZOMBI_COLOR_A
		LD			(IY + 7),  JEFEZOMBI_COLOR_B
		LD			(IY + 11), JEFEZOMBI_COLOR_C
		LD			(IY + 15), JEFEZOMBI_COLOR_D
fin_mover_jefezombi:
		RET


;;=====================================================
;;CALCULA_JEFEZOMBI_ESCENA
;;=====================================================	
calcula_jefezombi_escena:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.direccionx)
		OR			 A
		JP			 Z, .direccion_derecha

.direccion_izquierda:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_izquierda2
.escena_izquierda1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEZOMBI_SPRITE1C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEZOMBI_SPRITE2C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEZOMBI_SPRITE3C
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEZOMBI_SPRITE4C
			RET
.escena_izquierda2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEZOMBI_SPRITE1D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEZOMBI_SPRITE2D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEZOMBI_SPRITE3D
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEZOMBI_SPRITE4D
			RET

.direccion_derecha:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		XOR			00000001b
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
		OR			 A
		JP			 Z, .escena_derecha2
.escena_derecha1:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEZOMBI_SPRITE1A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEZOMBI_SPRITE2A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEZOMBI_SPRITE3A
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEZOMBI_SPRITE4A
			RET
.escena_derecha2:
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), JEFEZOMBI_SPRITE1B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), JEFEZOMBI_SPRITE2B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), JEFEZOMBI_SPRITE3B
			LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), JEFEZOMBI_SPRITE4B
			RET
fin_calcula_jefezombi_escena:


;;=====================================================
;;CALCULA_JEFEZOMBI_INCREMENTOY
;;=====================================================	
calcula_jefezombi_incrementoy:
fin_calcula_jefezombi_incrementoy:
		

;;=====================================================
;;CALCULA_JEFEZOMBI_INCREMENTOX
;;====================================================	
calcula_jefezombi_incrementox:
fin_calcula_jefezombi_incrementox:
