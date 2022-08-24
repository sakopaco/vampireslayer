;;=====================================================
;;CONTANTES PANTALLAS
;;=====================================================
;colores base de la pantalla
color_base:					DB		COLNEGRO,COLNEGRO,COLNEGRO

;colores de pantalla cuando se tira bomba
color_bomba1:				DB		COLROJO,COLROJO,COLROJO
color_bomba2:				DB		COLROJOOSC,COLROJOOSC,COLROJOOSC


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
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_0
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_1
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_2
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_3
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_4
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_5
	DEC		 A
	LD		 A, (prota_nivel)
	JP		 Z, .carga_nivel_6
	DEC		 A
	
.carga_nivel_0:
	LD		HL, tiles_patrones_nivel0
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel0
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel0
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel0
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles

.carga_nivel_1:
	LD		HL, tiles_patrones_nivel1
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel1
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel1
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel1
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles
	
.carga_nivel_2:
	LD		HL, tiles_patrones_nivel2
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel2
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel2
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel2
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles
	
.carga_nivel_3:
	LD		HL, tiles_patrones_nivel3
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel3
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel3
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel3
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles
	
.carga_nivel_4:
	LD		HL, tiles_patrones_nivel4
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel4
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel4
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel4
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles
	
.carga_nivel_5:
	LD		HL, tiles_patrones_nivel5
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel5
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel5
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel5
	LD		(tiles_mapa), HL
	JP		.fin_carga_niveles
	
.carga_nivel_6:
	LD		HL, tiles_patrones_nivel6
	LD		(tiles_patrones), HL
	LD		HL, tiles_color_nivel6
	LD		(tiles_colores), HL
	LD		HL, tiles_patrones_nivel6
	LD		(tiles_patrones), HL
	LD		HL, tiles_mapa_nivel6
	LD		(tiles_mapa), HL
;	JP		.fin_carga niveles			;no necesario
.fin_carga_niveles:

	;cargando banco 1
	;cargamos los patrones
	LD		HL, (tiles_patrones)
	LD		DE, CHRTBL
	CALL	depack_VRAM
	;cargamos los colores de los patrones
	LD		HL, (tiles_colores)
	LD		DE, CLRTBL
	CALL	depack_VRAM
	
	;cargando banco 2
	;cargamos los patrones
	LD		HL, (tiles_patrones)
	LD		DE, CHRTBL + #0800
	CALL	depack_VRAM	
	;cargamos los colores de los patrones
	LD		HL, (tiles_colores)
	LD		DE, CLRTBL + #0800
	CALL	depack_VRAM
	
	;cargamos mapa de pantalla banco 1 y 2
	LD		HL, (tiles_mapa)
	LD		DE, TILMAP
	JP		depack_VRAM
fin_pinta_parte_superior_pantalla:
;tiles_patrones:		DW	0
;tiles_colores:			DW	0
;tiles_mapa:			DW	0


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
		LD			HL,tiles_patrones_marcador
		LD			DE,CHRTBL + #1000
		CALL		depack_VRAM	
		;cargamos mapa de pantalla
		LD			HL,tiles_mapa_marcador
		LD			DE,TILMAP + #0200
		CALL		depack_VRAM
		;cargamos los colores de los patrones
		LD			HL,tiles_color_marcador
		LD			DE,CLRTBL + #1000
		CALL		depack_VRAM
		;cargamos los textos de la parte inferior en el icioma que correspondan
		LD			HL,texto_vidas		;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 5				;nº posiciones a pintar
		LD			DE, TILMAP + 577	;destino en vram
		CALL		pintatextos
		
		
	;************************************************************************************************************
	
fin_pinta_parte_inferior_pantalla:
		RET


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
	LD		 A, (prota_nivel)	 ;seleccionando la pos del banco de tiles a poner en el mapa
	ADD		'0'	
	LD		 D, A
	
	JP		pinta_tile_suelto
fin_pinta_nivel:


;;=====================================================
;;PINTA_TILE_SUELTO
;;=====================================================	
; función: 	pinta al tile que digamos en D, en la posición BC
; entrada: 	BC (posición a pintar en el mapa),D (qué se va a pintar el esa posición)
; salida: 	-
; toca:		A
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


