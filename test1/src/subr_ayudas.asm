;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	


;;=====================================================
;;CONTANTES AYUDAS
;;=====================================================
;array de ayudas
;posición dentro del bank1 (o 0 que son iguales) de los tiles de la ayuda (cómo en los sprites de 2x2)
array_ayudas:
array_oracionon:			DB	200,202
array_oracionon1:			DB	201,203
array_oracionoff:			DB	204,206
array_oracionoff1:			DB	205,207
array_cruzon:				DB	208,210
array_cruzon1:				DB	209,211
array_cruzoff:				DB	212,214
array_cruzoff1:				DB	213,215
array_aguaon:				DB	216,218
array_aguaon1:				DB	217,219
array_aguaoff:				DB	220,222
array_aguaoff1:				DB	221,223
array_armaduraon:			DB	224,226
array_armaduraon1:			DB	225,227
array_armaduraoff:			DB	228,230
array_armaduraoff1:			DB	229,231
array_plantaon:				DB	232,234
array_plantaon1:			DB	233,235
array_plantaoff:			DB	236,238
array_plantaoff1:			DB	237,239
array_vidaextraon:			DB	240,242
array_vidaextraon1:			DB	241,243
array_vidaextraoff:			DB	244,246
array_vidaextraoff1:		DB	245,247
array_ballestaon:			DB	248,250
array_ballestaon1:			DB	249,251
array_ballestaoff:			DB	252,254
array_ballestaoff1:			DB	253,255


datos_ayudas:
datos_oracion:			
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSORACIONX			;punto x de la ayuda para cuando se dispare encima
				DB		POSORACIONY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_oracion		;función para acción de cada tipo de ayuda
				DW		array_oracionon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_oracionoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSORACION ;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_cruz:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSCRUZX			;punto x de la ayuda para cuando se dispare encima
				DB		POSCRUZY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_cruz			;función para acción de cada tipo de ayuda
				DW		array_cruzon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_cruzoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSCRUZ	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)
					
datos_aguabendita:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSAGUAX			;punto x de la ayuda para cuando se dispare encima
				DB		POSAGUAY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_aguabendita	;función para acción de cada tipo de ayuda
				DW		array_aguaon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_aguaoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSAGUA	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_armadura:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSARMADURAX		;punto x de la ayuda para cuando se dispare encima
				DB		POSARMADURAY		;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_armadura		;función para acción de cada tipo de ayuda
				DW		array_armaduraon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_armaduraoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSARMADURA;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_planta:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSPLANTAX			;punto x de la ayuda para cuando se dispare encima
				DB		POSPLANTAY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_planta		;función para acción de cada tipo de ayuda
				DW		array_plantaon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_plantaoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSPLANTA	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_vidaextra:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSVIDAEXTX			;punto x de la ayuda para cuando se dispare encima
				DB		POSVIDAEXTY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_vidaextra	;función para acción de cada tipo de ayuda
				DW		array_vidaextraon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_vidaextraoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSVIDAEXT ;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)
  
datos_ballesta:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSBALLESTAX		;punto x de la ayuda para cuando se dispare encima
				DB		POSBALLESTAY		;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_ballesta		;función para acción de cada tipo de ayuda
				DW		array_ballestaon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_ballestaoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSBALLESTA;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)  
				

;;=====================================================
;;INICIALIZA_AYUDAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_ayudas
; entrada: 	datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_ayudas:
	;oracion
	LD		HL, datos_oracion
	LD		DE, ayuda_oracion
	CALL	carga_datos_ayuda

	;cruz
	LD		HL, datos_cruz
	LD		DE, ayuda_cruz
	CALL	carga_datos_ayuda

	;agua_bendita
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

	;vidaextra
	LD		HL, datos_vidaextra
	LD		DE, ayuda_vidaextra
	CALL	carga_datos_ayuda

	;ballesta
	LD		HL, datos_ballesta
	LD		DE, ayuda_ballesta
	JP		carga_datos_ayuda
fin_inicializa_ayudas:
	

;;=====================================================
;;CARGA_DATOS_AYUDA
;;=====================================================	
; función: 	carga los datos de la ayuda de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
; entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_ayuda:
	LD		BC, 15;ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
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

	;si A=1 dibujo on (si 0 off)
	OR		 A
	JP		 NZ,.dibujooff
