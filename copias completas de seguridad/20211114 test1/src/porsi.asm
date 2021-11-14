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

	JP		pinta_array
fin_pinta_obj_ayuda:
	RET
objeto_pintar:		DB		0
