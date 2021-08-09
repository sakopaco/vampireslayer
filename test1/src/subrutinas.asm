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
	LD		 A, (prota_vidas)
	OR		 A
	RET 	 Z
	LD		 B, A
	LD		HL, array_aux_vidas
loop_marcador_caras: ;asignar caras
	LD		(HL), POSCARAMAP	;13 posición mapa tiles para cara
	INC		HL
	DJNZ	loop_marcador_caras
fin_loop_marcador_caras:

fin_actualiza_marcador_vidas:
	RET


;;=====================================================
;;ACTUALIZA_BUFFER_RELIQUIAS
;;=====================================================	
; función: 	actualiza buffer de reliquias
; entrada: 	prota_reliquias
; salida: 	array_aux_reliquias
; toca:		A,B,HL
actualiza_buffer_reliquias:	
	;para no andar restando pongo todos los huecos a negro y luego en otro bucle las reliquias
	;1-pinto todo en blanco
	LD		HL, array_aux_reliquias
	LD		 B, NMAXVIDREL
	XOR		 A
loop_buffer_reliquias_negro:	;asignar espacios en negro
	LD		(HL), A			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	INC		HL
	DJNZ	loop_buffer_reliquias_negro

	;2-pinto las cruces según el n de reliquias
	LD		HL, array_aux_reliquias
	LD		 A, (prota_reliquias)
	OR		 A
	RET		 Z
	LD		 B, A
loop_buffer_reliquias: ;asignar reliquias
	LD		(HL), POSRELIMAP	;17 posición mapa tiles para reliquia
	INC		HL
	DJNZ	loop_buffer_reliquias
fin_actualiza_buffer_reliquias:
	RET



;;=====================================================
;;LOCALIZA_INFO_HABITACION
;;=====================================================	
; función: 	busca las puertas que hay que pintar egún la posición del usuario y las pone en A
; entrada: 	prota.pos_mapy, prota.pos_mapx, prota_nivel habitaciones_juego
; salida: 	habitacion_actual
; toca:		todo
;ejemplo: nivel 4, posx 5 y posy 3
;3 + 5 x 8 + 4 x 49
localiza_info_habitacion:
;primer sumando	(en el ejemplo + (4x7)x16)
	LD		HL, habitaciones_juego
	
	LD		 A, (prota_pos_mapy)
	SLA		 A
	LD		 B, A
	LD		 C, 0
	

	ADD 	HL, BC

	
	LD		 A, (HL)
	LD		(habitacion_actual), A
fin_localiza_info_habitacion:
	RET




