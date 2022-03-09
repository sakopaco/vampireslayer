;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_iniciales_cienpies_x:
		DB			128,128, 16,128,224, 64, 96,160,224
posiciones_iniciales_cienpies_y:
		DB			  8,  8, 72, 40, 72,104,106,106,104

enemigo1			DS	ESTRUCTURA_ENEMIGO
enemigo2			DS	ESTRUCTURA_ENEMIGO
enemigo3			DS	ESTRUCTURA_ENEMIGO
enemigo4			DS	ESTRUCTURA_ENEMIGO
enemigo5			DS	ESTRUCTURA_ENEMIGO
enemigo6			DS	ESTRUCTURA_ENEMIGO
enemigo7			DS	ESTRUCTURA_ENEMIGO
enemigo8			DS	ESTRUCTURA_ENEMIGO
enemigo9			DS	ESTRUCTURA_ENEMIGO


;;=====================================================
;;DATOS_ENEMIGOS (EQUIVALE A PLANTILLAS)
;;=====================================================
datos_cienpies:	
			DB		2		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_cienpies	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)



datos_serpiente:
datos_arana:
datos_murcielago:
datos_lobo:
datos_esqueleto:
datos_zombi:
datos_fantasma:
datos_caballerogris:
datos_caballeronegro:
datos_fuego:
datos_magia:
datos_jefelobo:
datos_jefemurcielago:
datos_jefefatasma:
datos_jefezombie:
datos_jefecaballero:
datos_jefebeholder:
datos_manoderecha:
datos_manoizquierda:
datos_conde:

					
;;=====================================================
;;SUBRUTINAS
;;=====================================================
;;=====================================================
;;RESETEA_ENEMIGOS
;;=====================================================	
; función: 	inicializa todos los enemigos a tipo 0 (muerto) ... incluso los que no van a salir porque se verifican todos
;			también los oculta sacándolos de pantalla (y = 208)
; entrada:	-
; salida: 	-
; toca:		-
resetea_enemigos:
;resetea tipo (no activo)
;y de paso los oculta
		LD			IX, enemigo1
		LD			(IX), INACTIVA ; 0
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo2
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo3
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo4
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo5
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo6
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo7
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo8
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
		LD			IX, enemigo9
		LD			(IX), INACTIVA
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), INACTIVA ; 0
fin_resetea_enemigos:
		RET


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASEX
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase0:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase0_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase0_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase0_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase0_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase0_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase0_nivel5
		RET
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			 Z, .nivelboss
		CALL		inicializa_enemigos_fase0_nivel6
		RET
.nivelboss:
		JP			inicializa_enemigos_fase0_nivelboss
fin_inicializa_enemigos_fase0:
		RET

		
inicializa_enemigos_fase1:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase1_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase1_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase1_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase1_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase1_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase1_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase1_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase1_nivelboss
fin_inicializa_enemigos_fase1:
		RET
		
inicializa_enemigos_fase2:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase2_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase2_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase2_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase2_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase2_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase2_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase2_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase2_nivelboss
fin_inicializa_enemigos_fase2:
		RET

inicializa_enemigos_fase3:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase3_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase3_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase3_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase3_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase3_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase3_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase3_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase3_nivelboss
fin_inicializa_enemigos_fase3:
		RET
		
inicializa_enemigos_fase4:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase4_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase4_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase4_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase4_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase4_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase4_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase4_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase3_nivelboss
fin_inicializa_enemigos_fase4:
		RET

inicializa_enemigos_fase5:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase5_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase5_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase5_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase5_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase5_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase5_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase5_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase5_nivelboss
fin_inicializa_enemigos_fase5:
		RET

inicializa_enemigos_fase6:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 6
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase6_nivel0
.nivel1:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 5
		JP			NC, .nivel2
		CALL		inicializa_enemigos_fase6_nivel1
.nivel2:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 4
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase6_nivel2
.nivel3:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 3
		JP			NC, .nivel4
		CALL		inicializa_enemigos_fase6_nivel3
.nivel4:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 2
		JP			NC, .nivel5
		CALL		inicializa_enemigos_fase6_nivel4
.nivel5:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 1
		JP			NC, .nivel3
		CALL		inicializa_enemigos_fase6_nivel5
.nivel6:
		LD			 A, (prota_pos_mapx)
		CP			 3
		JP			NC, .nivelboss
		CALL		inicializa_enemigos_fase6_nivel6
		JP			fin_inicializa_enemigos_fase1
.nivelboss:
		CALL		inicializa_enemigos_fase6_nivelboss
fin_inicializa_enemigos_fase6:
		RET

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE0_NIVELX
;;=====================================================	
inicializa_enemigos_fase0_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel0:

inicializa_enemigos_fase0_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel1:

inicializa_enemigos_fase0_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel2:

inicializa_enemigos_fase0_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		CALL		actualiza_valores_cienpies

		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo4
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel3:

inicializa_enemigos_fase0_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		CALL		actualiza_valores_cienpies

		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo5
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo5
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel4:

inicializa_enemigos_fase0_nivel5:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		CALL		actualiza_valores_cienpies

		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo4
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo5
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo5
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo6
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo6
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel5:

