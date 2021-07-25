;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;INICIALIZA_NIVELES
;;=====================================================	
; función: 	copia la plantilla de niveles (habitaciones_plantilla) en los niveles de trabajo para el juego (habitaciones_juego)
; entrada: 	habitaciones_plantilla
; salida: 	habitaciones_juego
; toca: 	A
inicializa_niveles:
	EXX
	
	XOR		 A
	LD		 B, 49				;7 filas por 7 niveles menos el primero que lo hago diera del buble porque se suma 14 y no 16
	LD		HL, habitaciones_juego;tambíen puntero al primer nivel
	LD		DE,14
	ADD		HL,DE
	LD		(HL),A
	LD		DE,16				;desde las col 15 de una fila a la siguiente
.bucle_borra_hab:
	ADD		HL,DE
	LD		(HL),A
	DJNZ	.bucle_borra_hab
	
	EXX
fin_iniciliza_niveles:
	RET


;;=====================================================
;;ACTUALIZA_MARCADOR_VIDAS
;;=====================================================	
; función:  actualiza el buffer de vidas
; entrada: 	prota_vidas
; salida: 	array_aux_vidas
; toca:		A,B,HL
actualiza_marcador_vidas:
	EXX

	;para no andar restando pongo todos los huecos a negro y luego en otro bucle las caras
	;1-pinto todo en blanco
	LD		HL,array_aux_vidas
	LD		 B,NMAXVIDREL
loop_marcador_caras_negro:	;asignar espacios en negro
	LD		(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	INC		HL
	DJNZ	loop_marcador_caras_negro
fin_loop_marcador_caras_negro:
	;2-pinto las caras según el n de vidas
	LD		HL,array_aux_vidas
	LD		 A,(prota_vidas)
	LD		 B,A
loop_marcador_caras: ;asignar caras
	LD		(HL),POSCARAMAP	;13 posición mapa tiles para cara
	INC		HL
	DJNZ	loop_marcador_caras
fin_loop_marcador_caras:

	EXX
fin_actualiza_marcador_vidas:
	RET


;;=====================================================
;;ACTUALIZA_MARCADOR_RELIQUIAS
;;=====================================================	
; función: 	actualiza buffer de reliquias
; entrada: 	prota_reliquias
; salida: 	array_aux_reliquias
; toca:		A,B,HL
actualiza_marcador_reliquias:
	;para no andar restando pongo todos los huecos a negro y luego en otro bucle las reliquias
	;1-pinto todo en blanco
	LD		HL, array_aux_reliquias
	LD		 B, NMAXVIDREL
loop_marcador_reliquias_negro:	;asignar espacios en negro
	LD		(HL), 0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	INC		HL
	DJNZ	loop_marcador_reliquias_negro
fin_loop_marcador_reliquias_negro:
	;2-pinto las cruces según el n de reliquias
	LD		HL, array_aux_reliquias
	LD		 A, (prota_reliquias)
	LD		 B, A
loop_marcador_reliquias: ;asignar reliquias
	LD		(HL), POSRELIMAP	;17 posición mapa tiles para reliquia
	INC		HL
	DJNZ	loop_marcador_reliquias
fin_loop_marcador_reliquias:
fin_actualiza_marcador_reliquias:
	RET



;;=====================================================
;;LOCALIZA_INFO_HABITACION
;;=====================================================	
; función: 	busca las puertas que hay que pintar egún la posición del usuario y las pone en A
; entrada: 	prota.pos_mapy, prota.pos_mapx, prota_nivel habitaciones_juego
; salida: 	habitacion_actual
; toca:		A
;ejemplo: nivel 4, posx 5 y posy 3
;  (4 x 7) x 16 (se necesitan dos bytes y el prod de 16 es slr 4 veces)
; +(3 x 16) 	de la fila (se necesita 1 y byte el prod de 16 es slr 4 veces)
; +5        	de la columna 
localiza_info_habitacion:
		EXX

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
	LD		 A,(prota.pos_mapy)
[4]	SLA		 A				;equivalente a 3 x 16			

	LD		 E, A
	XOR		 A
	LD		 D, A
	ADD		HL, DE			;equivale a 4x7x16 (HL) + 3x16 (DE)

;tercer sumando (en el ejemplo + 5)
	LD		 A, (prota.pos_mapx)
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
	
	EXX
fin_localiza_info_habitacion:
	RET




