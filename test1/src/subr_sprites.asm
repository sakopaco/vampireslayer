
;;=====================================================
;;SUBRUTINAS ENCARGADAS DE MANEJAR LOS SPRITES
;;=====================================================	


;; PREGUNTAR SI A FERNANDO SI ES MEJOR USAR LISTAS O ALGO PARA AHORRAR CÓDIGO


;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVEL1
;;=====================================================	
; función: 	copia los patrones de los sprites que e van a usar en el nivel 1 en vram
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel1:
	PUSH	AF					;guardo copia de AF
	EXX							;guardo copia de BC,DE y HL
	
	;sprite punto de mira		(este no será necesario cargarlo en ningún otro nivel del juego, sólo el primero)
	LD		HL,sprite_punto_mira_1
	LD		DE,#3800
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_punto_mira_2
	LD		DE,#3820
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	
	;sprite sprite_punto_mira_1_mejorado
	LD		HL,sprite_punto_mira_1_mejorado
	LD		DE,#3840
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_punto_mira_2_mejorado
	LD		DE,#3860
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM

	;sprite sprite_reliquia
	LD		HL,sprite_reliquia
	LD		DE,#3880
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM

	;sprite sprite_vida_extra
	LD		HL,sprite_reliquia
	LD		DE,#38A0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM

	;sprite sprite_planta
	LD		HL,sprite_planta
	LD		DE,#38C0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	
	;sprite sprite_ballesta_mejorada
	LD		HL,sprite_ballesta_mejorada
	LD		DE,#38E0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM

	;sprite sprite_ciempies
	LD		HL,sprite_ciempies1
	LD		DE,#3900
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_ciempies2
	LD		DE,#3920
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM		

	;sprite sprite_arana
	LD		HL,sprite_arana1
	LD		DE,#3940
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_arana2
	LD		DE,#3960
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM	

	;sprite sprite_serpiente
	LD		HL,sprite_serpiente1
	LD		DE,#3980
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_serpiente2
	LD		DE,#39A0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM	

	;sprite sprite_murcielago
	LD		HL,sprite_murcielago1
	LD		DE,#39C0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	LD		HL,sprite_murcielago2
	LD		DE,#39E0
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	
	;sprite sprite_explosion
	LD		HL,sprite_explosion
	LD		DE,#3A20
	LD		BC,32				;32 bytes (sprites de 2 x 2)
	CALL	LDIRVM
	
	EXX							;recupero copia de BC,DE y HL
	POP		AF					;recupero copia de AF
fin_carga_patrones_sprites:
	RET


;;=====================================================
;;ACTUALIZA_ARRAY_SPRITES_VRAM
;;=====================================================	
; función: 	copia el array con los valores de los sprites (pos, color, plano) en VRAM
; entrada: 	-
; salida: 	-
; toca: 	todos los registros. Como me interesa la velocidad, si necesito copiar de algo lo hago fuera
render_sprites:
	;volcando el array con toda la info de los sprites a la zona de atributos de sprites
	LD		HL,array_sprites
	LD		DE,SPRART
	LD		BC,4 * 32				;32 sprites x 4 bytes controlando el sprite (Y, X, plano, color)
	JP		LDIRVM
	;~ CALL	LDIRVM
fin_actualiza_array_sprites_vram:
	;~ RET




;;=====================================================
;;VUELCA_RESULTADO_PUNTOMIRA_ARRAY
;;=====================================================	
; función: 	coloca los valores del punto de mira en la variable array_sprites para ser volcados en VRAM
; entrada: 	array_sprites_pm, prota.XXXXX
; salida: 	-
; toca: 	-
vuelca_resultado_puntomira_array:
	LD		IX, array_sprites_pm
	;posición y de los dos sprites que conforman el punto de mira
	LD		 A, (prota.posy)
	LD		(IX  ), A
	LD		(IX+4), A
	;posición x de los dos sprites que conforman el punto de mira
	LD		 A, (prota.posx)
	LD		(IX+1), A
	LD		(IX+5), A
	;plano
	LD		(IX+2), 0
	LD		(IX+6), 4	;al ser sprites de 16x16 hay que ir de 4 en 4
	;color
	LD		 A, (prota.escena)
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