;;=====================================================
;;POSICIONA_EN_MAPA
;;=====================================================	
; función: 	en el mapa de marcadores de la derecha/abajo marca un cuadro en gris o con un muñeco
;			según el valor de prota.posición pinta entrá un muñeco y por donde vaya pasando el prota
;			quedará en gris
; entrada: 	elemento_pintar_mapa  A , prota_pos_mapy, prota_pos_mapx
; salida: 	-
; toca:		todos
posiciona_en_mapa:
	;#0238 es la posición en mapa de tiles de la esquina superior izquierda del mapa (569 en decimal)
	LD		HL, TILMAP + POSMAPA;pos inicial
	
	;ahora se le calcula la fila a pintar ya que va de abajo a arriba y no como en el mapa + columna
.sumar_fila:
	LD		 A, (prota_pos_mapy)
	CP		 1
	JR		 Z, .fila_1
	LD		 A, (prota_pos_mapy)
	CP		 2
	JR		 Z, .fila_2
	LD		 A, (prota_pos_mapy)
	CP		 3
	JR		 Z, .fila_3
	LD		 A, (prota_pos_mapy)
	CP		 4
	JR		 Z, .fila_4
	LD		 A, (prota_pos_mapy)
	CP		 5
	JR		 Z, .fila_5
	LD		 A, (prota_pos_mapy)
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
	;~ LD		D,2								;nº de filas ahora byteaux1
	;~ LD		E,3								;nº de columnas ahora byteaux2
	;~ CALL	pinta_array

pinta_array:
	EX		AF, AF'
	
	LD		 A, (byteaux1)
	LD		 D, A
	LD		 A, (byteaux2)
	LD		 E, A
	
	LD		HL, (wordaux1)
	LD		 B, H							;coloca posición tilemap BC
	LD		 C, L
	
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
	CALL	NZ,.pa_pinta_fila
	
	EX		AF, AF'
fin_pinta_array:
	RET
;;variables asocidas a la función pinta_array
;wordaux1:		DW	0	;almacena la posición en el tilemap 0 al 675
;wordaux2:		DW	0	;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 2 primeros bancos)
;byteaux1:		DB	0	;nº filas Registro D
;byteaux2:		DB	0	;nº columnas Registro E


;;=====================================================
;;INICIALIZA_ANTORCHAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de las antorchas
; entrada: 	antorchas, array_antorcha
; salida: 	
; toca:		HL, IX
inicializa_antorchas:
		LD			IX, antorchas
		LD			(IX), INACTIVA
		LD			HL, array_antorcha
		LD			(IX + 1), H
		LD			(IX + 2), L
		LD			(IX + 3), POSANTOR1
		LD			(IX + 4), POSANTOR2
		LD			(IX + 5), 0
		LD			(IX + 6), RESETLLAMA
fin_inicializa_antorchas:
		RET


;;=====================================================
;;PINTATEXTOS
;;=====================================================	
; función: 	pinta el texto pasado por un array siempre que los tiles están en cada caracter ascii
;			otra condición es que los tiles del texto estén en el banco donde se vayan a dibujar
; entrada: 	A, posición donde pintar, HL, puntero al array a pintar
			;~ BC - Block length
			;~ DE - Start address of VRAM
			;~ HL - Start address of memory
			;~ LD			HL,texto_vidas		;guardo puntero al array a pintar (como psar por referencia)
			;~ LD			BC, 5				;nº posiciones a pintar
			;~ LD			DE, TILMAP + 577	;destino en vram
; salida: 	
; toca:		
pintatextos:
		JP			LDIRVM
fin_pintatextos:


;;=====================================================
;;INICIALIZA_esqueletos
;;=====================================================	
; función: 	inicializa las variables de estructuras de los esqueletos
; entrada: 	esqueletos, array_esqueletos
; salida: 	
; toca:		HL, IX
inicializa_esqueletos:
	LD		IX, esqueletos
	LD		(IX), INACTIVA
	LD		HL, array_esqueleto
	LD		(IX + 1), H
	LD		(IX + 2), L
	LD		(IX + 3), POSESQUEL1
	LD		(IX + 4), POSESQUEL2
	LD		(IX + 5), 0
	LD		(IX + 6), RESETESQUEL
