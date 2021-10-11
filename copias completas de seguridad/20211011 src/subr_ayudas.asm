;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;INICIALIZA_AYUDAS
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
; función: 	pinta un objeto de tipo ayuda que se le pase por referencia IX y el tipo en A
; entrada: 	IX - puntero a objeto a mostrar, A - si está on u off
; salida: 	-
; toca:		AF, HL, BC, DE
pinta_obj_ayuda:
	;se recibe objeto desde fuera, por ejmplo LD IX, ayuda_oracion

	OR		 A
	JP		 Z,.dibujooff
.dibujoon:	
	LD		 H, (IX + 1)
	LD		 L, (IX + 2)
	LD		(wordaux2), HL
	JP		.param_wordaux2
.dibujooff:
	LD		 H, (IX + 3)
	LD		 L, (IX + 4)
	LD		(wordaux2), HL

.param_wordaux2:	
	LD		HL, TILMAP + 256	;calcula posición en tilemap + 256 por colocarse siempre en bank1
	LD		 A, (IX + 5)
	CALL	suma_A_HL
	LD		(wordaux1), HL		;pongo el valor en wordaux1

.filasycols:
	LD		 A, 2				;equivale a LD	A,2 porque A ya valía 1
	LD		(byteaux1), A	;nº de filas
	LD		(byteaux2), A	;nº de columnas
	
	JP		pinta_array
fin_pinta_obj_ayuda:


;;=====================================================
;;PINTA_AYUDAS_HABITACIÓN
;;=====================================================	
; función: 	examina el byte con las ayudas y pinta las que estén seleccionadas según variable habitacion_extras
; entrada: 	habitacion_extras
; salida: 	-
pinta_ayudas_habitacion:
.examina_oracion:
	LD		 A, (habitacion_extras)
	BIT		 7,A
	JP		 Z,.examina_cruz
	LD		IX, ayuda_oracion
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_cruz:
	LD		 A, (habitacion_extras)
	BIT		 6,A
	JP		 Z,.examina_aguabendita
	LD		IX, ayuda_cruz
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_aguabendita:
	LD		 A, (habitacion_extras)
	BIT		 5,A
	JP		 Z,.examina_armadura
	LD		IX, ayuda_aguabendita
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_armadura:
	LD		 A, (habitacion_extras)
	BIT		 4,A
	JP		 Z,.examina_planta
	LD		IX, ayuda_armadura
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_planta:
	LD		 A, (habitacion_extras)
	BIT		 3,A
	JP		 Z,.examina_vidaextra
	LD		IX, ayuda_planta
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_vidaextra:
	LD		 A, (habitacion_extras)
	BIT		 2,A
	JP		 Z,.examina_ballesta
	LD		IX, ayuda_vidaextra
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
.examina_ballesta:
	LD		 A, (habitacion_extras)
	BIT		 1,A
	RET		 Z
	LD		IX, ayuda_ballesta
	LD		 A, ACTIVA
	CALL	pinta_obj_ayuda
fin_pinta_ayudas_habitacion:
	RET



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
;;ACCION_BALLESTA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	-
accion_ballesta:
fin_accion_ballesta:
	RET


