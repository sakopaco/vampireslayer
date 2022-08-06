;;=====================================================
;;SUBRUTINAS ENCARGADAS DE MANEJAR LOS SPRITES
;;=====================================================	


;;=====================================================
;;CARGA PATRONES SPRITES
;;=====================================================	
carga_patrones_cienpies:
		LD			HL, sprite_cienpies
		LD			DE, #38C0
		LD			BC, fin_sprite_cienpies - sprite_cienpies			;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_cienpies:
		RET

carga_patrones_serpiente:
		LD			HL, sprite_serpiente
		LD			DE, #3900
		LD			BC, fin_sprite_serpiente - sprite_serpiente			;32 * 4 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_serpiete:
		RET

carga_patrones_arana:
		LD			HL, sprite_arana
		LD			DE, #3980
		LD			BC, fin_sprite_arana - sprite_arana					;32 * 2 sprites de 4 x 4				
		CALL		LDIRVM
fin_carga_patrones_arana:
		RET

carga_patrones_murcielago:
		LD			HL, sprite_murcielago
		LD			DE, #39C0
		LD			BC, fin_sprite_murcielago - sprite_murcielago
		CALL		LDIRVM
fin_carga_patrones_murcielago:
		RET

carga_patrones_lobo:
		LD			HL, sprite_lobo
		LD			DE, #3A00
		LD			BC, fin_sprite_lobo - sprite_lobo
		CALL		LDIRVM
fin_carga_patrones_lobo:
		RET

carga_patrones_esqueleto:
		LD			HL, sprite_esqueleto
		LD			DE, #3B00
		LD			BC, fin_sprite_esqueleto - sprite_esqueleto
		CALL		LDIRVM
fin_carga_patrones_esqueleto:
		RET

carga_patrones_zombi:
		LD			HL, sprite_zombi
		LD			DE, #3C00
		LD			BC, fin_sprite_zombi - sprite_zombi
		CALL		LDIRVM
fin_carga_patrones_zombi:
		RET

carga_patrones_fantasma:
		LD			HL, sprite_fantasma
		LD			DE, #3D00
		LD			BC, fin_sprite_fantasma - sprite_fantasma
		CALL		LDIRVM
fin_carga_patrones_fantasma:
		RET

carga_patrones_caballero:
		LD			HL, sprite_caballero
		LD			DE, #3A00
		LD			BC, fin_sprite_caballero - sprite_caballero
		CALL		LDIRVM
fin_carga_patrones_caballero:
		RET

carga_patrones_fuego:
		LD			HL, sprite_fuego
		LD			DE, #3D80
		LD			BC, fin_sprite_fuego - sprite_fuego
		CALL		LDIRVM
fin_carga_patrones_fuego:
		RET

carga_patrones_magia:
		LD			HL, sprite_magia
		LD			DE, #3900
		LD			BC, fin_sprite_magia - sprite_magia
		CALL		LDIRVM
fin_carga_patrones_magia:
		RET

carga_patrones_jefelobo:
		LD			HL, sprite_jefelobo
		LD			DE, #3E00
		LD			BC, fin_sprite_jefelobo - sprite_jefelobo
		CALL		LDIRVM
fin_carga_patrones_jefelobo:
		RET

carga_patrones_jefemurcielago:
		LD			HL, sprite_jefemurcielago
		LD			DE, #3F00
		LD			BC, fin_sprite_jefemurcielago - sprite_jefemurcielago
		CALL		LDIRVM
fin_carga_patrones_jefemurcielago:
		RET

carga_patrones_jefefantasma:
		LD			HL, sprite_jefefantasma
		LD			DE, #3F00
		LD			BC, fin_sprite_jefefantasma - sprite_jefefantasma
		CALL		LDIRVM
fin_carga_patrones_jefefantasma:
		RET

carga_patrones_jefezombi:
		LD			HL, sprite_jefezombi
		LD			DE, #3E00
		LD			BC, fin_sprite_jefezombi - sprite_jefezombi
		CALL		LDIRVM
fin_carga_patrones_jefezombi:
		RET

carga_patrones_jefecaballero:
		LD			HL, sprite_jefecaballero
		LD			DE, #3E00
		LD			BC, fin_sprite_jefecaballero - sprite_jefecaballero
		CALL		LDIRVM
fin_carga_patrones_jefecaballero:
		RET

carga_patrones_jefebeholder:
		LD			HL, sprite_jefebeholder
		LD			DE, #3F00
		LD			BC, fin_sprite_jefebeholder - sprite_jefebeholder
		CALL		LDIRVM
fin_carga_patrones_jefebeholder:
		RET

carga_patrones_condecompleto:
		LD			HL, sprite_manoizquierda
		LD			DE, #3F00
		LD			BC, fin_sprite_conde - sprite_manoizquierda
		CALL		LDIRVM
fin_carga_patrones_condecompleto
		RET
		

;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVEL
;;=====================================================	
; función: 	examina el nivel y carga los patrones específicos necesarios
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel:
		CALL 		carga_patrones_nivel_comunes

		LD		 	 A, (prota_nivel)
		OR		 	 A
		;carga patrones no comunes según nivel donde está el prota
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
		;nota: el resto de esta función en teoría no sirve para nada y se cargan los sprites al entrar en cada habitación
		;en las funciones inicializa_enemigos_fase6_nivelX