inicializa_enemigos_fase0_nivel6:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo3
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo3
		CALL		actualiza_valores_cienpies

		LD			DE, enemigo4
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo4
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo5
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo5
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo6
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo6
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo6
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo6
		JP		actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel6:

inicializa_enemigos_fase0_nivelboss:	
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo2
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivelboss:



;;=====================================================
;;ANADE_ENEMIGO_CIENPIES
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del cienpies en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_cienpies
		LD			HL, datos_cienpies
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_cienpies:
		RET


;;=====================================================
;;ACTUALIZA_VALORES_CIENPIES
;;=====================================================	
; función: 	inicializa valores aleatorios del cienpies: posicion inicial (posx, posy) en la posición de enemigo que se le pase por IX
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_cienpies:
;actualiza_valores_aleatorios_cienpies
		EXX
		LD			 A, R
		AND			00000111b
		LD			 B, A
		LD			HL, posiciones_iniciales_cienpies_x
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		LD			 A, B
		LD			HL, posiciones_iniciales_cienpies_y
		CALL		suma_A_HL
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
		EXX
fin_actualiza_valores_cienpies:
		RET



;;=====================================================
;;MOVER_CIENPIES
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: E (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_cienpies:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		LD			(IY), A
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		LD			(IY + 1), A
		
		LD			 A, (heartbeat)
		OR			00000001b
		JP			 Z, .fin_cambia_escena_enemigo1   	; IF TENGO QUE CAMBIAR DE ESCENA THEN
			; cambio de escena
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
			XOR			00000001b
			LD			(IX + ESTRUCTURA_ENEMIGO.escena), A
			
			JP			 Z, .enemigo1_poner_escena2			; IF ESCENA 1 THEN
				LD			 A, CIENPIES_SPRITE1A			
				JP			.fin_enemigo1_poner_escena2
.enemigo1_poner_escena2:									; ELSE
				LD			 A, CIENPIES_SPRITE2A
.fin_enemigo1_poner_escena2:								; END IF
.fin_cambia_escena_enemigo1:							; END IF			

		LD			(IY + 2), A		
		LD			(IY + 3), CIENPIES_COLOR
fin_mover_cienpies:
		RET


	
	

inicializa_enemigos_fase1_nivel0:
inicializa_enemigos_fase1_nivel1:
inicializa_enemigos_fase1_nivel2:
inicializa_enemigos_fase1_nivel3:
inicializa_enemigos_fase1_nivel4:
inicializa_enemigos_fase1_nivel5:
inicializa_enemigos_fase1_nivel6:
inicializa_enemigos_fase1_nivelboss:

inicializa_enemigos_fase2_nivel0:
inicializa_enemigos_fase2_nivel1:
inicializa_enemigos_fase2_nivel2:
inicializa_enemigos_fase2_nivel3:
inicializa_enemigos_fase2_nivel4:
inicializa_enemigos_fase2_nivel5:
inicializa_enemigos_fase2_nivel6:
inicializa_enemigos_fase2_nivelboss:

inicializa_enemigos_fase3_nivel0:
inicializa_enemigos_fase3_nivel1:
inicializa_enemigos_fase3_nivel2:
inicializa_enemigos_fase3_nivel3:
inicializa_enemigos_fase3_nivel4:
inicializa_enemigos_fase3_nivel5:
inicializa_enemigos_fase3_nivel6:
inicializa_enemigos_fase3_nivelboss:

inicializa_enemigos_fase4_nivel0:
inicializa_enemigos_fase4_nivel1:
inicializa_enemigos_fase4_nivel2:
inicializa_enemigos_fase4_nivel3:
inicializa_enemigos_fase4_nivel4:
inicializa_enemigos_fase4_nivel5:
inicializa_enemigos_fase4_nivel6:
inicializa_enemigos_fase4_nivelboss:

inicializa_enemigos_fase5_nivel0:
inicializa_enemigos_fase5_nivel1:
inicializa_enemigos_fase5_nivel2:
inicializa_enemigos_fase5_nivel3:
inicializa_enemigos_fase5_nivel4:
inicializa_enemigos_fase5_nivel5:
inicializa_enemigos_fase5_nivel6:
inicializa_enemigos_fase5_nivelboss:

inicializa_enemigos_fase6_nivel0:
inicializa_enemigos_fase6_nivel1:
inicializa_enemigos_fase6_nivel2:
inicializa_enemigos_fase6_nivel3:
inicializa_enemigos_fase6_nivel4:
inicializa_enemigos_fase6_nivel5:
inicializa_enemigos_fase6_nivel6:
inicializa_enemigos_fase6_nivelboss:






check_enemigos_fase0: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem

		CALL		mover_cienpies

		;acciones enemigos
		
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4

		CALL		mover_cienpies

		;acciones enemigos

.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8

		CALL		mover_cienpies

		;acciones enemigos

.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 12

		CALL		mover_cienpies

		;acciones enemigos
		
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 16

		CALL		mover_cienpies

		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 20

		CALL		mover_cienpies

		;acciones enemigos
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo8
		
		LD			IY, array_sprites_enem + 24

		CALL		mover_cienpies

		;acciones enemigos
.check_enemigo8:
		LD			IX, enemigo8
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo9
		
		LD			IY, array_sprites_enem + 28

		CALL		mover_cienpies

		;acciones enemigos
.check_enemigo9:
fin_check_enemigos_fase0:
		RET			





