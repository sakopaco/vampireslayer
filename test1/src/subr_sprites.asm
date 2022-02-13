
;;=====================================================
;;SUBRUTINAS ENCARGADAS DE MANEJAR LOS SPRITES
;;=====================================================	


;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVEL
;;=====================================================	
; función: 	examina el nivel y carga los patrones específicos necesarios
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel:
		CALL 		carga_patrones_nivel_comunes

		;carga patrones no comunes según nivel donde está el prota
		LD		 	 A, (prota_nivel)
		OR		 	 A
		JP		 	NZ, .examina_nivel1
		CALL		carga_patrones_sprites_nivel0	
		RET
.examina_nivel1:
		DEC			 A
		JP			NZ, .examina_nivel2
		CALL		carga_patrones_sprites_nivel1
		RET
.examina_nivel2:
		DEC			 A
		JP			NZ, .examina_nivel3
		CALL		carga_patrones_sprites_nivel2
		RET
.examina_nivel3:
		DEC			 A
		JP			NZ, .examina_nivel4
		CALL		carga_patrones_sprites_nivel3
		RET
.examina_nivel4:
		DEC			 A
		JP			NZ, .examina_nivel5
		CALL		carga_patrones_sprites_nivel4
		RET
.examina_nivel5:
		DEC			 A
		JP			NZ, .carga_nivel6
		CALL		carga_patrones_sprites_nivel5
		RET
.carga_nivel6:
		JP			carga_patrones_sprites_nivel5
fin_carga_patrones_sprites_nivel:



;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVEL_COMUNES
;;=====================================================	
; función: 	carga los patrones comunes en todos los niveles
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_nivel_comunes:	
	LD		HL, sprites_comunes
	LD		DE, SPRTBL
	LD		BC, fin_sprites_comunes-sprites_comunes
	JP		LDIRVM
fin_carga_patrones_nivel_comunes:


;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVELX
;;=====================================================	
; función: 	copia los patrones de los sprites que se van a usar en el nivel 1 en vram
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel0:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel0:
	
carga_patrones_sprites_nivel1:		
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel1:
	
	
carga_patrones_sprites_nivel2:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel2:

	
carga_patrones_sprites_nivel3:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel3:

	
carga_patrones_sprites_nivel4:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel4:

	
carga_patrones_sprites_nivel5:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel5:
	
	
carga_patrones_sprites_nivel6:
		LD			HL, sprite_cienpies
		LD			DE, #38C0 + fin_sprite_cienpies - sprite_cienpies
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_serpiente
		LD			DE, #3900 + fin_sprite_serpiente - sprite_serpiente
		LD			BC, 128			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_arana
		LD			DE, #3980 + fin_sprite_arana - sprite_arana
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_murcielago
		LD			DE, #39C0 + fin_sprite_murcielago - sprite_murcielago
		LD			BC, 64			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_lobo
		LD			DE, #3A00 + fin_sprite_lobo - sprite_lobo
		LD			BC, 256			;32 * 8 sprites de 4 x 4				
		CALL		LDIRVM
		
		LD			HL, sprite_jefelobo
		LD			DE, #3A00 + fin_sprite_jefelobo - sprite_jefelobo
		LD			BC, 512			;32 * 16 sprites de 4 x 4				
		JP			LDIRVM
fin_carga_patrones_sprites_nivel6:


;;=====================================================
;;RENDER_SPRITES // ACTUALIZA_ARRAY_SPRITES_VRAM
;;=====================================================	
; función: 	copia el array con los valores de los sprites (pos, color, plano) en VRAM
; entrada: 	-
; salida: 	-
; toca: 	todos los registros. Como me interesa la velocidad, si necesito copiar de algo lo hago fuera
render_sprites:
	;volcando el array con toda la info de los sprites a la zona de atributos de sprites
	LD			HL, array_sprites
	LD			DE, SPRART
	LD			BC, 4 * 4			;32 sprites x 4 bytes controlando el sprite (Y, X, plano, color)
	CALL		LDIRVM

	LD			HL, array_sprites_enem
	LD			DE, SPRART + 8
	LD			BC, 4 * 28			;32 sprites x 4 bytes controlando el sprite (Y, X, plano, color)
	JP			LDIRVM
fin_actualiza_array_sprites_vram:


;;=====================================================
;;VUELCA_RESULTADO_PUNTOMIRA_ARRAY
;;=====================================================	
; función: 	coloca los valores del punto de mira en la variable array_sprites para ser volcados en VRAM
; entrada: 	array_sprites_pm, puntomira
; salida: 	-
; toca: 	-
vuelca_resultado_puntomira_array:
	LD		IX, array_sprites_pm
	LD		IY, puntomira
	;posición y de los dos sprites que conforman el punto de mira
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posy)
	LD		(IX  ), A
	LD		(IX+4), A
	;posición x de los dos sprites que conforman el punto de mira
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posx)
	LD		(IX+1), A
	LD		(IX+5), A
	;plano
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.spritea)
	LD		(IX+2), A
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.spriteb)
	LD		(IX+6), A
	;color
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.escena)
	OR		 A
	JP		NZ,.codigo_color_2
.codigo_color_1:
	LD		(IX+3), COLBLANCO
	LD		(IX+7), COLROJO
	RET
.codigo_color_2:
	LD		(IX+3), COLROJO
	LD		(IX+7), COLBLANCO
	RET
fin_vuelca_resultado_puntomira_array:


;;=====================================================
;;CHECK_PLAYER
;;=====================================================	
; función: 	MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
; entrada: 	-
; salida: 	-
; toca: 	A
check_player:
	CALL	update_controllers_status
	OR		 A
	RET		 Z						;si no se ha pulsado nada no se necesita mirar nada

	LD		IX, puntomira		;variable de entrada para las subrutinas mueve_dirección
	RR		 A
	CALL	 C, mueve_arriba
	RR		 A
	CALL	 C, mueve_abajo
	RR		 A
	CALL	 C, mueve_izquierda
	RR		 A
	CALL	 C, mueve_derecha
	
	;zona para mirar disparo Recibe A que tendrá 0000 0 0 X-letra M X-espacio 
	CALL	mira_disparo

	JP		vuelca_resultado_puntomira_array
f;in_check_player:
	RET

