;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;INICIALIZA_NIVELES
;;=====================================================	
; función: 	pone el bit 4 de todas las habitaciones (byte habitacion_actual 0,2,4....) a 0 porque hay enemigos
;			pone el bit 6 a 1 si hay ayudas y 0 si no hay ayudas
; entrada: 	habitaciones_plantilla
; salida: 	habitaciones_plantilla con los el bit 4 de los bites bytes impares a 0
; toca: 	habitaciones_plantilla, B


;ahora mismo se pondrá que se pueda navegar por cualquier habitación y sólo se controlarán las ayudas
;cuando ya haya enemigos se modificará para que el bit 4 a 0 todos los enemigos muerto y 1 hay enemigos vivos
;ayudas bit 6 1 hay ayudas y 0 no hay ayudas

inicializa_niveles:
		;inicia habitación para decir si por esa habitación no se ha pasado
		;el 4 bit a 0 indica que por esa habitacion no se ha pasado/no se han atado todos los enemigos
		;el 6 bit a 1 indica que en esa habitación hay ayudas no utilizadas

;nivel 0 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel0	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel0
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 1 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel1	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel1
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 2 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel2	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel2
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 3 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel3	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel3
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 4 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel4	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel4
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 5 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel5	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel5
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		CALL 		resetea_habitaciones_enemigos_nivel

;nivel 6 -----------------------------------------------------------------------
		LD			 B, 56 	;la mitad de bytes del array de un nivel
		LD 			HL, habitaciones_nivel6	;puntero al byte de la habitación
		LD			IX, habitaciones_nivel6
		INC			IX						;el puntero IX apuntará siempre al byte de las ayudas		
		JP 			resetea_habitaciones_enemigos_nivel
;fin_iniciliza_niveles:


resetea_habitaciones_enemigos_nivel:
.inicia_nivel:
		LD		 	 C, (HL)
		;pongo habitación no terminada bit 4 habitación a 1
		RES			 4, C		;0 es que hay enemigos (HABITACIÓN NO TERMINADA) y 1 es que no los hay
		
		LD			(HL), C
[2]		INC			HL		;pongo puntero en la siguiente habitación (2 saltos)
[2]		INC			IX		;pongo puntero en la siguiente habitación (2 saltos)
		DJNZ		.inicia_nivel
;fin_resetea_habitaciones_enemigos_nivel:
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
		LD			HL,array_aux_vidas
		LD			 B,NMAXVIDREL