fin_inicializa_esqueletos:
	RET
	

;;=====================================================
;;PINTA_ANTORCHAS
;;=====================================================	
; función: 	pinta las antorchas con valores base
; entrada: 	antorchas, array_antorcha
; salida: 	
; toca:		HL
pinta_extra_fondo:
	LD		IX, antorchas
.examina_sihay_antorchas
	;hay que pintarlas?
	LD		 A, (habitacion_extras)
	BIT		 0, A
	JP		NZ, .hayantorchas			;si el bit 0 de extras es 0 no se pintan antorchas
	LD		(IX), INACTIVA
	JP		.examina_sihay_esqueletos
	
.hayantorchas:
	LD		(IX), ACTIVA
	;pinta antorcha izquierdda
	LD		 H, (IX + 1)
	LD		 L, (IX + 2)
	LD		(wordaux2), HL				;guarda pos array en wordaux2
	
	LD		HL, TILMAP + POSANTOR1		;calcula posición en tilemap
	LD		(wordaux1), HL				;guarda valor pos tilemap en wordaux1

	LD		 A, 3						;nº de filas	
	LD		(byteaux1), A
	LD		 A, 1						;nº de columnas
	LD		(byteaux2), A				
	
	CALL	pinta_array
	
	;pinta antorcha derecha
	LD		HL, TILMAP + POSANTOR2		;calcula posición en tilemap
	LD		(wordaux1), HL				;guarda valor pos tilemap en wordaux1
	
	JP		pinta_array 				;no ecesita CALL ya que la subrutina termina aquí
	
.examina_sihay_esqueletos
	LD		IX, esqueletos
	;hay que pintarlos?
	LD		 A, (habitacion_actual)
	BIT		 5, A
	JP		NZ, .hayesqueletos			;si el bit 0 de extras es 0 no se pintan antorchas
	LD		(IX), INACTIVA
	RET									;no hay que pintarlo. no hay que continuar

.hayesqueletos
	LD		(IX), ACTIVA
	;pinta antorcha izquierdda
	LD		 H, (IX + 1)
	LD		 L, (IX + 2)
	LD		(wordaux2), HL				;guarda pos array en wordaux2
	
	LD		HL, TILMAP + POSESQUEL1		;calcula posición en tilemap
	LD		(wordaux1), HL				;guarda valor pos tilemap en wordaux1

	LD		 A, 4						;nº de filas	
	LD		(byteaux1), A
	LD		 A, 3						;nº de columnas
	LD		(byteaux2), A				
	
	CALL	pinta_array
	
	;pinta antorcha derecha
	LD		HL, TILMAP + POSESQUEL2		;calcula posición en tilemap
	LD		(wordaux1), HL				;guarda valor pos tilemap en wordaux1
	
	JP		pinta_array 				;no ecesita CALL ya que la subrutina termina aquí
fin_pinta_extra_fondo:


;;=====================================================
;;ACTUALIZA_ELEMENTOS_FONDO
;;=====================================================	
; función: 	de los elementos que pueda haber en el fondo de la pared (pantalla) actualiza si procede
;			actualmente: antorchas y a futuro esqueletos
; entrada: 	
; salida: 	
; toca:		A
actualiza_elementos_fondo:
.examina_antorchas:
	LD		IX, antorchas
	LD		 A, (IX)
	OR		 A
	JP 	 	 Z, .examina_esqueletos
	
	CALL	flip_llamas_antorchas
.examina_esqueletos:
	LD		IX, esqueletos
	LD		 A, (IX)
	OR		 A
	RET	 	 Z
	
	JP		flip_calavera_esqueletos
fin_actualiza_elementos_fondo:


;;=====================================================
;;FLIP_LLAMAS_ANTORCHAS
;;=====================================================	
; función: 	modifica las llamas de las antorchas con los tipos que hay
; entrada: 	
; salida: 	
; toca:		
flip_llamas_antorchas:
		LD		IX, antorchas
		;tiene que cambiar de llama?
		LD		 A, (IX + 6)
		DEC		 A
		LD		 (IX + 6), A
		;no
		RET		NZ
		;si
		PUSH	BC
		PUSH	DE
	
		LD		(IX + 6), RESETLLAMA	
	
		;qué llama toca?
		LD		 A, (IX + 5)
		OR		 A
		JP		 Z, .llama_par
.llama_impar
		;cambio a llama par
		XOR		 A
		LD		(IX + 5), A
		;pinto llamas
		LD		BC, TILMAP
		LD		 A, POSANTOR1
		CALL	suma_A_BC
		LD		 D, MAPLLAMA1
		CALL	pinta_tile_suelto
		
		LD		BC, TILMAP
		LD		 A, POSANTOR2
		CALL	suma_A_BC
		LD		 D, MAPLLAMA2
		CALL	pinta_tile_suelto	
		JP		fin_flip_llamas_antorchas
	
.llama_par
		;cambio a llama par
		LD		 A, 1
		LD		(IX + 5), A
		;pinto llamas
		LD		BC, TILMAP
		LD		 A, POSANTOR1
		CALL	suma_A_BC
		LD		 D, MAPLLAMA2
		CALL	pinta_tile_suelto
	
		LD		BC, TILMAP
		LD		 A, POSANTOR2
		CALL	suma_A_BC
		LD		 D, MAPLLAMA1
		CALL	pinta_tile_suelto

fin_flip_llamas_antorchas:
		;restauro los balores de los registros tocados antes
		POP		DE
		POP		BC
		POP		AF

		RET


;;=====================================================
;;FLIP_CALAVERA_ESQUELETOS
;;=====================================================	
; función: 	modifica las calaveras de los esqueletos
; entrada: 	
; salida: 	
; toca:		TODOS.... muy importante DE
flip_calavera_esqueletos:
		LD		IX, esqueletos
	
		;tiene que cambiar de calavera?
		LD		 A, (IX + ESTRUCTURA_ESQUELETO.cont_sig_escena)
		DEC		 A
		LD		 (IX + ESTRUCTURA_ESQUELETO.cont_sig_escena), A
		;no
		RET		NZ
		;si
		LD		(IX + ESTRUCTURA_ESQUELETO.cont_sig_escena), RESETESQUEL		;resetea contador de nueve escena
	
		CALL	actualiza_escena_calavera

		;pinto calaveras
		LD		BC, TILMAP
		LD		 A, POSCALAVE1
		CALL	suma_A_BC
		PUSH	DE
		LD		 D, (HL)
		CALL	pinta_tile_suelto
	
		LD		BC, TILMAP
		LD		 A, POSCALAVE2
		CALL	suma_A_BC
		POP		HL
		LD		 D, (HL)
		JP		pinta_tile_suelto	
fin_flip_calavera_esqueletos:
;var_aux_calavera	DB	0;


;;=====================================================
;;ACTUALIZA_ESCENA_CALAVERA
;;=====================================================	
; función: 	modifica las siguiente calavera a mostrar
; entrada: 	
; salida: 	DE (iportante porque se usa fuera) y ESTRUCTURA_ESQUELETO.escena
; toca:		TODOS.... muy importante DE
actualiza_escena_calavera:
	;consulta_escena
	LD		 A, (IX + ESTRUCTURA_ESQUELETO.escena)
	LD		(var_aux_calavera), A
	OR		 A
	JP		 NZ, .decrementa_escenas
	LD		 A, RESETESCENAESQUEL
.decrementa_escenas
	DEC		 A
.fin_consulta_escena
	LD		 (IX + ESTRUCTURA_ESQUELETO.escena), A
	
	LD		HL, lista_escenas_calavera
	LD		 A, (var_aux_calavera)
	CALL	suma_A_HL
	
	LD		 D, H
	LD		 E, L
fin_actualiza_escena_calavera:
	RET