.subnivel0:
		LD			 A, (prota_pos_mapy)
		OR			 A
		JP			NZ, .subnivel1
		CALL		carga_patrones_sprites_nivel6_nivel0
		RET
.subnivel1:
		DEC			 A
		JP			NZ, .subnivel2
		CALL		carga_patrones_sprites_nivel6_nivel1
		RET
.subnivel2:
		DEC			 A
		JP			NZ, .subnivel3
		CALL		carga_patrones_sprites_nivel6_nivel2
		RET		
.subnivel3:
		DEC			 A
		JP			NZ, .subnivel4
		CALL		carga_patrones_sprites_nivel6_nivel3
		RET
.subnivel4:
		DEC			 A
		JP			NZ, .subnivel5
		CALL		carga_patrones_sprites_nivel6_nivel4
		RET		
.subnivel5:
		DEC			 A
		JP			NZ, .subnivel6
		CALL		carga_patrones_sprites_nivel6_nivel5
		RET	
.subnivel6:
		JP			carga_patrones_sprites_nivel6_nivel6
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
;;CARGA_PATRONES_SPRITES_NIVEL X
;;=====================================================	
; función: 	copia los patrones de los sprites que se van a usar en el nivel X en vram
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel0:
		CALL		carga_patrones_cienpies
		CALL		carga_patrones_arana
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		JP			carga_patrones_jefelobo
fin_carga_patrones_sprites_nivel0:
	
carga_patrones_sprites_nivel1:		
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_arana
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		JP			carga_patrones_jefemurcielago
fin_carga_patrones_sprites_nivel1:
	
carga_patrones_sprites_nivel2:	
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		JP			carga_patrones_jefefantasma
fin_carga_patrones_sprites_nivel2:
	
carga_patrones_sprites_nivel3:
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_arana
		CALL		carga_patrones_caballero
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		JP			carga_patrones_jefezombi
fin_carga_patrones_sprites_nivel3:

carga_patrones_sprites_nivel4:
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_caballero
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		CALL		carga_patrones_fuego
		JP			carga_patrones_jefecaballero
fin_carga_patrones_sprites_nivel4:

carga_patrones_sprites_nivel5:
		CALL		carga_patrones_magia
		CALL		carga_patrones_caballero
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		CALL		carga_patrones_fuego
		JP			carga_patrones_jefebeholder
fin_carga_patrones_sprites_nivel5:
	
carga_patrones_sprites_nivel6_nivel0:
		JP			carga_patrones_jefelobo
fin_carga_patrones_sprites_nivel6_nivel0:

carga_patrones_sprites_nivel6_nivel1:
		JP			carga_patrones_jefemurcielago
fin_carga_patrones_sprites_nivel6_nivel1:

carga_patrones_sprites_nivel6_nivel2:
		JP			carga_patrones_jefefantasma
fin_carga_patrones_sprites_nivel6_nivel2:

carga_patrones_sprites_nivel6_nivel3:
		JP			carga_patrones_jefezombi
fin_carga_patrones_sprites_nivel6_nivel3:

carga_patrones_sprites_nivel6_nivel4:
		JP			carga_patrones_jefecaballero
fin_carga_patrones_sprites_nivel6_nivel4:

carga_patrones_sprites_nivel6_nivel5:
		JP			carga_patrones_jefebeholder
fin_carga_patrones_sprites_nivel6_nivel5:

carga_patrones_sprites_nivel6_nivel6:
		JP			carga_patrones_condecompleto
fin_carga_patrones_sprites_nivel6_nivel6:


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
	LD			IX, array_sprites_pm
	LD			IY, puntomira
	;posición y de los dos sprites que conforman el punto de mira
	LD			 A, (IY + ESTRUCTURA_PUNTOMIRA.posy)
	LD			(IX  ), A
	LD			(IX+4), A
	;posición x de los dos sprites que conforman el punto de mira
	LD			 A, (IY + ESTRUCTURA_PUNTOMIRA.posx)
	LD			(IX+1), A
	LD			(IX+5), A
	;plano
	LD			 A, (IY + ESTRUCTURA_PUNTOMIRA.spritea)
	LD			(IX+2), A
	LD			 A, (IY + ESTRUCTURA_PUNTOMIRA.spriteb)
	LD			(IX+6), A
	;color
	LD			 A, (IY + ESTRUCTURA_PUNTOMIRA.escena)
	OR			 A
	JP			NZ,.codigo_color_2
.codigo_color_1:
	LD			(IX+3), COLBLANCO
	LD			(IX+7), COLROJO
	RET
.codigo_color_2:
	LD			(IX+3), COLROJO
	LD			(IX+7), COLBLANCO
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
		CALL		update_controllers_status
		OR			 A
		RET			 Z					;si no se ha pulsado nada no se necesita mirar nada

		LD			IX, puntomira		;variable de entrada para las subrutinas mueve_dirección
		RR			 A
		CALL		 C, mueve_arriba
		RR			 A
		CALL		 C, mueve_abajo
		RR			 A
		CALL		 C, mueve_izquierda
		RR			 A
		CALL		 C, mueve_derecha
	
		;zona para mirar disparo Recibe A que tendrá 0000 0 0 X-letra M X-espacio 
		CALL		mira_disparo

		JP			vuelca_resultado_puntomira_array
fin_check_player:


