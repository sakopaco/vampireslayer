;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;INICIALIZA_NIVELES
;;=====================================================	
; función: 	pone el bit 4 de todas las habitaciones (byte habitacion_actual 0,2,4....) a 0
; entrada: 	habitaciones_plantilla
; salida: 	habitaciones_plantilla con los el bit 4 de los bites bytes impares a 0
; toca: 	habitaciones_plantilla, B


;ahora mismo se pondrá que se pueda navegar por cualquier habitación y sólo se controlarán las ayudas
;cuando ya haya enemigos se modificará para que el bit 4 a 0 todos los enemigos muerto y 1 hay enemigos vivos
;ayudas bit 6 1 hay ayudas y 0 no hay ayudas

inicializa_niveles:
		PUSH		AF
		PUSH		BC
		PUSH		HL

		;inicia habitación para decir si por esa habitación no se ha pasado
		;el 4 bit a 0 indica que por esa habitacion no se ha pasado/no se han atado todos los enemigos
		;el 6 bit a 1 indica que en esa habitación hay ayudas no utilizadas

;nivel 0 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel0	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel0
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_0:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel0
.si_tiene_ayuda_nivel0:
		SET			 6, C
.no_tiene_ayuda_nivel0:
		RES			 6, C
.fin_tiene_ayuda_nivel0:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_0

;nivel 1 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel1	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel1
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_1:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel1
.si_tiene_ayuda_nivel1:
		SET			 6, C
.no_tiene_ayuda_nivel1:
		RES			 6, C
.fin_tiene_ayuda_nivel1:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_1

;nivel 2 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel2	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel2
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_2:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel2
.si_tiene_ayuda_nivel2:
		SET			 6, C
.no_tiene_ayuda_nivel2:
		RES			 6, C
.fin_tiene_ayuda_nivel2:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_2

;nivel 3 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel3	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel3
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_3:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel3
.si_tiene_ayuda_nivel3:
		SET			 6, C
.no_tiene_ayuda_nivel3:
		RES			 6, C
.fin_tiene_ayuda_nivel3:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_3

;nivel 4 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel4	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel4
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_4:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel4
.si_tiene_ayuda_nivel4:
		SET			 6, C
.no_tiene_ayuda_nivel4:
		RES			 6, C
.fin_tiene_ayuda_nivel4:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_4
		
;nivel 5 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel5	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel5
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_5:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel5
.si_tiene_ayuda_nivel5:
		SET			 6, C
.no_tiene_ayuda_nivel5:
		RES			 6, C
.fin_tiene_ayuda_nivel5:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_5
		
;nivel 6 -----------------------------------------------------------------------
		LD			 B, 56	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel1	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel1
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas
.inicia_nivel_6:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 0
		SET			 4, C	;***********************************************************************   ESTO HAY QUE PONERLO A 0 CUANDO HAYA ENEMIGOS
		
		;examino si hay ayudas en siguiente byte
		LD			 A, (IX)
		AND			1111110b
		JR			 Z, .no_tiene_ayuda_nivel6
.si_tiene_ayuda_nivel6:
		SET			 6, C
.no_tiene_ayuda_nivel6:
		RES			 6, C
.fin_tiene_ayuda_nivel6:
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel_6

		POP			HL
		POP			BC
		POP			AF
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
; función: 	busca las puertas que hay que pintar egún la posición del usuario y las pone en habitacion_actual
; entrada: 	prota.pos_mapy, prota.pos_mapx, prota_nivel habitaciones_juego
; salida: 	habitacion_actual
; toca:		todo
;ejemplo: nivel 4, posy 5 y posx 3
;3 + 5 x 8 + 4 x 49
localiza_info_habitacion:
	;~ PUSH	AF
	;~ PUSH	BC
	;~ PUSH	DE
	;~ PUSH	HL

;primera posición: me coloco en la columna correcta
	LD		HL, habitaciones_juego
.situo_columna:	
	LD		 A, (prota_pos_mapx)
	SLA		 A				;multiplico por dos ya que cada habitación va de dos en dos bytes
	LD		 B, 0
	LD		 C, A
	ADD 	HL, BC			;sumo a la posición 0 la columnax2 en la que situarme
	
.situo_fila:
	LD		A, (prota_pos_mapy)
	OR	 	A
	JP		Z, .situo_nivel	;si la fila es 0 no es necesario seguir operando en fila
	
	LD		B, A
	XOR		A
.loop_suma_fila:
	ADD		16				;cada fila tiene 16 bytes
	DJNZ	.loop_suma_fila
	
	LD		 B, 0
	LD		 C, A

	ADD 	HL, BC			;sumo a la columna 16 x filas para situarme en la fila correcta

.situo_nivel:
	LD		 A, (prota_nivel)
	OR	 	 A
	JP		 Z, .actualiza_variable_habitacion	;si el nivel es 0 al pasar por las anterirores ya estoy situado actualizo la variable y termino
	
	PUSH	HL				;guardo el resultado intermedio
	
	LD		 B, A			;preparo la varible del bucle
	LD		DE, 112			;112 = 16x42 son los bytes de cada matriz-nivel
	LD		HL, 0
.loop_suma_nivel:
	ADD		HL, DE
	DJNZ	.loop_suma_nivel
	
	POP		DE				;devuelvo el resultado intermedio en DE que ya no lo necesito
	
	ADD		HL, DE			;sumo el resultado del nivel al resultado intermedio anterior
	
.actualiza_variable_habitacion
	LD		 A, (HL)
	LD		(habitacion_actual), A
	
	;actualizo la variable habitacion_actual y su puntero para poder modificar por si se vuelve a pasar por ahí
	LD		IX, habitacion_actual_puntero
	LD		(IX), H
	LD		(IX + 1), L
	
	;actualizo la variable is_habitacion_terminada
	LD		 A, (habitacion_actual)
	BIT		 4, A					;está terminada la habitación
	JP		 NZ, .si_terminada
.no_terminada:						;pongo un 0 en is_habitacion_terminada
	XOR		 A
	LD		(is_habitacion_terminada), A
	JP		.fin_esta_terminada
.si_terminada:						;pongo un 1 en is_habitacion_terminada
	LD		 A, 1		
	LD		(is_habitacion_terminada), A
.fin_esta_terminada:
	
	;actualizo la variable hay_ayudas
	LD		 A, (habitacion_actual)
	BIT		 6, A							;pintar ayuda
	JP		 NZ, .no_mostrar_ayuda_activa	;0 no hay o ya se han cogido ayudas // 1 mostrar ayuda activa
.si_mostrar_ayuda_activa:							
	LD		 A, 1
	LD		(examina_ayudas_en_pantalla), A	
	JP		.fin_mostrar_ayuda_activa
.no_mostrar_ayuda_activa:
	XOR		 A
	LD		(examina_ayudas_en_pantalla), A
.fin_mostrar_ayuda_activa:					;no restauro B en A porque ya no lo necesito
	
	;actualizo la variable habitacion_extras
	INC		HL				;el byte de los extras está antes de donde se especifican las puertas
	LD		 A, (HL)
	LD		(habitacion_extras), A

	;~ POP		HL	
	;~ POP		DE
	;~ POP		BC
	;~ POP		AF
fin_localiza_info_habitacion:
	RET
	

;;=====================================================
;;TERMINADA_HABIACION_RECORRIDA
;;=====================================================	
; función: 	usando la variable prota_pos_mapx pone un 1 a donde apunta habitacion_recorrida (el array... byte 14 de 
;			habitaciones recorridas en esa fila) para ver si uestra enemigos o no y permita pasar por puertas
; entrada: 	prota_pos_mapx, habitacion_recorrida
; salida: 	habitacion_recorrida (byte 14 de la fila de habitaciones) actualizada con OR A (en A la habitacion)
; toca:		IX, HL, AF
terminada_habitacion_recorrida:
		LD			HL, habitacion_actual_puntero
		LD			 A, (HL)
		SET			 4, A
		LD			(HL), A
		
		LD			 A, HABTERMIN	;da igual qué bit mientras sea distinto de 0 pero se pone 1
		LD			(is_habitacion_terminada), A
		
		;este trozo no sirve de nada pero ya e quedo más tranquilo si lo pongo, por ser exacto y completo
		;no sirve porque se cambiará de habitación y se perderá/actualizará el dato
		LD			 A, (habitacion_actual)
		SET			 4, A
		LD			(habitacion_actual), A
fin_terminada_habitacion_recorrida:
		RET



;;=====================================================
;;ENTRA_HABITACION												*no terminada
;;=====================================================	
; función: 	actualiza elementos en pantalla cuando hay cambios en habitación
;			fondo
;			puertas
;			ayudas
;			imagenes
;			mapa inferior
;			enemigos
; entrada: 	prota_pos_mapy, prota_pos_mapy, prota_nivel
; salida: 	
entra_habitacion:
		CALL	pinta_parte_superior_pantalla
		CALL	pinta_puertas
		CALL	pinta_extra_fondo
		CALL	pinta_ayudas_habitacion
	
		JP		pinta_heroe_mapa
fin_entra_habitacion:


;;=====================================================
;;PINTA_HEROE_MAPA
;;PINTA_BLANCO_MAPA
;;=====================================================	
; función: 	pinta el iconito del heroe en el mapa o un espacio en blanco
; entrada: 	
; salida: 	
; toca:		todo
pinta_heroe_mapa:
		LD		 A, TILEPROTAM
		LD		(elemento_pintar_mapa), A
		JP		posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
fin_pinta_heroe_mapa:
pinta_blanco_mapa:
		LD		 A, TILEGRISM
		LD		(elemento_pintar_mapa), A
		JP		posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
fin_pinta_blanco_mapa:
	
	

;;=====================================================
;;CAMBIO_NIVEL
;;=====================================================	
; función: 	pinta el iconito del heroe en el mapa o un espacio en blanco
; entrada: 	
; salida: 	
; toca:		todo	
cambio_nivel:
	
		;MIRAR CUANDO EL NIVEL SEA -1 (SE SALE DEL CASTILLO Y PUEDE QUE SEA POR TERMINAR JUEGO O SALIR ANTES DE TIEMPO)
	
;		*****************************************************************************************************************************+
		CALL		pinta_nivel
	
		CALL		borra_mapa	
		
fin_cabio_nivel:
		RET
	
	

	
	
	
