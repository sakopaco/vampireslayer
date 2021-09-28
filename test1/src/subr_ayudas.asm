;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;RESETEA AYUDAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_ayudas
; entrada: 	lista_ayudas
; salida: 	lista_ayudas
inicializa_ayudas:
	;oración
	LD		IX, ayuda_oracion
	LD		(IX), INACTIVO			;Inactivo vale 0
	LD		(IX + 1), ORACIONON
	LD		(IX + 2), ORACIONOFF
	LD		(IX + 3), 160			;se le sumará 256 ya que siempre se dibuja en el banco 1
	LD		(IX + 4), 32			;posición x pero del centro de los 4 tiles => + 8 desde la esquina
	LD		(IX + 5), 32			;posición y pero del centro de los 4 tiles => + 8 desde la esquina (como es cte. se puede eliminar pero como no gasto demasiada memoria, por lo pronto , se deja)
	LD		HL, accion_oracion
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;cruz
	LD		IX, ayuda_cruz
	LD		(IX), INACTIVO
	LD		(IX + 1), CRUZON
	LD		(IX + 2), CRUZOFF
	LD		(IX + 3), 164
	LD		(IX + 4), 64
	LD		(IX + 5), 32
	LD		HL, accion_cruz
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;agua bendita
	LD		IX, ayuda_aguabendita
	LD		(IX), INACTIVO
	LD		(IX + 1), AGUAON
	LD		(IX + 2), AGUAOFF
	LD		(IX + 3), 168
	LD		(IX + 4), 96
	LD		HL, accion_agua
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;armadura
	LD		IX, ayuda_armadura
	LD		(IX), INACTIVO
	LD		(IX + 1), ARMADON
	LD		(IX + 2), ARMADOFF
	LD		(IX + 3), 172
	LD		(IX + 4), 128
	LD		(IX + 5), 32
	LD		HL, accion_agua
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;planta
	LD		IX, ayuda_planta
	LD		(IX), INACTIVO
	LD		(IX + 1), PLANTAON
	LD		(IX + 2), PLANTAOFF
	LD		(IX + 3), 176
	LD		(IX + 4), 160
	LD		(IX + 5), 32
	LD		HL, accion_planta
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;vida extra
	LD		IX, ayuda_vidaextra
	LD		(IX), INACTIVO
	LD		(IX + 1), VIDAEXTON
	LD		(IX + 2), VIDAEXTOFF
	LD		(IX + 3), 180
	LD		(IX + 4), 192
	LD		(IX + 5), 32
	LD		HL, accion_vidaextra
	LD		(IX + 9), H
	LD		(IX + 10), L
	
	;ballesta
	LD		IX, ayuda_ballesta
	LD		(IX), INACTIVO
	LD		(IX + 1), BALLESON
	LD		(IX + 2), BALLESOFF
	LD		(IX + 3), 184
	LD		(IX + 4), 224
	LD		(IX + 5), 32
	LD		HL, accion_ballesta
	LD		(IX + 9), H
	LD		(IX + 10), L	
fin_resetea_ayudas:
	RET



;;=====================================================
;;PINTA_OBJ_AYUDA
;;=====================================================	
; función: 	pinta un objeto de tipo ayuda que se le pase por referencia IX
; entrada: 	IX - puntero a objeto a mostrar
; salida: 	-
; toca:		AF, HL, BC, DE
pinta_obj_ayuda:
	LD		IX, ayuda_oracion

	;se recibe objeto an A desde fuera, por ejmplo LD		 A, CRUZOFF
	LD		 A, (IX + 1)
	LD		BC, array_ayudas
	CALL 	suma_A_BC
	;coloca pos array objeto a pintar en 
	LD		(wordaux2), BC
	
	XOR		 A
	LD		 H, A
	LD		 L, (IX+6)
	
	LD		 E, A
	INC		 A
	LD		 D, A
	
	
	ADD		HL, DE
	LD		(wordaux1), HL
		
	INC		 A				;equivale a LD	A,2 porque A ya valía 1
	LD		(byteaux1), A	;nº de filas
	LD		(byteaux2), A	;nº de columnas

	JP		pinta_array
fin_pinta_obj_ayuda:

	
;~ pinta_obj_ayuda:
	;~ ;se recibe objeto an A desde fuera, por ejmplo LD		 A, CRUZOFF
	;~ LD		BC, array_ayudas
	;~ CALL 	suma_A_BC
	
	;~ ;coloca pos array objeto a pintar en 
	;~ LD		(wordaux2), BC
	
	;~ LD		HL, TILMAP + 256	;calcula posición en tilemap + 256 por colocarse siempre en bank1
	
	;~ LD		 A, R				;obtengo un valor "random" entre 0 y 255
	;~ AND		00001111b			;me quedo con los 4 bits menos signif. y obtengo entre 0 y 15 (tamaño del array pos_ayudas)
	;~ LD		BC, pos_ayudas		;puntero a inicio de array pos_ayudas
	;~ CALL 	suma_A_BC			;tengo en BC la pos de memoria de pos_ayudas
	
	;~ LD		 A, (BC)			;tengo en A la posición dentro del bank1 
	;~ LD		 D, 0
	;~ LD		 E, A
	;~ ADD		HL, DE				;le sumo a HL la posción de inicio de tilemap + 256 + dónde colocar el objeto

	;~ LD		(wordaux1), HL		;pongo el valor en wordaux1
		
	;~ LD		 A, 2				;nº de filas
	;~ LD		(byteaux1), A	
	;~ LD		 A, 2				;nº de columnas
	;~ LD		(byteaux2), A

	;~ JP		pinta_array
;~ fin_pinta_obj_ayuda:
	;~ RET
;~ objeto_pintar:		DB		0




;;=====================================================
;;ACCION_ORACION
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_oracion:
fin_accion_oracion:
	RET
	

;;=====================================================
;;ACCION_CRUZ
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_cruz:
fin_accion_cruz:
	RET


;;=====================================================
;;ACCION_AGUA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_agua:
fin_accion_agua:
	RET


;;=====================================================
;;ACCION_ARMADURA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_armadura:
fin_accion_armadura:
	RET


;;=====================================================
;;ACCION_PLANTA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_planta:
fin_accion_planta:
	RET


;;=====================================================
;;ACCION_VIDAEXTRA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_vidaextra:
fin_accion_vidaextra:
	RET




;;=====================================================
;;ACCION_VIDAEXTRA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_ballesta:
fin_accion_ballesta:
	RET