.dibujoon:	
		LD		 L, (IX + ESTRUCTURA_AYUDA.tiles_ayudaoff)
		LD		 H, (IX + ESTRUCTURA_AYUDA.tiles_ayudaoff + 1)
		LD		(wordaux2), HL	;pongo el valor en wordaux2
		JP		.param_wordaux2
.dibujooff:
		LD		 L, (IX + ESTRUCTURA_AYUDA.tiles_ayudaon)
		LD		 H, (IX + ESTRUCTURA_AYUDA.tiles_ayudaon + 1)
		LD		(wordaux2), HL	;pongo el valor en wordaux2
;fin si
.param_wordaux2:	
	LD		 L, (IX + ESTRUCTURA_AYUDA.pos_en_tilemap)
	LD		 H, (IX + ESTRUCTURA_AYUDA.pos_en_tilemap + 1)
	LD		(wordaux1), HL		;pongo el valor en wordaux1

.filasycols:
	LD		 A, 2
	;se comenta para ahorrar tiempo (y porque habría que pasarlo previamente a A cuando siempre es 2)
	;~ LD		(byteaux1), (IX + ESTRUCTURA_AYUDA.alto);nº de filas
	;~ LD		(byteaux2), (IX + ESTRUCTURA_AYUDA.alto);nº de columnas
	LD		(byteaux1), A		;nº de filas
	LD		(byteaux2), A		;nº de columnas
	
	JP		pinta_array
fin_pinta_obj_ayuda:


;;=====================================================
;;PINTA_AYUDAS_HABITACIÓN
;;=====================================================	
; función: 	examina el byte con las ayudas y pinta las que estén seleccionadas según variable habitacion_extras
; entrada: 	habitacion_extras
; salida: 	-
pinta_ayudas_habitacion:
	;si ya se ha terminado la habitación no se muestran ayudas (como no se muestran enemigos)
		LD			 A, (habitacion_terminada)
		OR			 A
		RET			NZ

		XOR			 A
		LD			(hay_ayudas_en_pantalla), A
.examina_oracion:
		LD		 A, (habitacion_extras)
		BIT		 7, A						;bit 7 oracion
		JP		 Z, .fin_examina_oracion
	
		LD		IX, ayuda_oracion
		JP		.pintar_ayuda
.fin_examina_oracion:

.examina_cruz:
		LD		 A, (habitacion_extras)
		BIT		 6, A						;bit 6 cruz
		JP		 Z, .fin_examina_cruz		
		
		LD		IX, ayuda_cruz
		JP		.pintar_ayuda
.fin_examina_cruz:

.examina_aguabendita:
		LD		 A, (habitacion_extras)
		BIT		 5, A						;bit 5 aguabendita
		JP		 Z, .fin_examina_aguabendita
		
		LD		IX, ayuda_aguabendita
		JP		.pintar_ayuda
.fin_examina_aguabendita:

.examina_armadura:
		LD		 A, (habitacion_extras)
		BIT		 4, A						;bit 4 armadura
		JP		 Z, .fin_examina_armadura
		
		LD		IX, ayuda_armadura
		JP		.pintar_ayuda
.fin_examina_armadura:

.examina_planta:
		LD		 A, (habitacion_extras)
		BIT		 3, A						;bit 3 planta
		JP		 Z, .fin_examina_planta
		
		LD		IX, ayuda_planta
		JP		.pintar_ayuda
.fin_examina_planta:

.examina_vidaextra:
		LD		 A, (habitacion_extras)
		BIT		 2, A						;bit 2 planta
		JP		 Z, .fin_examina_vidaextra
		
		LD		IX, ayuda_vidaextra
		JP		.pintar_ayuda
.fin_examina_vidaextra:

.examina_ballesta:
		LD		 A, (habitacion_extras)
		BIT		 1, A						;bit 2 planta
		RET		 Z
		
		LD		IX, ayuda_ballesta
.fin_examina_ballesta:

.pintar_ayuda:
		LD			 A, 1
		LD			(hay_ayudas_en_pantalla), A
		
		;puntero_ayuda_actual
		LD			(puntero_ayuda_actual), IX
		LD		 	 A, ACTIVA
		LD			(IX), A					;si lo pinta activo pone el bit a 1 por si el último lo puso a 0
		JP			pinta_obj_ayuda
