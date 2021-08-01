

;;=====================================================
;;MUEVE_ARRIBA
;;=====================================================	
; función: 	decrementa y si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	DEC			 A
	JP			 Z,.no_decrementa_y
	LD			(prota.posy), A
	
.no_decrementa_y:
	POP			AF
fin_mueve_arriba:
	RET
	
	
;;=====================================================
;;MUEVE_ARRIBA_DERECHA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba_derecha:
	
	CALL		mueve_arriba
	JP			mueve_derecha
	
fin_mueve_arriba_derecha:
	;RET


;;=====================================================
;;MUEVE_DERECHA
;;=====================================================	
; función: 	incrementa si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	INC			 A
	CP			 A, LIMPANTDER - 16
	JP			 Z, .no_incrementa_x
	LD			(prota.posx), A
	
.no_incrementa_x:
	POP			AF
fin_mueve_derecha:
	RET

;;=====================================================
;;MUEVE_DERECHA_ABAJO
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha_abajo:
	
	CALL		mueve_derecha
	JP			mueve_abajo
	
fin_mueve_derecha_abajo:
;	RET

;;=====================================================
;;MUEVE_ABAJO
;;=====================================================	
; función: 	incrementa y si se no sale de los límites el valor del punto de mira abajo
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	INC			 A
	CP			 A, LIMPANTABA - 16
	JP			 Z,.no_incrementa_y
	LD			(prota.posy), A
	
.no_incrementa_y:
	POP			AF
fin_mueve_abajo:
	RET
	

;;=====================================================
;;MUEVE_ABAJO_IZQUIERDA
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo_izquierda:
	
	CALL		mueve_abajo
	JP			mueve_izquierda

fin_mueve_abajo_izquierda:
	;RET

	
;;=====================================================
;;MUEVE_IZQUIERDA
;;=====================================================	
; función: 	decrementa x si se no sale de los límites el valor del punto de mira a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	DEC			 A
;	CP			 A, LIMPANTIZQ
	JP			 Z,.no_decrementa_x
	LD			(prota.posx), A
	
.no_decrementa_x:
	POP			AF
fin_mueve_izquierda:
	RET


;;=====================================================
;;MUEVE_IZQUIERDA_ARRIBA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda_arriba:

	CALL		mueve_izquierda
	JP			mueve_arriba

fin_mueve_izquierda_arriba:
	;RET




;;=====================================================
;;OBTIENE TECLA PULSADA
;;=====================================================	
; función: 	devuelve un valor entre 1 y 8 según la dirección de teclas pulsada
; entrada: 	-
; salida: 	teclas_pulsadas
; toca: 	
obtiene_tecla_pulsada:
	;primero vacio la variable teclas_pulsadas
	;XXPS para disparo primario  y secundario
	;DDDD para movimientos 
	XOR		 A
	LD		 D, A 					;inicializo D porque guardaré el resultado ahí y luego lo mando a teclas_pulsadas

	;segundo examino la fila 6 y bit 0 para ver si se ha pulsado SHIFT en cuyo caso vale 0
	LD		 B, 6
	
	IN		 A, (#AA)
    AND		#F0
    OR		 B
    OUT		(#AA), A
    IN		 A, (#A9)
	
	BIT		 0, A					;Se ha pulsado shift?
	JP		 NZ, .finsi_pulsado_shift
	LD		 A, 00010000b
	LD		D, A					;pongo el bit 5 de la D a 1
.finsi_pulsado_shift:

	LD		 B, 8					;linea donde están los cursores y espacio
	
	IN		 A, (#AA)
    AND		#F0
    OR		 B
    OUT		(#AA), A
    IN		 A, (#A9)
	
	BIT		 0, A					;Se ha pulsado espacio?
	JP		 NZ, .finsi_pulsado_espacio
	EX		AF, AF'					;guardo el valor de A para para actualizar D
	LD		 A, 00100000b
	OR		 D
	LD		 D, A
	EX		AF, AF'
.finsi_pulsado_espacio:
	
	;miramos las pulsaciones de cursores
[4] SRL		 A						;preparo A que tiene en los 4 primeros bits las pulsaciones de cursores

	LD		HL, array_movimientos_cursores
	LD		 B, 0
	LD		 C, A
	ADD		HL, BC
	
	LD		 A, (HL)
	OR		 D
	
	LD		(teclas_pulsadas), A
fin_obtiene_tecla_pulsada:
	RET




;;=====================================================
;;OBTIENE_ACCION_JOYSTICK
;;=====================================================	
; función: 	Mira si se ha pulsado alguno de los dos disparos en el joystick y guarda resultados en accion_joystick
; entrada: 	-
; salida: 	-
; toca: 	A
obtiene_accion_joystick:
	;miro movimiento y guardo en nible bajo
	LD		 A, 1
	CALL	GTSTCK
	LD		(accion_joystick), A	;guardado movimiento con joystick en nible bajo de accion_joystick
	
	;miro boton 1 joystick
.mira_boton_1:
	LD		 A, 1
	CALL	GTTRIG
	JP		 Z, .mira_boton_2
	LD		 A, 00100000b		;botón 1 pulsado
	JP		.fin_mira_boton

.mira_boton_2:	
	LD		 A, 3
	CALL	GTTRIG
	JP		 Z, .fin_mira_boton
	LD		 A, 00010000b		;botón 2 pulsado
.fin_mira_boton:

	
	;guardo el resultado final en accion_joystick
	LD		 B, A
	LD		 A, (accion_joystick)
	OR		 B
	LD		(accion_joystick), A
fin_obtiene_accion_joystick
	RET


;;=====================================================
;;MIRA_DISPARO
;;=====================================================	
; función: 	Mira si se ha pulsado alguno de los dos disparos
; entrada: 	C  (bits 5 - botón 1 y 6 - botón 2)
; salida: 	-
; toca: 	A
mira_disparo:
.mira_boton_pulsado1:
	LD		 A, (teclas_pulsadas)
	BIT		 5, A
	JP		 Z, .mira_boton_pulsado2
	;se ha pulsado barra
	LD		 A, (prota.escena)
	CPL		 
	LD		(prota.escena), A

.mira_boton_pulsado2:
	;~ BIT		C, 6
	;~ CP		 Z, fin_mira_disparo
fin_mira_disparo:
	RET