loop_marcador_caras_negro:	;asignar espacios en negro
		LD			(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
		INC			HL
		DJNZ		loop_marcador_caras_negro
fin_loop_marcador_caras_negro:
		;2-pinto las caras según el n de vidas
		LD			 A, (prota_vidas)
		OR			 A
		RET 		 Z
		LD			 B, A
		LD			HL, array_aux_vidas
loop_marcador_caras: ;asignar caras
		LD			(HL), POSCARAMAP	;13 posición mapa tiles para cara
		INC			HL
		DJNZ		loop_marcador_caras
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

;actualizo la variable habitacion_terminada
	;BIT		  	 4, A					;está terminada la habitación
	AND			00010000b
	JP			NZ, .si_terminada
.no_terminada:						;pongo un 0 en habitacion_terminada
	XOR		 	 A
	LD			(habitacion_terminada), A
	JP			.fin_esta_terminada
.si_terminada:						;pongo un 1 en habitacion_terminada
	LD		 	 A, 1		
	LD			(habitacion_terminada), A
.fin_esta_terminada:

	;actualizo la variable habitacion_actual y su puntero para poder modificar por si se vuelve a pasar por ahí
	LD		IX, puntero_habitacion_actual
	LD		(IX), H
	LD		(IX + 1), L
	
	;actualizo la variable habitacion_extras
	INC		HL				;el byte de los extras está antes de donde se especifican las puertas
	LD		(puntero_extras_habitacion_actual), HL
	LD		 A, (HL)
	LD		(habitacion_extras), A
fin_localiza_info_habitacion:
	RET
	

;;=====================================================
;;TERMINADA_HABIACION_RECORRIDA
;;=====================================================	
; función: 	usando la variable prota_pos_mapx pone un 1 a donde apunta habitacion_recorrida (el array... byte 14 de 
;			habitaciones recorridas en esa fila) para ver si muestra enemigos o no y permita pasar por puertas
; entrada: 	prota_pos_mapx, habitacion_recorrida
; salida: 	habitacion_recorrida (byte 14 de la fila de habitaciones) actualizada con OR A (en A la habitacion)
; toca:		IX, HL, AF
terminada_habitacion_recorrida:
			LD			IX, puntero_habitacion_actual
			LD			 H, (IX)
			LD			 L, (IX+1)
			SET			 4, (HL)	
		
			LD			 A, ISHABTERMIN			;1 => cierto habitación terminada
			LD			(habitacion_terminada), A
		
			JP			pinta_parte_superior_pantalla
;fin_terminada_habitacion_recorrida


;;=====================================================
;;ENTRA_HABITACION
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
		;apago pantalla
		CALL		DISSCR
		
		;nos ocupaos de pintar la habitación
		CALL		pinta_heroe_mapa
		
		PUSH		IX
		CALL		pinta_parte_superior_pantalla
		POP			IX
		
		;apago pantalla
		CALL		ENASCR

		;ahora nos ocupamos de los enemigos
		CALL		resetea_enemigos
		
		;~ ;ñññññ   para que no salgan enemigos y el conde esté muerto
		;~ LD			 A, 1
		;~ LD			(dracula_muerto), A
		;~ CALL		resetea_tiempo
		;~ RET
		
.mira_nivel0:
		LD			 A, (prota_nivel)
		OR			 A
		JP			NZ, .mira_nivel1
		CALL		inicializa_enemigos_fase0
		JP			.fin_mira_nivel
.mira_nivel1:
		CP			 1
		JP			NZ, .mira_nivel2
		CALL		inicializa_enemigos_fase1
		JP			.fin_mira_nivel
.mira_nivel2:
		CP			 2
		JP			NZ, .mira_nivel3
		CALL		inicializa_enemigos_fase2
		JP			.fin_mira_nivel
.mira_nivel3:
		CP			 3
		JP			NZ, .mira_nivel4
		CALL		inicializa_enemigos_fase3
		JP			.fin_mira_nivel
.mira_nivel4:
		CP			 4
		JP			NZ, .mira_nivel5
		CALL		inicializa_enemigos_fase4
		JP			.fin_mira_nivel		
.mira_nivel5:
		CP			 5
		JP			NZ, .mira_nivel6
		CALL		inicializa_enemigos_fase5
		JP			.fin_mira_nivel
.mira_nivel6:
		CALL		inicializa_enemigos_fase6
.fin_mira_nivel:

;reposiciona el punto de mira
		PUSH 		IX
		LD			IX,  puntomira
		LD			(IX), POSXPM
		LD			(IX + 1),POSYPM
		POP  		IX

;examinamos lo que le queda si es que tiene ballesta mejorada
		LD			 A, (contador_ayuda_ballesta)
		OR			 A
		RET			 Z			;si era ya 0 vamos directamente a pintar la habitación
			DEC			 A								;resto una habitación para disparar con si no es 0
			LD			(contador_ayuda_ballesta), A
			RET			NZ
				JP			resetea_ballesta				;si contador_ayuda_ballesta=0 vuelvo a poner la ballesta por defecto
;fin_entra_habitacion:


;;=====================================================
;;PINTA_HEROE_MAPA
;;PINTA_BLANCO_MAPA
;;=====================================================	
; función: 	pinta el iconito del heroe en el mapa o un espacio en blanco
; entrada: 	
; salida: 	
; toca:		todo
pinta_heroe_mapa:
		LD			 A, TILEPROTAM
		LD			(elemento_pintar_mapa), A
		JP			posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
;fin_pinta_heroe_mapa:
pinta_blanco_mapa:
		LD			 A, TILEGRISM
		LD			(elemento_pintar_mapa), A
		JP			posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
;fin_pinta_blanco_mapa:
	

;;=====================================================
;;CAMBIO_NIVEL
;;=====================================================	
; función: 	pinta el iconito del heroe en el mapa o un espacio en blanco
;			cambia el número de nivel
; entrada: 	
; salida: 	
; toca:		todo	
cambio_nivel:
		CALL		pinta_nivel
		
		;carga sprites en memoria
		CALL 		carga_patrones_sprites_nivel
	
		JP			borra_mapa	
;fin_cambio_nivel:


;;=====================================================
;;CHECK_COLISIONES_OBJETOS
;;=====================================================	
; función: 	revisa (con enemigos+ayudas o puertas según si la habitación ha sido recorrida o no) las variables para ver si se disparó sobre ellas
; entrada: 	habitacion_terminada
; salida: 	-
; toca:		HL,BC, DE
check_colisiones_objetos:
		;recorre puertas y sale
		CALL		check_colisiones_puertas

		LD			 A, (hay_ayudas_en_pantalla)
		OR			 A
		JP			 Z, .no_hay_ayudas
		CALL		check_colision_ayudas	; si hay ayudas que examinar
.no_hay_ayudas:

		;pantalla limpia?
		LD			 A, (habitacion_terminada)
		OR			 A
		RET			NZ 		;pantalla limpia? SI
		 
.habitacion_no_terminada:	;pantalla limpia? NO
		;recorre enemigos
		JP			check_colisiones_enemigos
;fin_check_colisiones_objetos:	


;;=====================================================
;;ACCION_MATA_DRACULA
;;=====================================================	
; función: 	pone un texto cuando matas a drácula y preparo variables para que cuente el tiempo y dracula muerto
accion_mata_dracula:
		;paro la musica que se estuviera reproduciendo
		XOR			 A
		CALL		play_musica
			
		CALL		decrementa_contador_enemigos
		
		;Ocultamos todos los sprites
		CALL		oculta_todos_sprites

		CALL		borra_mapa

		;activo variable drácula muerto		
		LD			 A, SI
		LD			(dracula_muerto), A

		;inicializar contador de tiempo
		XOR			 A
		LD			(contador), A
		LD			(segundos), A
		LD			(minutos),  A

		;cargamos mapa de pantalla banco 1 y 2
		LD			HL, tiles_mapa_entrefases
		LD			DE, TILMAP
		CALL		depack_VRAM
		
		;pinto texto de matar a drácula
		LD			DE, TILMAP + 256		;destino en vram (pos tiles + 256 (banco 0 + 256 banco )
		LD			HL, texto_deaddracula	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 32 * 8
		CALL		LDIRVM
		
		CALL		oculta_todos_sprites
		
[2]		CALL		espera_estandar

		CALL		resetea_tiempo
		
		JP			entra_habitacion
;fin_accion_mata_dracula:


;;=====================================================
;;MIRA_SI_ESTA_JUEGO_TERMINADO
;;=====================================================
; funcion:	para que cuando se salga por la puerta inferior del nivel 0 llegue al final bueno del juego
mira_si_esta_juego_terminado:
			;está muerto drácula?
			LD				 A, (dracula_muerto)
			OR				 A
			RET				 Z
			
			;estás en el nivel 0?
			LD				 A, (prota_nivel)
			OR				 A
			RET				NZ
			
			;estás en la fila de abajo?
			LD				 A, (prota_pos_mapy)
			OR				 A
			RET				NZ
;se han complido todas las condiciones... fin del juego bueno
			LD			 A, 1
			LD			(tipo_gameover), A
			JP			game_over
;fin_mira_si_esta_juego_terminado:


;;=====================================================
;;GAME_OVER
;;=====================================================	
; función: muestra la página de fin de juego según parámetro de entrada
; entrada: PROTAMUERTO	0  FINBUENO	1  FINMALO 2
game_over:		
			;apago pantalla
			CALL		DISSCR
			
			;limpia la pantalla
			CALL		limpia_pantalla_completa

.fin_bueno:
			LD			 A, (tipo_gameover)
			CP			 1
			JP			NZ, .fin_protamuerto
				;cargando banco 2
				;cargamos los patrones
				LD			HL, tiles_patrones_finalbueno_bank1
				LD			DE, CHRTBL + #0800
				CALL		depack_VRAM	
				;cargamos los colores de los patrones
				LD			HL, tiles_color_finalbueno_bank1
				LD			DE, CLRTBL + #0800
				CALL		depack_VRAM
			
				;cargamos mapa de pantalla banco 1 y 2
				LD			HL, tiles_mapa_finalbueno_bank01
				LD			DE, TILMAP
				CALL		depack_VRAM

				;cangando banco 3
				;cargamos los patrones
				LD			HL,tiles_patrones_marcador
				LD			DE,CHRTBL + #1000
				CALL		depack_VRAM	
				;cargamos los colores
				LD			HL,tiles_color_marcador
				LD			DE,CLRTBL + #1000
				CALL		depack_VRAM

				LD			DE, TILMAP + 512	;destino en vram (pos tiles + 256 (banco 0 + 256 banco )
				LD			HL, texto_finalbueno
				LD			BC, 32 * 8
				CALL		LDIRVM
				
				CALL		ENASCR

[5]				CALL		espera_estandar

				CALL		limpia_pantalla_inferior
				
				LD			DE, TILMAP + 512 + 103	;destino en vram (pos tiles + 256 (banco 0 + 256 banco )
				LD			HL, texto_graciasporjugar
				LD			BC, 18
				CALL		LDIRVM
				
			JP			.fin_examina_final
			
.fin_protamuerto:
			LD			 A, (tipo_gameover)
			OR			 A
			JP			NZ, .fin_malo
				;cargando banco 1
				;cargamos los patrones
				LD			HL, tiles_patrones_gameover1_bank1
				LD			DE, CHRTBL + #0800
				CALL		depack_VRAM	
				;cargamos los colores de los patrones
				LD			HL, tiles_color_gameover1_bank1
				LD			DE, CLRTBL + #0800
				CALL		depack_VRAM
			
				;cargamos mapa de pantalla banco 1 y 2
				LD			HL, tiles_mapa_gameover1_bank01
				LD			DE, TILMAP
				CALL		depack_VRAM

				;cangando banco 2
				;cargamos los patrones
				LD			HL,tiles_patrones_marcador
				LD			DE,CHRTBL + #1000
				CALL		depack_VRAM	
				;cargamos los colores
				LD			HL,tiles_color_marcador
				LD			DE,CLRTBL + #1000
				CALL		depack_VRAM

				LD			HL, texto_gameover1A;guardo puntero al array a pintar (como psar por referencia)
				LD			BC, 29				;nº posiciones a pintar
				LD			DE, TILMAP + 577	;destino en vram
				CALL		LDIRVM
				
				LD			HL, texto_gameover1B;guardo puntero al array a pintar (como psar por referencia)
				LD			BC, 29				;nº posiciones a pintar
				LD			DE, TILMAP + 609	;destino en vram
				CALL		LDIRVM
				
				LD			HL, texto_gameover1C;guardo puntero al array a pintar (como psar por referencia)
				LD			BC, 29				;nº posiciones a pintar
				LD			DE, TILMAP + 641	;destino en vram
				CALL		LDIRVM
				
			JP			.fin_examina_final

.fin_malo:
				;cargando banco 2
				;cargamos los patrones
				LD			HL, tiles_patrones_finalbueno_bank1
				LD			DE, CHRTBL + #0800
				CALL		depack_VRAM	
				;cargamos los colores de los patrones
				LD			HL, tiles_color_finalbueno_bank1
				LD			DE, CLRTBL + #0800
				CALL		depack_VRAM
				;cargamos mapa de pantalla banco 1 y 2
				LD			HL, tiles_mapa_finalbueno_bank01
				LD			DE, TILMAP
				CALL		depack_VRAM
				
				;borramos al prota
				CALL		borra_prota_pantalla_fin

				;cangando banco 3
				;cargamos los patrones
				LD			HL,tiles_patrones_marcador
				LD			DE,CHRTBL + #1000
				CALL		depack_VRAM	
				;cargamos los colores
				LD			HL,tiles_color_marcador
				LD			DE,CLRTBL + #1000
				CALL		depack_VRAM

				LD			DE, TILMAP + 512	;destino en vram (pos tiles + 256 (banco 0 + 256 banco )
				LD			HL, texto_finalmalo
				LD			BC, 32 * 8
				CALL		LDIRVM	
.fin_examina_final:
			;apago pantalla
			CALL		ENASCR
			
			;pongo la música del gameover
			LD			 A, MUSICAGAMEOVER
			CALL		play_musica
				
[7]			CALL	espera_estandar

			JP			inicio_juego
;fin_game_over:


;;=====================================================
;;BORRA_PROTA_PANTALLA_FIN
;;=====================================================	
; función: para ahorra memoria el final malo es el final bueno sin el dibujo del prota y esta subrutina lo borra
borra_prota_pantalla_fin:
			LD			HL,fondo_patalla_final	;guardo puntero al array a pintar (como psar por referencia)
			LD			(wordaux2),HL			;en la variable wordaux2

			LD			HL,TILMAP + 256 + 4		;calcula posición en tilemap
			LD			(wordaux1),HL			;guarda valor pos tilemap en wordaux1
			LD			B,H						;coloca posición tilemap BC
			LD			C,L

			LD			 A, 8					;nº de filas
			LD			(byteaux1), A			;nº de filas
			LD			 A, 6					;nº de columnas
			LD			(byteaux2), A			;nº de columnas

			JP			pinta_array
;fin_borra_prota_pantalla_fin:


;;=====================================================
;;ACTUALIZA_HEARTBEAT
;;=====================================================	
; función: incrementa el hearbeat para el movimiento (escena) de los distintos enemigos
actualiza_heartbeat:
			LD			 B, 14	;se han definido 14 escena de enemigos distintas + uno genérico para jefes
			LD			HL, heartbeat_enemigos
.loop_heartbeat:	
					INC			(HL)
					INC			HL
			DJNZ		.loop_heartbeat
;fin_actualiza_heartbeat:
			RET
			

;;=====================================================
;;ACTUALIZA_CRONOMETRO_SALIDA
;;=====================================================	
; función:  si drácula no está muerto nada
;			si drácula está muerto incrementa un contador de tiempo que se puso a 0 al matar a drácula
;			si el minutero llega a 2 la partida acaba con final malo ya que no saliste del castillo
;				a tiempo (antes de que se derrumbara)
actualiza_cronometro_salida:
		LD			 A, (dracula_muerto)
		OR			 A
		RET			 Z
		CALL		incrementa_reloj
		LD			 A, (minutos)
		CP			TIEMPO_LIMITE_SALIR_CAS
		RET			NZ
		;gameover (tipo 2: matas a drácula pero no te da tiepo a salir en 2 minutos)
		LD			 A, 2
		LD			(tipo_gameover), A
		JP			game_over
;fin_actualiza_cronometro_salida:	