fin_pinta_ayudas_habitacion:


;;=====================================================
;;CHECK_COLISION_AYUDAS
;;=====================================================	
; función: 	revisa si ha habido disparo sobre la ayuda de pantalla
; entrada: 	puntero_ayuda_actual
; salida: 	-
; toca:		todo
check_colision_ayudas:
	LD		IX, (puntero_ayuda_actual)
	LD		 A, (IX)
	OR		 A							;está activa la ayuda de pantalla?
	JP		 Z, fin_check_colision_ayudas
	;SI
		CALL	check_colision_ayuda	;aquí ya es cosa de ver colisiones prota/puerta_izquierda
		;recibe valor A
		OR		 0						;hubo colisión?
		RET		 Z						;no hubo colisión por lo que sale
		;hubo colisión

		;sonido dispara ayuda
		LD		 A, SONIDORELIQUIA		;5
		CALL	ayFX_INIT	
		LD		BC, 8000
		CALL 	retardo16bits
		
		;EJECUTA ACCIÓN Y SALE DE LA RUTINA	
		LD		HL, fin_check_colision_ayudas ;se guarda dónde volver
		PUSH	HL
		LD		 L, (IX + ESTRUCTURA_AYUDA.accion)
		LD		 H, (IX + ESTRUCTURA_AYUDA.accion + 1)
		JP		(HL)
	;FINSI
fin_check_colision_ayudas:
		RET
	

;;=====================================================
;;CHECK_COLISION_AYUDA
;;=====================================================	
; función: 	revisa la distancia con ayuda para ver si se disparó a la ayuda activa
; entrada: 	IX con el puntero a la puerta que se examina
; salida: 	A (0 no hay colisión con puerta / 1 sí la hay)
; toca:		HL,BC, DE
check_colision_ayuda:
.deteccioncolision_paso1:
	LD		IY, puntomira	;IY punto de mira / IX puerta
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posx)
	ADD		 8			;8-es fijo, offset del punto de mira ya que se mueve según la esquina superior izquierda y el centro del punto de mira está en el centro del sprite
	
	;ya tengo en A la coordenada X del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_AYUDA.posx)	;le resto el punto x en la puerta
	
	JP		NC, .deteccioncolision_paso2	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)
	
.deteccioncolision_paso2:
	CP		(IX + ESTRUCTURA_AYUDA.radiox)	;comparo con el radio X de la puerta
	
	JP		 C, .deteccioncolision_paso3	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A y ya no hay que seguir coprobando
	RET
	
.deteccioncolision_paso3:					;la distancia X es válida, comprobamos la distancia Y
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posy)
	ADD		 8								;le sumo el offset del punto de mira (8 es fijo)

	;ya tengo en A la coordenada Y del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_AYUDA.posy)	;le resto el punto y en la puerta
	
	JP		NC, .deteccioncolision_paso4	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)

.deteccioncolision_paso4:
	CP		(IX + ESTRUCTURA_AYUDA.radioy)	;comparo con el radio Y de la puerta

	JP		 C, .deteccioncolision_paso5	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A un 0 y al ser la 2º comprobación salimos
	RET

.deteccioncolision_paso5:
	LD		 A, SI
fin_check_colision_ayuda:
	RET


;;=====================================================
;;ACCION_ORACION
;;=====================================================	
; función: 	añade una reliquia máximo 8 (no puede tener más)
; entrada: 	puntero_extras_habitacion_actual, puntero_ayuda_actual, prota_reliquias
; salida: 	-
accion_oracion:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, (prota_reliquias)
	CP		 A, 8
	RET		 Z
	
	INC		 A						;suma una reliquia
	LD		 (prota_reliquias), A
	
	JP		pinta_reliquias			;pinta la energia en pantalla
fin_accion_oracion:


;;=====================================================
;;ACCION_CRUZ
;;=====================================================	
; función: 	añade 2 reliquias máximo 8 (no puede tener más)
; entrada: 	puntero_extras_habitacion_actual, puntero_ayuda_actual, prota_reliquias
; salida: 	-
accion_cruz:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, (prota_reliquias)
	CP		 6
	JR		NC, .max_reliquias
.suma_reliquias
	ADD		 2						;suma 2 reliquias
	JP		.fin_suma_reliquias
