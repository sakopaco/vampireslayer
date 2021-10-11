;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;INICIALIZA_AYUDAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_ayudas
; entrada: 	datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_ayudas:
	;oración
	LD		IX, ayuda_oracion
	LD		(IX + 0), INACTIVA			
	LD		HL, array_oracionon
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		HL, array_oracionoff
	LD		(IX + 3), H
	LD		(IX + 4), L
	LD		(IX + 5), POSORACION
	LD		(IX + 6), POSORACIONX
	LD		(IX + 7), POSAYUDASY	;como es constante y no se cambia se puede inicializar la estructura con el valor y ahorramos tiempo
	LD		HL, accion_oracion
	LD		(IX + 8), H
	LD		(IX + 9), L
	
	;cruz
	LD		HL, datos_cruz
	LD		DE, ayuda_cruz
	LD		BC, 7;#ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
	LDIR
	
	;agua bendita
	LD		HL, datos_aguabendita
	LD		DE, ayuda_aguabendita
	CALL	carga_datos_ayuda
		
	;armadura
	LD		HL, datos_armadura
	LD		DE, ayuda_armadura
	CALL	carga_datos_ayuda
		
	;planta
	LD		HL, datos_planta
	LD		DE, ayuda_planta
	CALL	carga_datos_ayuda
		
	;vida extra
	LD		HL, datos_vidaextra
	LD		DE, ayuda_vidaextra
	CALL	carga_datos_ayuda
		
	;ballesta
	LD		HL, datos_ballesta
	LD		DE, ayuda_ballesta
	CALL	carga_datos_ayuda
fin_resetea_ayudas:
	RET
	

;;=====================================================
;;CARGA_DATOS_AYUDA
;;=====================================================	
; función: 	carga los datos de la ayuda de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
;entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_ayuda:
	LD		BC, 16;#ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
	LDIR
fin_carga_datos_ayuda:
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


