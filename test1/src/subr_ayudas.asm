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
	LD		(IX + 6), H
	LD		(IX + 7), L
	;cruz
	LD		(IX + 8), INACTIVO
	LD		(IX + 9), CRUZON
	LD		(IX + 10), CRUZOFF
	LD		HL, accion_cruz
	LD		(IX + 14), H
	LD		(IX + 15), L
	;agua bendita
	LD		(IX + 16), INACTIVO
	LD		(IX + 17), AGUAON
	LD		(IX + 18), AGUAOFF
	LD		HL, accion_agua
	LD		(IX + 22), H
	LD		(IX + 23), L
	;armadura
	LD		(IX + 24), INACTIVO
	LD		(IX + 25), ARMADON
	LD		(IX + 26), ARMADOFF
	LD		HL, accion_agua
	LD		(IX + 30), H
	LD		(IX + 31), L
	;planta
	LD		(IX + 32), INACTIVO
	LD		(IX + 33), PLANTAON
	LD		(IX + 34), PLANTAOFF
	LD		HL, accion_planta
	LD		(IX + 38), H
	LD		(IX + 39), L
	;vida extra
	LD		(IX + 40), INACTIVO
	LD		(IX + 41), VIDAEXTON
	LD		(IX + 42), VIDAEXTOFF
	LD		HL, accion_vidaextra
	LD		(IX + 46), H
	LD		(IX + 47), L
	;ballesta
	LD		(IX + 48), INACTIVO
	LD		(IX + 49), BALLESON
	LD		(IX + 50), BALLESOFF
	LD		HL, accion_ballesta
	LD		(IX + 54), H
	LD		(IX + 55), L	
fin_resetea_ayudas:
	RET





;;=====================================================
;;INICIALIZA_AYUDAS
;;=====================================================	
; función: 	actualiza las estructuras de las ayudas y pinta los objetos
; entrada: 	
; salida: 	-
inicializa_ayudas:
	;busca objetos a incluir y actualiza sus variables/estructura
	LD		 A, (habitacion_extras)
	
.examina_ayudas:
.examina_ballesta:
	BIT		 7, A
	JP		 Z, .examina_vidaextra
	LD		IX, ayuda_ballesta
	CALL	calcula_posicion_ayuda
.examina_vidaextra:
	BIT		 6, A
	JP		 Z, .examina_armadura
	LD		IX, ayuda_vidaextra
	CALL	calcula_posicion_ayuda
.examina_planta:
	BIT		 5, A
	JP		 Z, .examina_armadura
	LD		IX, ayuda_planta
	CALL	calcula_posicion_ayuda
.examina_armadura:
	BIT		 5, A
	CALL	 Z, .examina_agua
	LD		IX, ayuda_armadura
	CALL	calcula_posicion_ayuda
.examina_agua:
	BIT		 4, A
	JP		 Z, .examina_cruz
	LD		IX, ayuda_aguabendita
	CALL	calcula_posicion_ayuda
.examina_cruz:
	BIT		 3, A
	JP		 Z, .examina_oracion
	LD		IX, ayuda_cruz
	CALL	calcula_posicion_ayuda
.examina_oracion:
	BIT		 2, A
	JP		 Z, .fin_examina_ayudas
	LD		IX, ayuda_oracion
	CALL	calcula_posicion_ayuda
.fin_examina_ayudas:	


fin_inicializa_ayudas:
	RET



;;=====================================================
;;CALCULA_POSICION_AYUDA
;;=====================================================	
; función: 	actualiza los valores de la estructura (pos_tile, posx y posy)
; entrada: 	
; salida: 	-
calcula_posicion_ayuda:

	LD		 A, ORACIONON
	CALL	pinta_obj_ayuda

fin_calcula_posicion_ayuda:





;;=====================================================
;;PINTA_OBJ_AYUDA
;;=====================================================	
; función: 	
; entrada: 	A - objeto a mostrar
; salida: 	-
; toca:		AF, HL, BC, DE
pinta_obj_ayuda:
	;se recibe objeto an A desde fuera, por ejmplo LD		 A, CRUZOFF
	LD		BC, array_ayudas
	CALL 	suma_A_BC
	
	;coloca pos array objeto a pintar en 
	LD		(wordaux2), BC
	
	LD		HL, TILMAP + 256	;calcula posición en tilemap + 256 por colocarse siempre en bank1
	
	LD		 A, R				;obtengo un valor "random" entre 0 y 255
	AND		00001111b			;me quedo con los 4 bits menos signif. y obtengo entre 0 y 15 (tamaño del array pos_ayudas)
	LD		BC, pos_ayudas		;puntero a inicio de array pos_ayudas
	CALL 	suma_A_BC			;tengo en BC la pos de memoria de pos_ayudas
	
	LD		 A, (BC)			;tengo en A la posición dentro del bank1 
	LD		 D, 0
	LD		 E, A
	ADD		HL, DE				;le sumo a HL la posción de inicio de tilemap + 256 + dónde colocar el objeto

	LD		(wordaux1), HL		;pongo el valor en wordaux1
		
	LD		 A, 2				;nº de filas
	LD		(byteaux1), A	
	LD		 A, 2				;nº de columnas
	LD		(byteaux2), A

	CALL		pinta_array
	
	LD		A, (bandera)
	INC		A
	LD		(bandera), A
fin_pinta_obj_ayuda:
	RET
objeto_pintar:		DB		0
bandera:			DB		0
	



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

