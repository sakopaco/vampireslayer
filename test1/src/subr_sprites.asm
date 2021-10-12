
;;=====================================================
;;SUBRUTINAS ENCARGADAS DE MANEJAR LOS SPRITES
;;=====================================================	


;; PREGUNTAR SI A FERNANDO SI ES MEJOR USAR LISTAS O ALGO PARA AHORRAR CÓDIGO




;;=====================================================
;;CARGA_PATRONES_SPRITES_NIVEL
;;=====================================================	
; función: 	examina el nivel y carga los patrones específicos necesarios
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel:
	CALL 	carga_patrones_nivel_comunes
	
	RET		;*********************
	
	
	
	;~ ;carga patrones no comunes
	;~ LD		 A, (prota_nivel)
	;~ OR		 A
	;~ JP		 Z, carga_patrones_sprites_nivel donde esté el prota
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
;;CARGA_PATRONES_SPRITES_NIVEL1
;;=====================================================	
; función: 	copia los patrones de los sprites que e van a usar en el nivel 1 en vram
; entrada: 	-
; salida: 	-
; toca: 	-
carga_patrones_sprites_nivel1:

	;~ ;sprite sprite_reliquia
	;~ LD		HL,sprite_reliquia
	;~ LD		DE,#3880
	;~ LD		BC,32				;32 bytes (sprites de 2 x 2)
	;~ CALL	LDIRVM

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
fin_actualiza_array_sprites_vram:


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

