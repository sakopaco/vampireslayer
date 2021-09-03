;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	
;relacionadas con pintado en pantalla (y no sprites)


;;=====================================================
;;COLOR_PANTALLA
;;=====================================================	
; función: 	el equivalente en basic a color 15,1,1
; entrada: 	HL	que apunta a un array de bytes con 3 bytes FORCLR, BAKCLR y BDRCLR
; salida: 	-
; toca: 	todo
color_pantalla:
	LD		 A, (HL)			;FORCLR 
	LD 		(FORCLR),A
	INC		HL
	
	LD		 A, (HL)			;BAKCLR
	LD 		(BAKCLR),A
	INC		HL
	
	LD		 A, (HL)
	LD 		(BDRCLR),A			;BDRCLR
	JP		CHGCLR 
fin_color_pantalla:
	;RET


;;=====================================================
;;PREPARAPANTALLA
;;=====================================================	
; función: elimina clic cuando se pulsa tecla, cls, screen 2,2
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
sub_preparapantalla:
	;toca A y Z
elimina_clic;
	XOR		 A
	LD		(CLIKSW),A
fin_elimina_clic:

	;toca A
limpia_pantalla:
	XOR		 A
	CALL 	CLS
fin_limpia_pantalla:

	;toca A y direcciones #F3E9/#F3EA/#F3EB, poner en HL array con 3 valores
	LD		HL, color_base
	CALL	color_pantalla
	
	;cambiamos a SCREEN 2,2 del BASIC
	;toca A
screen2:
	LD		 A, 2
	CALL	CHGMOD			;selecciona screen 2
sprites_16_16:
	LD		 A, (RG1SAV)
	OR		00000010b		;fuerza sprites de 16x16
	LD		(RG1SAV), A		;no lo guardamos en la copia de variables del sistema
	LD		 B, A
	LD		 C, 1
	JP		WRTVDP			;opción alternativa de escribir las tres lineas siguientes
	;~ CALL	WRTVDP			;lo escribe en el registro 1 del VDP
	;~ RET
fin_sub_preparapantalla:
	

;;=====================================================
;;PINTA_PANTALLA_COMPLETA
;;=====================================================	
; función: pinta el escenario, las 3 partes
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_pantalla_completa:
	CALL 	pinta_parte_superior_pantalla
	
	CALL 	pinta_parte_inferior_pantalla	
fin_pinta_pantalla_completa:
	RET


;;=====================================================
;;PINTA_PARTE_SUPERIOR_PANTALLA
;;=====================================================	
; función: pinta el escenario, los dos bancos superiores
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_parte_superior_pantalla:
	;cargando banco 1
	;cargamos los patrones
	LD		HL, tiles_patrones_nivel0
	LD		DE, CHRTBL
	CALL	depack_VRAM
	;cargamos los colores de los patrones
	LD		HL, tiles_color_nivel0
	LD		DE, CLRTBL
	CALL	depack_VRAM
	
	;cargando banco 2
	;cargamos los patrones
	LD		HL, tiles_patrones_nivel0
	LD		DE, CHRTBL + #0800
	CALL	depack_VRAM	
	;cargamos los colores de los patrones
	LD		HL, tiles_color_nivel0
	LD		DE, CLRTBL + #0800
	CALL	depack_VRAM
	
	;cargamos mapa de pantalla banco 1 y 2
	LD		HL, tiles_mapa_nivel0
	LD		DE, TILMAP
	JP		depack_VRAM
fin_pinta_parte_superior_pantalla:
tiles_patrones:		DW	0
tiles_color:		DW	0
tiles_mapa:			DW	0


;;=====================================================
;;PINTA_PARTE_INFERIOR_PANTALLA
;;=====================================================	
; función: pinta la parte inferior del escenario que es común
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_parte_inferior_pantalla:
	;cangando banco 3
	;cargamos los patrones
	LD		HL,tiles_patrones_marcador
	LD		DE,CHRTBL + #1000
	CALL	depack_VRAM	
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_marcador
	LD		DE,TILMAP + #0200
	CALL	depack_VRAM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_marcador
	LD		DE,CLRTBL + #1000
	JP		depack_VRAM
fin_pinta_parte_inferior_pantalla:



;;=====================================================
;;PINTA_VIDAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinten y actualiza_vidas
; entrada: 	array_aux_vidas
; salida: 	actualiza_vidas_sn
; toca:		todo
pinta_vidas:
	CALL	actualiza_marcador_vidas
	
	LD		HL, array_aux_vidas
	LD		DE, TILMAP + POSVIDAS 	;inicio posición en el mapa de tiles de las vidas
	LD		BC, NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	JP		LDIRVM
fin_pinta_vidas:
	;RET
	
	

;;=====================================================
;;PINTA_RELIQUIAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinten y actualiza_reliquias
; entrada: 	array_aux_reliquias
; salida: 	-
; toca:		todo
pinta_reliquias:
	CALL	actualiza_buffer_reliquias
	
	LD		HL, array_aux_reliquias
	LD		DE, TILMAP + POSRELIQ 	;inicio posición en el mapa de tiles de las vidas
	LD		BC, NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	JP		LDIRVM
fin_pinta_reliquias:
	;RET
	


	
;;=====================================================
;;PINTA_NIVEL
;;=====================================================	
; función: 	actualiza el nivel en la parte de puntuación
; entrada: 	prota_nivel
; salida: 	-
; toca:		HL,DE,BC
pinta_nivel:	
	;forma más avanzada sin llamada a la bios
	LD		BC,TILMAP + POSNIVEL ;posición en el mapa de tiles del tile de nivel
	LD		 A, (prota_nivel)	;seleccionando la pos del banco de tiles a poner en el mapa
	ADD		'0'	
	LD		 D, A
	
	CALL	pinta_tile_suelto	;nota ... un call+ret se debe poder sustiruir por un jp
fin_pinta_nivel:
	RET