.max_reliquias
	LD		 A, 8					;aplica el máx. de reliquias 8
.fin_suma_reliquias
	LD		(prota_reliquias), A
	
	JP		pinta_reliquias			;pinta la energia en pantalla
fin_accion_cruz:
	

;;=====================================================
;;ACCION_AGUABEDITA
;;=====================================================	
; función: 	añade 3 reliquias máximo 8 (no puede tener más)
; entrada: 	puntero_extras_habitacion_actual, puntero_ayuda_actual, prota_reliquias
; salida: 	-
accion_aguabendita:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, (prota_reliquias)
	CP		 5
	JR		NC, .max_reliquias
.suma_reliquias
	ADD		 3						;suma 3 reliquias
	JP		.fin_suma_reliquias
.max_reliquias
	LD		 A, 8					;aplica el máx. de reliquias 8
.fin_suma_reliquias
	LD		(prota_reliquias), A
	
	JP		pinta_reliquias			;pinta la energia en pantalla
fin_accion_aguabendita:


;;=====================================================
;;ACCION_ARMADURA
;;=====================================================	
; función: 	Añade 75 a la vida
; entrada: 	puntero_extras_habitacion_actual, puntero_ayuda_actual, prota_reliquias
; salida: 	-
accion_armadura:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, (prota_energia)
	CP		150
	JR		NC, .max_energia
.suma_energia
	ADD		100						;suma 100 al marcador de energía
	JP		.fin_suma_energia
.max_energia
	LD		 A, 255					;aplica el máx. de energía 255
.fin_suma_energia
	LD		(prota_energia), A
	
	JP		pinta_energia			;pinta la energia en pantalla
fin_accion_armadura:


;;=====================================================
;;ACCION_PLANTA
;;=====================================================	
; función: 	rellena toda la energía 
; entrada: 	
; salida: 	-
accion_planta:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, 255					;aplica el máx. de energía 255
	LD		(prota_energia), A
	
	JP		pinta_energia			;pinta la energia en pantalla
fin_accion_planta:


;;=====================================================
;;ACCION_VIDAEXTRA
;;=====================================================	
; función: 	añade una vida al marcador de vidas
; entrada: 	
; salida: 	-
accion_vidaextra:
	;desactiva ayuda
	LD		IX, (puntero_ayuda_actual)
	XOR		 A
	LD		(IX), A
	CALL	pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
	
	LD		 A, (prota_vidas)		;suma una vida al marcador de vidas
	INC		 A
	LD		 (prota_vidas), A
	
	JP		pinta_vidas				;pinta la vidas en pantalla
fin_accion_vidaextra:


;;=====================================================
;;ACCION_BALLESTA
;;=====================================================	
; función: 	cambia sprite a ballesta mejorada, cambia daño, especifica pantallas que dura la nueva ballesta 
; entrada: 	
; salida: 	-
accion_ballesta:
		;cambio sprites a ballesta mejorada
		LD		IX, puntomira
		LD		(IX + ESTRUCTURA_PUNTOMIRA.spritea), SPRI_DANO2A
		LD		(IX + ESTRUCTURA_PUNTOMIRA.spriteb), SPRI_DANO2B
		
		;cambio daño a daño mejorado
		LD		 A, PROTADANO2
		LD		(prota_dano_actual), A
		
		;inicia contador pantallas ballesta mejorada
		LD		 A, DURACIONBALLEJ
		LD		(contador_ayuda_ballesta), A
	
		;desactiva ayuda
		LD		IX, (puntero_ayuda_actual)
		XOR		 A
		LD		(IX), A
		JP		pinta_obj_ayuda			;se le pasa A = 0 para que pinte desactivado
fin_accion_ballesta:


;;=====================================================
;;RESETEA_BALLESTA
;;=====================================================	
; función: 	vuelve la ballesta al estado original
; entrada: 	
; salida: 	-
resetea_ballesta:
		LD		IX, puntomira
		LD		(IX + ESTRUCTURA_PUNTOMIRA.spritea), SPRI_DANO1A
		LD		(IX + ESTRUCTURA_PUNTOMIRA.spriteb), SPRI_DANO1B
		
		;cambio daño a daño mejorado
		LD		 A, PROTADANO1
		LD		(prota_dano_actual), A
fin_resetea_ballesta:
		RET
