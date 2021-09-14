;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;RESETEA AYUDAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_ayudas
; entrada: 	lista_ayudas
; salida: 	lista_ayudas
resetea_ayudas:
	LD		IX, lista_ayudas
	;oración
	LD		(IX + 0), INACTIVO
	LD		(IX + 1), ORACIONON
	LD		(IX + 2), ORACIONOFF
	LD		HL, accion_oracion
	LD		(IX + 10), H
	LD		(IX + 11), L
	;cruz
	LD		(IX + 16), INACTIVO
	LD		(IX + 17), CRUZON
	LD		(IX + 18), CRUZOFF
	LD		HL, accion_cruz
	LD		(IX + 24), H
	LD		(IX + 25), L
	;agua bendita
	LD		(IX + 32), INACTIVO
	LD		(IX + 33), AGUAON
	LD		(IX + 34), AGUAOFF
	LD		HL, accion_agua
	LD		(IX + 41), H
	LD		(IX + 42), L
	;armadura
	LD		(IX + 48), INACTIVO
	LD		(IX + 49), ARMADON
	LD		(IX + 50), ARMADOFF
	LD		HL, accion_agua
	LD		(IX + 57), H
	LD		(IX + 58), L
	;planta
	LD		(IX + 64), INACTIVO
	LD		(IX + 65), PLANTAON
	LD		(IX + 66), PLANTAOFF
	LD		HL, accion_planta
	LD		(IX + 73), H
	LD		(IX + 74), L
	;vida extra
	LD		(IX + 80), INACTIVO
	LD		(IX + 81), VIDAEXTON
	LD		(IX + 82), VIDAEXTOFF
	LD		HL, accion_vidaextra
	LD		(IX + 89), H
	LD		(IX + 90), L
	;ballesta
	LD		(IX + 96), INACTIVO
	LD		(IX + 97), BALLESON
	LD		(IX + 98), BALLESOFF
	LD		HL, accion_ballesta
	LD		(IX + 105), H
	LD		(IX + 106), L	
fin_resetea_ayudas:
	RET


;;=====================================================
;;INICIALIZA_AYUDAS
;;=====================================================	
; función: 	inicializa las estructuras de las ayudas
; entrada: 	
; salida: 	-
; toca:		todo
inicializa_ayudas:
	;busca objetos a incluir y actualiza sus variables/estructura
	LD		 A, (habitacion_extras)
	
.examina_ayudas:
.examina_ballesta:
	BIT		 7, A
	JP		 Z, .examina_vidaextra
	LD		IX, ayuda_ballesta
	LD		 B, BALLESON
	EX		AF, AF'
	CALL	calcula_posicion_ayuda
	EX		AF, AF'
.examina_vidaextra:
	BIT		 6, A
	JP		 Z, .examina_armadura
	LD		IX, ayuda_vidaextra
	EX		AF, AF'
	CALL	calcula_posicion_ayuda
	EX		AF, AF'
.examina_planta:
	BIT		 5, A
	JP		 Z, .examina_armadura
	LD		IX, ayuda_planta
	CALL	calcula_posicion_ayuda
.examina_armadura:
	BIT		 5, A
	CALL	 Z, .examina_agua
	LD		IX, ayuda_armadura
	EX		AF, AF'
	CALL	calcula_posicion_ayuda
	EX		AF, AF'
.examina_agua:
	BIT		 4, A
	JP		 Z, .examina_cruz
	LD		IX, ayuda_aguabendita
	EX		AF, AF'
	CALL	calcula_posicion_ayuda
	EX		AF, AF'
.examina_cruz:
	BIT		 3, A
	JP		 Z, .examina_oracion
	LD		IX, ayuda_cruz
	EX		AF, AF'
	CALL	calcula_posicion_ayuda
	EX		AF, AF'
.examina_oracion:
	BIT		 2, A
	JP		 Z, .fin_examina_ayudas
	LD		IX, ayuda_oracion
	;EX		AF, AF'					;no se necesita preservar ya que es la última
	JP		calcula_posicion_ayuda	;no se necesita un CALL ya que es la última
.fin_examina_ayudas:	
fin_inicializa_ayudas:
	RET


;;=====================================================
;;CALCULA_POSICION_AYUDA
;;=====================================================	
; función: 	actualiza los valores de la estructura (pos_tile, posx y posy)
; entrada: 	B, constante a sumar al array_ayudas que indica 1º tile de ayuda a pintar
; salida: 	-
calcula_posicion_ayuda:
	LD		(IX), ACTIVO		;activa el objeto con un valor distinto de 0
	
	;1) se busca en la VRAM la primera pos de los tiles a pintar
	;se recibe objeto an A desde fuera, por ejmplo LD		 A, CRUZOFF
	LD		A, B
	LD		BC, array_ayudas
	CALL 	suma_A_BC
	
	;coloca pos array objeto a pintar en la variable de la estructura
	LD		(IX + 3), B
	LD		(IX + 4), C
	
	;2) ahora se calcula la posición dentro del tilemap en la pantalla
	
	LD		HL, TILMAP + 256	;calcula posición en tilemap + 256 por colocarse siempre en bank1
	
	LD		 A, R				;obtengo un valor "random" entre 0 y 255
	AND		00001111b			;me quedo con los 4 bits menos signif. y obtengo entre 0 y 15 (tamaño del array pos_ayudas)
	LD		BC, pos_ayudas		;puntero a inicio de array pos_ayudas
	CALL 	suma_A_BC			;tengo en BC la pos de memoria de pos_ayudas
	
	LD		 A, (BC)			;tengo en A la posición dentro del bank1 
	LD		 D, 0
	LD		 E, A
	ADD		HL, DE				;le sumo a HL la posción de inicio de tilemap + 256 + dónde colocar el objeto
	
	LD		(IX + 5), H
	LD		(IX + 6), L
	
	
	;3) ahora hay que colocar la posición del pixel x e y
	
	 
	
	
;	LD		 A, ORACIONON
	CALL	pinta_obj_ayuda

fin_calcula_posicion_ayuda:
	RET
;; por de pronto la dejo aquí
;~ wordaux1:		DW	0	;almacena la posición en el tilemap 0 al 675
;~ wordaux2:		DW	0	;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 2 primeros bancos)
;~ byteaux1:		DB	0	;nº filas Registro D
;~ byteaux2:		DB	0	;nº columnas Registro E




;;=====================================================
;;PINTA_OBJ_AYUDA
;;=====================================================	
; función: 	
; entrada: 	A - objeto a mostrar
; salida: 	-
; toca:		AF, HL, BC, DE
pinta_obj_ayuda:

	

		
	LD		 A, 2				;nº de filas
	LD		(byteaux1), A	
	LD		 A, 2				;nº de columnas
	LD		(byteaux2), A

	JP		pinta_array
fin_pinta_obj_ayuda:
	RET
objeto_pintar:		DB		0
	




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