;;=====================================================
;;PINTA_TILE_SUELTO
;;=====================================================	
; función: 	pinta al tile que digamos en D, en la posición BC
; entrada: 	BC (posición a pintar en el mapa),D (qué se va a pintar el esa posición)
; salida: 	-
; toca:		-
pinta_tile_suelto:
	IN		 A,(REGEST)		;leer registro de estado (recomendado)
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR		1000000b		;+64
	OUT		(REGEST),A
	
	LD		A,D
	OUT		(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
fin_pinta_tile_suelto:
	RET





;;=====================================================
;;MIRA_PINTA ENERGIA
;;=====================================================	
; función: 	actualiza el nivel de energia en la parte de puntuación
; nota:		el cuadrado más bajo de ejergía siempre estará pintado... se obviará
; entrada: 	prota.energia, array_aux_energia
; salida: 	-
; toca:		ninguno porque usa EXX

; nota importante... lo mismo interesa hacer esto con un array para comparar y un bucle

mira_pinta_energia:
	EXX							;por si acaso guardo el contenido de HL (si veo que no es necesario guardarlo lo quito) uso esto en vez de push por el nº ciclos
	
	LD		 A,(prota_energia) 	;para las comparaciones A variable (actual) y B fijo (limites)

	LD		 C,TILENEGRO		;para agilizar asignaciones en vez de un valor cte uso otro registro
pinta_ener:
pinta_ener_tile_8:
	LD		HL,ultimo_pos_array_aux_energia	;coloco puntero en array e iré decrementando
	LD		 B,TILEENERG8
	CP		 B
	JR		C,pinta_ener_tile_8_negro
	LD		(HL),TILEMAPVERD
	JR		pinta_ener_tile_7
pinta_ener_tile_8_negro:
	LD		(HL),C

pinta_ener_tile_7:
	DEC		HL
	LD		 B,TILEENERG7
	CP		 B
	JR		C,pinta_ener_tile_7_negro
	LD		(HL),TILEMAPVERD
	JR		pinta_ener_tile_6
pinta_ener_tile_7_negro:
	LD		(HL),C

pinta_ener_tile_6:
	DEC		HL
	LD		 B,TILEENERG6
	CP		 B
	JR		C,pinta_ener_tile_6_negro
	LD		(HL),14
	JR		pinta_ener_tile_5
pinta_ener_tile_6_negro:
	LD		(HL),C

pinta_ener_tile_5:
	DEC		HL
	LD		 B,TILEENERG5
	CP		 B
	JR		C,pinta_ener_tile_5_negro
	LD		(HL),TILEMAPVERD
	JR		pinta_ener_tile_4
pinta_ener_tile_5_negro:
	LD		(HL),C

pinta_ener_tile_4:
	DEC		HL
	LD		 B,TILEENERG4
	CP		 B
	JR		C,pinta_ener_tile_4_negro
	LD		(HL),TILEMAPAMAR
	JR		pinta_ener_tile_3
pinta_ener_tile_4_negro:
	LD		(HL),C
	
pinta_ener_tile_3:
	DEC		HL
	LD		 B,TILEENERG3
	CP		 B
	JR		C,pinta_ener_tile_3_negro
	LD		(HL),TILEMAPAMAR
	JR		pinta_ener_tile_2
pinta_ener_tile_3_negro:
	LD		(HL),C

pinta_ener_tile_2:
	DEC		HL
	LD		 B,TILEENERG2
	CP		 B
	JR		C,pinta_ener_tile_2_negro
	LD		(HL),TILEMAPROJO
	JR		fin_mira_pinta_energia		;siempre estará pintado el cuadro mínimo
pinta_ener_tile_2_negro:
	LD		(HL),C

fin_mira_pinta_energia:
	EXX
	RET


;;=====================================================
;;PINTA_ENERGIA
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinte la barra de energia actual
; entrada: 	array_aux_energia
; toca:		todo
pinta_energia:
	CALL	mira_pinta_energia
	
	LD		HL, array_aux_energia
	LD		DE, TILMAP + POSENERG 	;inicio posición en el mapa de tiles de las vidas
	LD		BC, NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	JP		LDIRVM
fin_pinta_energia:



;;=====================================================
;;BORRA_MAPA
;;=====================================================	
; función: 	pone todas las habitaciones del mapa a negro (los tiles del mapa los rellena con un array a 0 - caracter en negro)
; entrada: 	array_aux_mapa_limpiar
; salida: 	-
; toca:		AF
borra_mapa:
	EXX
	
	LD		HL,array_aux_mapa_limpiar
	LD		DE,TILMAP + POSMAPLIN1 	;inicio posición en el mapa de tiles de la primera fila del mapa
	LD		BC,NHABNIVEL			;cada nivel son 7 filas con 7 habitaciones "posibles"
	CALL	LDIRVM
	
	LD		HL,array_aux_mapa_limpiar
	LD		DE,TILMAP + POSMAPLIN2
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar
	LD		DE,TILMAP + POSMAPLIN3
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,TILMAP + POSMAPLIN4
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,TILMAP + POSMAPLIN5
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,TILMAP + POSMAPLIN6
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,TILMAP + POSMAPLIN7
	LD		BC,NHABNIVEL
	CALL	LDIRVM
	
	EXX
fin_borra_mapa:
	RET





;=====================================================
;;PINTA_ARRAY
;;=====================================================	
;;funcion:  (pinta el mismo tile) se le pasa un array con posiciones de tiles y coordenadas x e y y los pinta en screen 2
;;entrada:	wordaux1 (pos inicio sc2 donde pintar) y wordaux2 (puntero al array a pintar), BC (posición en tilemap) , D filas y E columnas
;;salida:	-
;;importante: necesita de una variable wordaux1 tipo WD (wordaux1: 	DW	0)
;; ejemplo llamada:
	;~ LD		HL,array_tiles					;guardo puntero al array a pintar (como psar por referencia)
	;~ LD		(wordaux2),HL					;en la variable wordaux2
	;~ LD		HL,SC2MAP + 256 + 32			;calcula posición en tilemap
	;~ LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	;~ LD		B,H								;coloca posición tilemap BC
	;~ LD		C,L
	;~ LD		D,2								;nº de filas
	;~ LD		E,3								;nº de columnas
	;~ CALL	pinta_array

pinta_array:
	PUSH	AF
	
	;contamos con que la posición "global" en el tilemap está ya en BC
	;y el puntero al array a pintar en wordaux2 y la posición en tilemap sc2 en wordaux1
	;inicializa
	IN		 A,(REGEST)		;leer registro de estado (recomendado)
	
	;coloca puntero para pintar tile según BC
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR		1000000b		;+64
	OUT		(REGEST),A

	
	LD		HL,(wordaux2)	;HL es lo que se pintará y le he pasado el puntero del array tilemap a pintar
.pa_pinta_fila:
	LD		 B,E
.pa_pinta_columnas: 		;finta la fila (pintando las columnas)
	LD		 A,(HL)
	OUT		(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
	INC		HL
	DJNZ	.pa_pinta_columnas
	
	;no es una solución elegante lo de repetir código pero queda claro
	;por si hay otra fila
	PUSH	HL
	LD		HL,(wordaux1)
	LD		BC,32
	ADD		HL,BC
	LD		(wordaux1),HL
	LD		B,H
	LD		C,L
	POP		HL
	
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto 
	OR		1000000b		;+64
	OUT		(REGEST),A
	
	;si hay otra fila repite
	DEC		 D
	LD		 A,D		;¿hay otra fila?
	OR		 A
	JP		NZ,.pa_pinta_fila
	
	POP		AF
	
fin_pinta_array:
	RET
;;variables asocidas a la función (no sé si dejarlo aquí y encapsularlo todo o hacerla reutilizable)
;; por de pronto la dejo aquí
wordaux1:		DW	0	;almacena la posición en el tilemap 0 al 675
wordaux2:		DW	0	;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 3 bancos)





;;=====================================================
;;PINTA_PUERTAS
;;=====================================================	
; función: 	examina A y mira si tiene que pintar puertas de los lados, arriba o abrajo o las escaleras (o no)
; entrada: 	habitacion_actual 1 escalera 1 puerta arriba 1 pu der 1 pu aba 1 pu izq (si es 0 pinta pared)
; salida: 	-
; toca:		todo
pinta_puertas:
	CALL	pinta_parte_superior_pantalla	;pinta pasillo y paredes

	CALL	localiza_info_habitacion	;busca qué puertas debe pintar y lo mete en habitación_actual
	
	LD		 A, (habitacion_actual)		;se mete en A porque la función pide A y para no buscar el valor 4 veces

;	BIT		 4, A
;	CALL	nz, pinta_escalera

	BIT		 3, A
	CALL	nz, pinta_puerta_arr

	BIT		 2, A
	CALL	nz, pinta_puerta_der

	BIT		 1, A
	CALL	nz, pinta_puerta_aba
	
	BIT		 0, A
	CALL	nz, pinta_puerta_izq
fin_pinta_puertas:
	RET




;;=====================================================
;;PINTA_PUERTA_ABA
;;=====================================================	
; función: 	pinta la puerta de abajo
; entrada: 	array_puerta_abajo, wordaux2, wordaux1
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_aba:
	LD		HL,array_puerta_abajo			;guardo puntero al array a pintar (como psar por referencia)
	LD		(wordaux2),HL					;en la variable wordaux2
	LD		HL,TILMAP + POSPUERABAJ			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,1								;nº de filas
	LD		E,4								;nº de columnas
	JP		pinta_array
fin_pinta_puerta_aba:

;;=====================================================
;;PINTA_PUERTA_ARR
;;=====================================================	
; función: 	pinta la puerta de arriba
; entrada: 	array_puerta_arriba, wordaux2, wordaux1
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_arr:
	LD		HL,array_puerta_arriba			;guardo puntero al array a pintar (como psar por referencia)
	LD		(wordaux2),HL					;en la variable wordaux2
	LD		HL,TILMAP + POSPUERARRI			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,5								;nº de filas
	LD		E,4								;nº de columnas
	JP		pinta_array
fin_pinta_puerta_arr:


;;=====================================================
;;PINTA_PUERTA_DER
;;=====================================================	
; función: 	pinta la puerta de la derecha
; entrada: 	array_puerta_derecha, wordaux2, wordaux1
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_der:
	LD		HL,array_puerta_derecha			;guardo puntero al array a pintar (como psar por referencia)
	LD		(wordaux2),HL					;en la variable wordaux2
	LD		HL,TILMAP + POSPUERDERE			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,7								;nº de filas
	LD		E,3								;nº de columnas
	JP		pinta_array
fin_pinta_puerta_der:
	
;;=====================================================
;;PINTA_PUERTA_IZQ
;;=====================================================	
; función: 	pinta la puerta de la izquierda
; entrada: 	array_puerta_izquierda, wordaux2, wordaux1
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_izq:
	LD		HL,array_puerta_izquierda		;guardo puntero al array a pintar (como pasar por referencia)
	LD		(wordaux2),HL					;en la variable wordaux2
	LD		HL,TILMAP + POSPUERIZQU			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,7								;nº de filas
	LD		E,3								;nº de columnas
	JP		pinta_array
fin_pinta_puerta_izq:




;;=====================================================
;;POSICIONA_EN_MAPA
;;=====================================================	
; función: 	en el mapa de marcadores de la derecha/abajo marca un cuadro en gris o con un muñeco
;			según el valor de prota.posición pinta entrá un muñeco y por donde vaya pasando el prota
;			quedará en gris
; entrada: 	elemento_pintar_mapa, prota_pos_mapy, prota_pos_mapx
; salida: 	-
; toca:		todos
posiciona_en_mapa:
	;#0238 es la posición en mapa de tiles de la esquina superior izquierda del mapa (569 en decimal)
	LD		HL, TILMAP + POSMAPA;pos inicial
	
	;ahora se le calcula la fila a pintar ya que va de abajo a arriba y no como en el mapa + columna
.sumar_fila:
	LD		 A,(prota_pos_mapy)
	CP		 1
	JR		 Z, .fila_1
	LD		 A,(prota_pos_mapy)
	CP		 2
	JR		 Z, .fila_2
	LD		 A,(prota_pos_mapy)
	CP		 3
	JR		 Z, .fila_3
	LD		 A,(prota_pos_mapy)
	CP		 4
	JR		 Z, .fila_4
	LD		 A,(prota_pos_mapy)
	CP		 5
	JR		 Z, .fila_5
	LD		 A,(prota_pos_mapy)
	CP		 6
	JR		 Z, .sumar_columna
	;no consulto la 0 porque si no es ninguna de las anteriores es 0 y por tanto sería un jr fila_0
	
.fila_0:
	LD		DE, 192
	ADD		HL, DE			;nota: se que repito el ADD pero la otra opción es inicializar DE y ya tarda mucho la funicón (es por velicidad)
	JP		.sumar_columna
.fila_1:
	LD		DE, 160
	ADD		HL, DE
	JP		.sumar_columna
.fila_2:
	LD		DE, 128
	ADD		HL, DE
	JP		.sumar_columna
.fila_3:
	LD		DE, 96
	ADD		HL, DE
	JP		.sumar_columna
.fila_4:
	LD		DE, 64
	ADD		HL, DE
	JP		.sumar_columna
.fila_5:
	LD		DE, 32
	ADD		HL, DE
	JP		.sumar_columna
.fila_6:
	;pongo fila_6 por poner ya que si es la fila 6 equiv. a primera fila del mapa y por tanto no suma fila
	
	
.sumar_columna:
	LD 		 A, (prota_pos_mapx) ;POS X
	LD		 D, 0
	LD		 E, A
	ADD		HL, DE
	
	;resultado en BC para usar en la función pinta_tile_suelto
	LD		 B, H
	LD		 C, L
	
	;terminado de fijar la coordenada recuperamos a para ver el tipo
	LD		 A, (elemento_pintar_mapa)
	CP		 TILEGRISM
	JP		 Z, pinta_pos_mapa_vacio
	LD		 D, TILEPROTAM
	JP		fin_pinta_pos_mapa
pinta_pos_mapa_vacio:
	LD		 D, TILEGRISM	

fin_pinta_pos_mapa:
	JP		pinta_tile_suelto
fin_posiciona_en_mapa:




;;=====================================================
;;EFECTO_IMAGEN_TIRA_RELIQUIA
;;=====================================================	
; función: 	hace que el fondo de la pantalla parpadee N veces
; entrada: 	actualiza_reliquias_sn
; salida: 	-
; toca: 	todo
efecto_imagen_tira_reliquia:
	LD		 A, 20;RETARDOREL
	LD		 B, A

.parpadea_fondo:
	PUSH	BC
	LD		HL, color_bomba1
	CALL	color_pantalla
	
	;~ PUSH	BC
	;~ LD		 A, 255
	;~ LD		 B, A
;~ .bucle_de_espera:
	;~ NOP
	;~ DJNZ	 .bucle_de_espera
	;~ POP		BC
	HALT

	
	LD		HL, color_bomba2
	CALL	color_pantalla
	POP		BC
	DJNZ	.parpadea_fondo
	
	LD		HL, color_base
	JP		color_pantalla
fin_efecto_imagen_tira_reliquia:




;;=====================================================
;;PINTA_OBJ_CUADRADO
;;=====================================================	
; función: 	pinta objetos en pantalla de 2x2
; entrada: 	
; salida: 	-
; toca:		
pinta_obj_cuadrado:

fin_pinta_obj_cuadrado:

