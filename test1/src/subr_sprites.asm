
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
; toca: 	todos los registros excepto los principales en EXX y AF 
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
actualiza_array_sprites_vram:
fin_actualiza_array_sprites_vram:
	RET
