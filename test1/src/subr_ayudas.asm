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
	LD		(IX), INACTIVA			
	LD		HL, array_oracionon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_oracionoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSORACION
	LD		(IX + 6), POSORACIONX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_oracion
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;cruz
	LD		IX, ayuda_cruz
	LD		(IX), INACTIVA			
	LD		HL, array_cruzon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_cruzoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSCRUZ
	LD		(IX + 6), POSCRUZX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_cruz
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;agua bendita
	LD		IX, ayuda_aguabendita
	LD		(IX), INACTIVA			
	LD		HL, array_aguaon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_aguaoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSAGUA
	LD		(IX + 6), POSAGUAX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_agua
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;armadura
	LD		IX, ayuda_armadura
	LD		(IX), INACTIVA			
	LD		HL, array_armaduraon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_armaduraoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSARMAD
	LD		(IX + 6), POSARMADX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_armadura
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;planta
	LD		IX, ayuda_planta
	LD		(IX), INACTIVA			
	LD		HL, array_plantaon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_plantaoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSPLANTA
	LD		(IX + 6), POSPLANTAX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_planta
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;vida extra
	LD		IX, ayuda_vidaextra
	LD		(IX), INACTIVA			
	LD		HL, array_extraon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_extraoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSVIDAEXT
	LD		(IX + 6), POSVIDAEXTX
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_vidaextra
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;ballesta
	LD		IX, ayuda_ballesta
	LD		(IX), INACTIVA			
	LD		HL, array_ballestaon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_ballestaoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSBALLES
	LD		(IX + 6), POSBALLES
;	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_ballesta
	LD		(IX + 8), H
	LD		(IX + 9), L
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


