;;=====================================================
;;LOCALIZA_INFO_HABITACION
;;=====================================================	
; función: 	busca las puertas que hay que pintar egún la posición del usuario y las pone en A
; entrada: 	prota.pos_mapy, prota.pos_mapx, prota_nivel habitaciones_juego
; salida: 	habitacion_actual
; toca:		todo
;ejemplo: nivel 4, posx 5 y posy 3
;  (4 x 7) x 16 (se necesitan dos bytes y el prod de 16 es slr 4 veces)
; +(3 x 16) 	de la fila (se necesita 1 y byte el prod de 16 es slr 4 veces)
; +5        	de la columna 
localiza_info_habitacion:
;primer sumando	(en el ejemplo + (4x7)x16)
		LD		HL, habitaciones_juego
		LD		 A, (prota_nivel)	
		OR		 A
		JR		 Z, .no_suma_niveles_previos	;el primero nivel (0) no sumaría ni uno por lo que salto al segundo sumando
	;sumo 7 veces el nº de nivel si no es cero
		LD		 D, A
		LD		 B, 6
.primer_producto
		ADD		 A, D
		DJNZ	 .primer_producto
		LD		 B, A				;guardo el resultado en B

;el resultado previo está en B. Ahoro hay que multiplicar A x 16, lo guardo en DE y lo sumo en HL
		;inicializo valores a 0
		XOR		 A
		LD		 D, A
		LD		 E, A
		LD		 H, A
		LD		 L, A

		LD		 E, B				;pongo el (4x7) en HL (estaba en B)
		
		LD		 B, 16
.segundo_producto
		ADD		HL, DE				;segundo producto x 16
		DJNZ	.segundo_producto	
		
.fin_seg_prod:
	;coloco puntero DE al inicio de las habitaciones y le sumo para poner el puntero en el nivel que me interesa
		LD		DE, habitaciones_juego
		ADD		HL, DE				;suma el nº de bytes de los niveles previos (4 x 7 x 16)
.no_suma_niveles_previos:

;ya tengo el puntero HL al inicio del nivel que me interesa

;segundo sumando (en el ejemplo + 3x16)
	LD		 A,(prota_pos_mapy)
[4]	SLA		 A				;equivalente a 3 x 16			

	LD		 E, A
	XOR		 A
	LD		 D, A
	ADD		HL, DE			;equivale a 4x7x16 (HL) + 3x16 (DE)

;tercer sumando (en el ejemplo + 5)
	LD		 A, (prota_pos_mapx)
	LD		 B, A
.situa_columna:
[2]	INC		HL
	DJNZ	.situa_columna

;ya tengo el puntero HL al inicio de la fila que me interesa

;colocamos resultado en habitación actual
	LD		IX, habitacion_actual
	LD		 A, (HL)
	LD		(IX), A
	INC		HL
	LD		 A, (HL)
	LD		(IX+1), A
	
	
	
	
	;~ LD		a, 00001111b
	;~ ld		(habitacion_actual), a

fin_localiza_info_habitacion:
	RET




efecto_imagen_tira_reliquia:
	LD		 A, (contdor_efecto_reliquia)
	DEC		 A
	LD		(contdor_efecto_reliquia), A
	
	CP		 7
	JP		NC, .intercambia_color_fondo
	LD		 A, RETARDOREL
	LD		(contdor_efecto_reliquia), A
	;toca A y direcciones #F3E9/#F3EA/#F3EB, poner en HL array con 3 valores
	LD		HL, color_base
	JP		color_pantalla
	;CALL/RET	
	
.intercambia_color_fondo:
	BIT		 2, A
	JP		 Z, .otro_fondo
	LD		HL, color_bomba1
	JP		color_pantalla
.otro_fondo:
	LD		HL, color_bomba2
	JP		color_pantalla
fin_efecto_imagen_tira_reliquia:
	;CALL/RET
