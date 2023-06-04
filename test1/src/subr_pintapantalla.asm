;;=====================================================
;;CONTANTES PANTALLAS
;;=====================================================
;colores base de la pantalla
color_base:					DB		COLNEGRO,COLNEGRO,COLNEGRO

;colores de pantalla cuando se tira bomba
color_bomba1:				DB		COLROJO,COLROJO,COLROJO
color_bomba2:				DB		COLROJOOSC,COLROJOOSC,COLROJOOSC

;fondo para borrar prota en pantalla final
fondo_patalla_final:		DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							DB	1,1,1,1,1,1
							
fondo_pantalla_dracula:		DB 	  0,  0,166,  0,167,  0,  0,  0,  0,  0,  0,  0,  0,166,  0,167,  0,  0
							DB 	197,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,198
							DB 	199,  0,  0,165,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,165,  0,  0,199
							DB 	199,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,199
							DB 	199,  0, 28, 27, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 27, 28,  0,199
							DB 	199,  0,  0, 27, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 27,  0,  0,199
							DB 	199,  0,  0, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 27,  0,  0,199
							DB 	200,  0,  0,  0, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,  0,  0,  0,200
							DB 	  0,  0,  0,  0,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  0,  0,  0,  0


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
;fin_color_pantalla:


;;=====================================================
;;PREPARAPANTALLA
;;=====================================================	
; función: elimina clic cuando se pulsa tecla, cls, screen 2,2
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
sub_preparapantalla:
;elimina_clic
	XOR		 A
	LD		(CLIKSW),A

;cls_pantalla
	XOR		 A
	CALL 	CLS

	;toca A y direcciones #F3E9/#F3EA/#F3EB, poner en HL array con 3 valores
	LD		HL, color_base
	CALL	color_pantalla
	
	;cambiamos a SCREEN 2,2 del BASIC
;screen2
	LD		 A, 2
	CALL	CHGMOD			;selecciona screen 2

;sprites_16_16
	LD		 A, (RG1SAV)
	OR		00000010b		;fuerza sprites de 16x16
	LD		(RG1SAV), A		;no lo guardamos en la copia de variables del sistema
	LD		 B, A
	LD		 C, 1
	JP		WRTVDP			;opción alternativa de escribir las tres lineas siguientes
;fin_sub_preparapantalla:
	

;;=====================================================
;;MUESTRA_INSTRUCCIONES
;;=====================================================	
; función:  explica al jugador que para atavesar las puertas primero debe matar todos los 
;			enemigos que haya en pantalla (no me gusta pero por si hay jugadores que
;			no lo tienen claro)
muestra_instrucciones:
			;paro la musica que se estuviera reproduciendo
			XOR			 A
			CALL		play_musica
			
			CALL		DISSCR
			
			;cargando banco 0
			;cargamos los patrones
			LD			HL, tiles_patrones_nivel0
			LD			DE, CHRTBL
			CALL		depack_VRAM
			;cargamos los colores de los patrones
			LD			HL, tiles_color_nivel0
			LD			DE, CLRTBL
			CALL		depack_VRAM
		
			;cargando banco 1
			;cargamos los patrones
			LD			HL, tiles_patrones_nivel0
			LD			DE, CHRTBL + #0800
			CALL		depack_VRAM	
			;cargamos los colores de los patrones
			LD			HL, tiles_color_nivel0
			LD			DE, CLRTBL + #0800
			CALL		depack_VRAM

		
			CALL		limpia_pantalla
			
			LD			HL, texto_instruc1;guardo puntero al array a pintar (como psar por referencia)
			LD			BC, 32				;nº posiciones a pintar
			LD			DE, TILMAP + 256	;destino en vram
			CALL		LDIRVM
			
			LD			HL, texto_instruc2;guardo puntero al array a pintar (como psar por referencia)
			LD			BC, 32				;nº posiciones a pintar
			LD			DE, TILMAP + 320	;destino en vram
			CALL		LDIRVM
		
			LD			HL, texto_instruc3;guardo puntero al array a pintar (como psar por referencia)
			LD			BC, 32				;nº posiciones a pintar
			LD			DE, TILMAP + 384	;destino en vram
			CALL		LDIRVM
			
			CALL		ENASCR
			
[2]			CALL		espera_estandar

			RET
;fin_muestra_instrucciones:


;;=====================================================
;;PINTA_PARTE_SUPERIOR_PANTALLA
;;=====================================================	
; función: pinta el escenario, los dos bancos superiores
pinta_parte_superior_pantalla:		
		;~ ;si están todos lod enemigos muertos no se redibuja pantalla para que no toque el sonido
		;~ LD			 A, (habitacion_terminada)
		;~ OR			 A
		;~ JR			NZ, .finsi
		
		;si es fila 0 o 6 carga todos los tiles, si no sólo actualiza el mapa
		;y se aprovecha para poner el nombre del enemigo
.siposyes0:
		LD			 A, (prota_pos_mapy)
		OR			 A
		JR			NZ, .siposyes6

		CALL		carga_tiles_bancos	;cargando los tiles en los bancos 0 y 1 que son iguales y se sacan de la misma variable
		;inicia música según corresponda
		CALL		toca_musica_segun_corresponda

		JR			.finsi

.siposyes6:
		LD			 A, (prota_pos_mapy)
		CP			 6
		JP			NZ, .finsi

		CALL		carga_tiles_bancos	;cargando los tiles en los bancos 0 y 1 que son iguales y se sacan de la misma variable
		;inicia música según corresponda
		CALL		toca_musica_segun_corresponda
		
		
.finsi:
			;aquí se actualizan las particularidades de cada nivel
			CALL		actualiza_tiles_nivel
			;pinta puerta si es necesario
			CALL		inicializa_puertas
			CALL		pinta_puertas
			;pinta nombre enemigo si corresponde
			CALL		pinta_nombre_enemigo
			;pinta extras en el fondo si tiene
			CALL		pinta_extra_fondo
			;pinta ayudas en el fondo si tiene
			JP			pinta_ayudas_habitacion
;fin_pinta_parte_superior_pantalla:
		

;;=====================================================
;;CARGA_TILES_BANCOS
;;=====================================================	
; función: carga en memoria los bancos 0 y 1
carga_tiles_bancos:
		;deshabilito pantalla para que no se vea la carga de tiles
		CALL		DISSCR
		
		;cargando banco 0
		;cargamos los patrones
		LD			HL, tiles_patrones_nivel0
		LD			DE, CHRTBL
		CALL		depack_VRAM
		;cargamos los colores de los patrones
		LD			HL, tiles_color_nivel0
		LD			DE, CLRTBL
		CALL		depack_VRAM
	
		;cargando banco 1
		;cargamos los patrones
		LD			HL, tiles_patrones_nivel0
		LD			DE, CHRTBL + #0800
		CALL		depack_VRAM	
		;cargamos los colores de los patrones
		LD			HL, tiles_color_nivel0
		LD			DE, CLRTBL + #0800
		CALL		depack_VRAM
	
		;cargamos mapa de pantalla banco 0 y 1
		LD			HL, tiles_mapa_nivel0;(tiles_mapa)
		LD			DE, TILMAP
		CALL		depack_VRAM 
		
		;habilito pantalla para mostrar resultado tras la carga de tiles
		CALL		ENASCR
;fin_carga_tiles_bancos:
		RET


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
		CALL 		pinta_texto_vida
		CALL 		pinta_texto_energia
		CALL		pinta_texto_reliquias
		JP 			pinta_texto_nivel
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
; función: 	escribe un valor en VRAM y también se usa
;			pinta al tile que digamos en D, en la posición BC
; entrada: 	BC (posición a pintar en el mapa),D (qué se va a pintar el esa posición)
; salida: 	-
; toca:		A
pinta_tile_suelto:
	IN		 	 A, (REGEST)	;leer registro de estado (recomendado)
	LD		 	 A, C			;primero byte bajo	
	OUT			(REGEST),A
	LD		 	 A, B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR			1000000b		;+64
	OUT			(REGEST),A
	
	LD			 A, D			;nº de patrón de tile a pintar
	OUT			(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
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
borra_mapa:
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
	JP		LDIRVM
fin_borra_mapa:


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
	JR		.sumar_columna
.fila_1:
	LD		DE, 160
	ADD		HL, DE
	JR		.sumar_columna
.fila_2:
	LD		DE, 128
	ADD		HL, DE
	JR		.sumar_columna
.fila_3:
	LD		DE, 96
	ADD		HL, DE
	JR		.sumar_columna
.fila_4:
	LD		DE, 64
	ADD		HL, DE
	JR		.sumar_columna
.fila_5:
	LD		DE, 32
	ADD		HL, DE
	JR		.sumar_columna
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
	JR		 Z, .pinta_pos_mapa_vacio
	LD		 D, TILEPROTAM
	JR		.fin_pinta_pos_mapa
.pinta_pos_mapa_vacio:
	LD		 D, TILEGRISM	

.fin_pinta_pos_mapa:
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
		LD			HL, color_bomba1   ;color_bomba2
		CALL		color_pantalla
	
		LD			BC, 60000
		CALL		retardo16bits
	
		LD			HL, color_base
		JP			color_pantalla
fin_efecto_imagen_tira_reliquia:


;;=====================================================
;;PINTA_ARRAY
;;=====================================================	
;;funcion:  (pinta el mismo tile) se le pasa un array con posiciones de tiles y coordenadas x e y y los pinta en screen 2
;;entrada:	wordaux1 (pos inicio sc2 donde pintar) y wordaux2 (puntero al array a pintar), BC (posición en tilemap) , D filas y E columnas
;;salida:	-
;;importante: necesita de una variable wordaux1 tipo WD (wordaux1: 	DW	0)
;; ejemplo llamada:
			;~ LD			HL,fondo_patalla_final	;guardo puntero al array a pintar (como psar por referencia)
			;~ LD			(wordaux2),HL			;en la variable wordaux2

			;~ LD			HL,TILMAP + 256 + 4		;calcula posición en tilemap
			;~ LD			(wordaux1),HL			;guarda valor pos tilemap en wordaux1
			;~ LD			B,H						;coloca posición tilemap BC
			;~ LD			C,L

			;~ LD			 A, 8					;nº de filas
			;~ LD			(byteaux1), A			;nº de filas
			;~ LD			 A, 6					;nº de columnas
			;~ LD			(byteaux2), A			;nº de columnas
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
;;PINTA_EXTRA_FONDO (antorchas / esqueletos)
;;=====================================================	
; función: 	pinta las antorchas con valores base
; entrada: 	antorchas, array_antorcha
; salida: 	
; toca:		HL
pinta_extra_fondo:
			XOR			 A
			LD			(hay_antorchas), A
			LD			(hay_esqueletos), A

;examina_sihay_antorchas:
			LD			 A, (habitacion_extras)
			BIT			 0, A
			JR			 Z, .examina_sihay_esqueletos	;si el bit 0 de extras es 0 no se pintan antorchas
			LD			 A, 1
			LD			(hay_antorchas), A
			CALL		pinta_antorchas
			RET
		
.examina_sihay_esqueletos:
			LD			 A, (habitacion_actual)
			AND			00100000b 	;el bit 5 del byte de posición dice si hay esqueletos
			JR			 Z,	.examina_sies_habitaciondracula	;si el bit 0 de extras es 0 no se pintan los esqueletos
			LD			 A, 1
			LD			(hay_esqueletos), A
			CALL		pinta_esqueletos
			RET
		
.examina_sies_habitaciondracula:
			;es nivel 6?
			LD			 A, (prota_nivel)
			CP			 6
			RET			NZ
			;es habitación drácula?
			LD			 A, (prota_nivel)
			CP			 6
			RET			NZ
		
		
			LD			HL,fondo_pantalla_dracula	;guardo puntero al array a pintar (como psar por referencia)
			LD			(wordaux2),HL			;en la variable wordaux2

			LD			HL,TILMAP + 64 + 7		;calcula posición en tilemap
			LD			(wordaux1),HL			;guarda valor pos tilemap en wordaux1
			LD			B,H						;coloca posición tilemap BC
			LD			C,L

			LD			 A, 9					;nº de filas
			LD			(byteaux1), A			;nº de filas
			LD			 A, 18					;nº de columnas
			LD			(byteaux2), A			;nº de columnas
			
			CALL		pinta_array
			RET
			
			
			
	;ñññññññññññññññññññññññññññññññññññññññññññ
			
			
			
			
			
;fin_pinta_extra_fondo


;;=====================================================
;;ACTUALIZA_ELEMENTOS_FONDO
;;=====================================================	
; función: 	varia los tiles de llama o calavera según haya de fondo antorchas o esqueletos
; entrada:	hay_antorchas / hay_esqueletos
actualiza_elementos_fondo:
.examina_antorchas:
		LD			 A, (hay_antorchas)
		OR			 A
		JP			 Z, .examina_esqueletos
		CALL		flip_llamas_antorchas
		RET
.examina_esqueletos:
		LD			 A, (hay_esqueletos)
		OR			 A
		RET			 Z
		JP			flip_calavera_esqueletos
fin_actualiza_elementos_fondo:


;;=====================================================
;;FLIP_LLAMAS_ANTORCHAS
;;=====================================================	
; función: 	modifica las llamas de las antorchas con los tipos que hay
; entrada: 	
; salida: 	
; toca:		
flip_llamas_antorchas:
		;pos llamas: 136 / 151
		LD			 A, (heartbeat_general)
		AND			00000100b
		JP			NZ, .pos2
.pos1:
		;tiles 196 / 197
		LD			BC, TILMAP + 136
		LD			 D, 196
		CALL		pinta_tile_suelto

		LD			BC, TILMAP + 151
		LD			 D, 197
		CALL		pinta_tile_suelto
		RET
.pos2:
		;tiles 197 / 196
		LD			BC, TILMAP + 136
		LD			 D, 197
		CALL		pinta_tile_suelto

		LD			BC, TILMAP + 151
		LD			 D, 196
		JP			pinta_tile_suelto
fin_flip_llamas_antorchas:


;;=====================================================
;;PINTA_ANTORCHAS
;;=====================================================
; funcion: pinta las antorchas del fondo (luego sólo se mueve el fuecgo)
pinta_antorchas:
		;pinta antorcha izquierda
		LD			BC, TILMAP + (32 * 5) + 8
		LD			 D, (32 * 6) + 6
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 6) + 8
		LD			 D, (32 * 6) + 7
		CALL		pinta_tile_suelto

		;pinta antorcha derecha
		LD			BC, TILMAP + (32 * 5) + 23
		LD			 D, (32 * 6) + 6
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 6) + 23
		LD			 D, (32 * 6) + 7
		JP			pinta_tile_suelto
fin_pinta_antorchas:


;;=====================================================
;;PINTA_ESQUELETOS
;;=====================================================
; funcion: pinta los esqueletos del fondo (se mueve luego la cabeza)
pinta_esqueletos:
		;esqueleto izq.
		LD			BC, TILMAP + 137
		LD			 D, 194
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 138
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 139
		LD			 D, 195
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 169
		LD			 D, 160
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 170
		LD			 D, 164
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 171
		LD			 D, 161
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 201
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 202
		LD			 D, 163
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 203
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 233
		LD			 D, 192
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 234
		LD			 D, 162
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 235
		LD			 D, 193
		CALL		pinta_tile_suelto

		;esqueleto der.
		LD			BC, TILMAP + 137 + 11
		LD			 D, 194
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 138 + 11
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 139 + 11
		LD			 D, 195
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 169 + 11
		LD			 D, 160
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 170 + 11
		LD			 D, 164
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 171 + 11
		LD			 D, 161
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 201 + 11
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 202 + 11
		LD			 D, 163
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 203 + 11
		LD			 D, 0
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 233 + 11
		LD			 D, 192
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 234 + 11
		LD			 D, 162
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + 235 + 11
		LD			 D, 193
		JP			pinta_tile_suelto		
fin_pinta_esqueletos:


;;=====================================================
;;FLIP_CALAVERA_ESQUELETOS
;;=====================================================	
; función: 	modifica las calaveras de los esqueletos
; entrada: 	
; salida: 	
flip_calavera_esqueletos:
		LD			 A, (heartbeat_cienpies)	;si pongo el hearbeat_cienpies, porque no se usa si hay calaveras 
		
		AND			00100000b
		JP			NZ, .pos2
.pos1:
		;tiles 196 / 197
		LD			BC, TILMAP + 170
		LD			 D, 165
		CALL		pinta_tile_suelto

		LD			BC, TILMAP + 170 + 11
		LD			 D, 166
		CALL		pinta_tile_suelto
		RET
.pos2:
		;tiles 197 / 196
		LD			BC, TILMAP + 170
		LD			 D, 166
		CALL		pinta_tile_suelto

		LD			BC, TILMAP + 170 + 11
		LD			 D, 165
		CALL		pinta_tile_suelto
		RET
;fin_flip_calavera_esqueletos


;;=====================================================
;;CAMBIO_NIVEL_ENTREFASES
;;=====================================================	
; función: 	pone un texto cada vex que se sube o baja de nivel en el castillo
cambio_nivel_entrefases:
			;paro la musica que se estuviera reproduciendo
			XOR			 A
			CALL		play_musica
			
			CALL		DISSCR
			
			;si no se ha matado aun a drácula cuando se cambia de fase se restablece energía
			LD			 A, (dracula_muerto)
			OR			 A
			JR			NZ, .draculaestamuerto
			;si drácula no estña muerto cuando cambia de fase (cambio_nivel_entrefases)
			; se lrecupero la energia inicial
			LD			 A, PROTAENERGIA			
			LD			(prota_energia), A

.draculaestamuerto:			
			CALL		borra_mapa

			;Ocultamos todos los sprites
			CALL		oculta_todos_sprites
			
			;ocultamos posición superior en mapa
			LD			BC, TILMAP + (17 * 32) + 27
			LD		 	D, 0
			CALL		pinta_tile_suelto	
				
			;ocultamos posición inferior en mapa
			LD			BC, TILMAP + (23 * 32) + 27
			LD		 	D, 0
			CALL		pinta_tile_suelto	

			;ocultamos numero de nivel
			LD			BC, TILMAP + (21 * 32) + 20
			LD		 	D, 0
			CALL		pinta_tile_suelto	

			;cargamos mapa de pantalla banco 1 y 2
			LD			HL, tiles_mapa_entrefases
			LD			DE, TILMAP
			CALL		depack_VRAM
			
			CALL		pinta_texto_entrefases
			
			CALL		DISSCR
			
			JP			espera_estandar
;fin_cabio_nivel_entrefases:


;;=====================================================
;;OCULTA_TODOS_SPRITES
;;=====================================================	
; función: 	oculta el sprite 0 con y=208 para que oculte el resto de sprites
; entrada: 	
; salida: 	-
; toca:		TODOS
oculta_todos_sprites:	
;~ 1B00		Sprite attributes
;~ BORRASPRITESIG valor 208 que coulta todos los sprites de un plano haci a los superiores
			LD			BC, #1B00
			LD			 D, BORRASPRITESIG
			JP			pinta_tile_suelto
;fin_oculta_todos_sprites:


;;=====================================================
;;MUESTRA_PANTALLA_INICIAL
;;=====================================================	
; función: 	muestra la pantalla de inicio del juego y queda ahí hasta que se pulse disparo (joystick o espacio)
; entrada: 	
; salida: 	
; toca:		TODOS.... muy importante DE
muestra_pantalla_inicial:
		;apago la música que hubiera
		XOR			 A	; sin musica = 0 
		CALL		play_musica
		
		CALL		DISSCR

		;cargamos mapa de pantalla completa
		LD			HL, tiles_mapa_inicio
		LD			DE, TILMAP
		CALL		depack_VRAM
		
		;cargamos tiles y colores del banco 1
		;cargamos los patrones
		LD			HL, tiles_patrones_inicio
		LD			DE, CHRTBL + #0800
		CALL		depack_VRAM
		;cargamos los colores
		LD			HL, tiles_color_inicio
		LD			DE, CLRTBL + #0800
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
	
		CALL		pinta_textos_inicio_disparo
		CALL		pinta_textos_inicio_autoria
		
		CALL		ENASCR 
		
.mientras_nopulsado:
		;compruebo espacio
		XOR			 A
		CALL		#00D8
		LD			 B, A
		
		PUSH		BC
		;compruebo botón 1 joystick
		LD			 A, 1
		CALL		#00D8
		POP 		BC
		
		;veo si se ha pulsado espacio o botón 1 de joystick
		OR			 B		;uno el resultado del espacio + el resultado del botón de disparo
		
		JP			 Z, .mientras_nopulsado	;si A=0 no se pulsó ni disparo ni botón
		
		;ejecuto sonido de comienzo de juego
		LD			 A, SONIDOINICIO	;4
		LD			 C, 1
		CALL		ayFX_INIT
		
		;parpadeo del texto
		LD			 B,7
.parpadeo:		
		PUSH		BC

		LD 			BC, 9000
		CALL		retardo16bits
		
		CALL		pinta_textos_inicio_disparo_blanco
		
		LD 			BC, 9000
		CALL		retardo16bits
		
		CALL		pinta_textos_inicio_disparo
		
		POP			BC
		DJNZ 		.parpadeo
		
		;muestra instrucciones
		JP			muestra_instrucciones
;fin_muestra_pantalla_inicial:


;;=====================================================
;;LIMPIA_PANTALLA_SUPERIOR
;;=====================================================	
; función: limpia toda la pantlla poniendo el tile vacio en todas las posiciones (el tile vacio está definido en los 3 bancos)
limpia_pantalla_superior:
		;limpia todo y evita que se vea cuando se cargan los nuevos tiles por pantalla
		XOR		 	 A
		LD			HL, TILMAP
		LD			BC, 512
		JP			FILVRM
;fin_limpia_pantalla_superior:


;;=====================================================
;;LIMPIA_PANTALLA_INFERIOR
;;=====================================================	
; función: limpia toda la pantlla poniendo el tile vacio en todas las posiciones (el tile vacio está definido en los 3 bancos)
limpia_pantalla_inferior:
		;limpia todo y evita que se vea cuando se cargan los nuevos tiles por pantalla
		XOR		 	 A
		LD			HL, TILMAP + 512
		LD			BC, 256
		JP			FILVRM
;fin_limpia_pantalla_inferior:


;;=====================================================
;;LIMPIA_PANTALLA_COMPLETA
;;=====================================================	
; función: limpia toda la pantlla poniendo el tile vacio en todas las posiciones (el tile vacio está definido en los 3 bancos)
limpia_pantalla_completa:
		;oculta los sprites que haya en pantalla
		CALL		oculta_todos_sprites
		;limpia los tiles
		JP			limpia_pantalla
;fin_limpia_pantalla_completa:


;;=====================================================
;;LIMPIA_PANTALLA
;;=====================================================	
; función: limpia tiles en bancos
limpia_pantalla:
			;cargamos tiles y colores del banco 0
			;cargamos los patrones
			LD			HL, tiles_patrones_vacio
			LD			DE, CHRTBL
			CALL		depack_VRAM
			;cargamos los colores
			LD			HL, tiles_color_vacio
			LD			DE, CLRTBL
			CALL		depack_VRAM
			
			;limpia todo y evita que se vea cuando se cargan los nuevos tiles por pantalla
			XOR		 	 A
			LD			HL, TILMAP
			LD			BC, 768
			JP			FILVRM
;fin_limpia_pantalla:


;;=====================================================
;;OCULTA_TILE_ENERGIA_MINIMA
;;=====================================================	
; función: limpia tile de energía mínima
oculta_tile_energia_minima:
		LD			 A, TILENEGRO
		LD			HL, TILMAP + TILEENERG1
		JP			WRTVRM
;fin_oculta_tile_energia_minima:
		

;;=====================================================
;;OCULTA_TILE_VIDA0
;;=====================================================	
; función: limpia tile de de vida 0
oculta_tile_vida0:
		LD			 A, TILENEGRO
		LD			HL, TILMAP + TILEVIDA1
		JP			WRTVRM
;fin_oculta_tile_vida0:


;;=====================================================
;;UNA_VIDA_MENOS
;;=====================================================
; funcion: muestra mensaje cuando te matan una vida
una_vida_menos;
			;paro la musica que se estuviera reproduciendo
			XOR			 A
			CALL		play_musica
			
			CALL		DISSCR

			LD			 A, (prota_vidas)
			OR			 A
			JP			NZ, quedan_vidas
no_quedan_vidas:
			;gameover normal (tipo 1)
			XOR			 A
			LD			(tipo_gameover), A
			JP			game_over

quedan_vidas:
			;vacia vida (el nivel mínimo lo pone en negro)
			CALL		oculta_tile_energia_minima
		
			;oculta los sprites que haya en pantalla
			CALL		oculta_todos_sprites

			;limpia superior pantalla
			CALL		limpia_pantalla_superior
		
			LD			HL, texto_vidamenos ;guardo puntero al array a pintar (como psar por referencia)
			LD			BC, 16				;nº posiciones a pintar
			LD			DE, TILMAP + 200	;destino en vram
			CALL		LDIRVM

			CALL		ENASCR

			CALL		espera_estandar
			
			;este es redundante pero se pone para cuando no te matan en un nivel que
			;no sea 0 o 6
			CALL		toca_musica_segun_corresponda
			
			JP			pinta_parte_superior_pantalla
;fin_una_vida_menos:


;;=====================================================
;;BORRA_ELEMENTOS_ANTERIORES
;;=====================================================	
; funcion: resetea los tiles (sgún mapa) de la parte superior. Los carga todos de nuevo
borra_elementos_anteriores:
			;cargamos mapa de pantalla banco 0 y 1
			LD			HL, tiles_mapa_nivel0;(tiles_mapa)
			LD			DE, TILMAP
			JP			depack_VRAM
;fin_borra_elementos_anteriores:


;;=====================================================
;;ACTUALIZA_TILES_NIVEL
;;=====================================================	
; funcion: actualiza los tiles de la parte superior según el nivel en el que estemos
actualiza_tiles_nivel:
		CALL		borra_elementos_anteriores

		LD			 A, (prota_nivel)
		OR			 A
.examina_si_nivel0:
		JP			NZ, .examina_si_nivel1
		LD			 A, 8 					
		CALL		nivelX_pinta_suelo
		
		LD			 A, 16 					
		CALL		nivelX_pinta_pared
		
		LD			 A, 96
		CALL		nivelX_pinta_marco
		
		LD			 A, 23 	
		CALL		nivelX_pinta_puerta

		CALL		nivel0_pinta_estrellas	;pinta estrellas (2 por linea)
		CALL		nivel0_pinta_luna	
		RET
.examina_si_nivel1:
		CP			 1
		JP			NZ, .examina_si_nivel2
		
		LD			 A, 9 
		CALL		nivelX_pinta_suelo
		
		LD			 A, 17					
		CALL		nivelX_pinta_pared
		
		LD			 A, 97
		CALL		nivelX_pinta_marco
		
		LD			 A, 24
		CALL		nivelX_pinta_puerta
		RET
.examina_si_nivel2:
		CP			 2
		JP			NZ, .examina_si_nivel3
		
		LD			 A, 10
		CALL		nivelX_pinta_suelo
		
		LD			 A, 18				
		CALL		nivelX_pinta_pared
		
		LD			 A, 98
		CALL		nivelX_pinta_marco
		
		LD			 A, 25
		CALL		nivelX_pinta_puerta
		RET
.examina_si_nivel3:
		CP			 3
		JP			NZ, .examina_si_nivel4
		
		LD			 A, 9;11
		CALL		nivelX_pinta_suelo
		
		LD			 A, 17;19				
		CALL		nivelX_pinta_pared
		
		LD			 A, 97;99
		CALL		nivelX_pinta_marco
		
		LD			 A, 24;26
		CALL		nivelX_pinta_puerta
		RET
.examina_si_nivel4:
		CP			 4
		JP			NZ, .examina_si_nivel5
		
		LD			 A, 12
		CALL		nivelX_pinta_suelo
		
		LD			 A, 20				
		CALL		nivelX_pinta_pared
		
		LD			 A, 100
		CALL		nivelX_pinta_marco
		
		LD			 A, 27
		CALL		nivelX_pinta_puerta
		RET
.examina_si_nivel5:
		CP			 5
		JP			NZ, .examina_si_nivel6
		
		LD			 A, 13
		CALL		nivelX_pinta_suelo
		
		LD			 A, 21				
		CALL		nivelX_pinta_pared
		
		LD			 A, 101
		CALL		nivelX_pinta_marco
		
		LD			 A, 28
		CALL		nivelX_pinta_puerta
		RET
.examina_si_nivel6:
		LD			 A, 14
		CALL		nivelX_pinta_suelo
		
		LD			 A, 22				
		CALL		nivelX_pinta_pared
		
		LD			 A, 102
		CALL		nivelX_pinta_marco
				
		LD			 A, 29
		JP			nivelX_pinta_puerta
;fin_actualiza_tiles_nivel:


;;=====================================================
;;NIVELX_PINTA_SUELO
;;=====================================================
; funcion:  pone el tile y el color que se le pase como parámetro en el suelo
; entrada:  A, byteaux1 con el nivel del suelo pero valores
;			nivel 0: DE 8
;			nivel 1: DE 9
;			nivel 2: DE 10
;			nivel 3: DE 11
;			nivel 4: DE 12
;			nivel 5: DE 13
;			nivel 6: DE 14
nivelX_pinta_suelo:
		LD			(byteaux1), A
		
[3]		RLA
		LD			 L, A
		LD			 H, 0
		CALL		poner_tile_variable_tile_auxiliar
		CALL		poner_tile_aux_en_suelo_patron

		LD			 A, (byteaux1)
[3]		RLA
		LD			HL, CLRTBLBANCO1
		CALL		suma_A_HL
		CALL		poner_tile_variable_tile_auxiliar
		JP			poner_tile_aux_en_suelo_color
;fin_nivelX_pinta_suelo:


;;=====================================================
;;NIVELX_PINTA_PARED
;;=====================================================
; funcion:  pone el tile y el color que se le pase como parámetro en el suelo
; entrada:  A
;			nivel 0: DE 8
;			nivel 1: DE 9
;			nivel 2: DE 10
;			nivel 3: DE 11
;			nivel 4: DE 12
;			nivel 5: DE 13
;			nivel 6: DE 14
nivelX_pinta_pared:
		LD			(byteaux1), A
		
[3]		RLA
		LD			 L, A
		LD			 H, 0
		CALL		poner_tile_variable_tile_auxiliar
		CALL		poner_tile_aux_en_paredes_patron

		LD			 A, (byteaux1)
[3]		RLA
		LD			HL, CLRTBLBANCO1
		CALL		suma_A_HL
		CALL		poner_tile_variable_tile_auxiliar
		JP			poner_tile_aux_en_paredes_color
;fin_nivelX_pinta_pared:


;;=====================================================
;;NIVELX_PINTA_MARCO
;;=====================================================
; funcion:  pone el tile en el marco que sea para no liar mucho tengo 
; entrada:  A
;			nivel 0: 96
;			nivel 1: 97
;			nivel 2: 98
;			nivel 3: 99
;			nivel 4: 100
;			nivel 5: 101
;			nivel 6: 102
nivelX_pinta_marco:
		LD			(byteaux1), A

		LD			 H, 0
		LD			 L, A
[3]		ADD			HL, HL
		CALL		poner_tile_variable_tile_auxiliar
		CALL		poner_tile_aux_en_marco_patron

		LD			 A, (byteaux1)
		LD			DE, CLRTBLBANCO1
		LD			 H, 0
		LD			 L, A
[3]		ADD			HL, HL
		ADD			HL, DE
		CALL		poner_tile_variable_tile_auxiliar
		JP			poner_tile_aux_en_marco_color
;fin_nivelX_pinta_marco:


;;=====================================================
;;NIVELX_PINTA_PUERTA
;;=====================================================
; funcion:  pone el tile en el marco que sea para no liar mucho tengo 
; entrada:  A
;			nivel 0: 23
;			nivel 1: 24
;			nivel 2: 25
;			nivel 3: 26
;			nivel 4: 27
;			nivel 5: 28
;			nivel 6: 29
nivelX_pinta_puerta:
		LD			(byteaux1), A
		
[3]		RLA
		LD			 L, A
		LD			 H, 0
		CALL		poner_tile_variable_tile_auxiliar
		CALL		poner_tile_aux_en_puerta_patron

		LD			 A, (byteaux1)
[3]		RLA
		LD			HL, CLRTBLBANCO1
		CALL		suma_A_HL
		CALL		poner_tile_variable_tile_auxiliar
		JP			poner_tile_aux_en_puerta_color
fin_nivelX_pinta_puerta:


poner_tile_variable_tile_auxiliar:
		;poniendo patron en memoria RAM
		LD			BC, 8
		LD			DE, tile_auxiliar
		JP			LDIRMV
;fin_poner_tile_suelo_variable_tile_auxiliar:

poner_tile_aux_en_suelo_patron:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CHRTBLBANCO1 + (8  * 4)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_suelo_patron:

poner_tile_aux_en_suelo_color:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CLRTBLBANCO1 + (8  * 4)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_suelo_color:

poner_tile_aux_en_paredes_patron:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CHRTBL + (8  * 3)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CHRTBLBANCO1 + (8  * 3)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_paredes_patron:

poner_tile_aux_en_paredes_color:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CLRTBL + (8  * 3)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CLRTBLBANCO1 + (8  * 3)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_paredes_color:

poner_tile_aux_en_marco_patron:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CHRTBL + (8  * 2)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CHRTBLBANCO1 + (8  * 2)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_marco_patron:

poner_tile_aux_en_marco_color:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CLRTBL + (8  * 2)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CLRTBLBANCO1 + (8  * 2)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_marco_color:

poner_tile_aux_en_puerta_patron:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CHRTBL + (8  * 1)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CHRTBLBANCO1 + (8  * 1)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_puerta_patron:

poner_tile_aux_en_puerta_color:
		;poniendo patron en memoria VRAM
		LD			BC, 8
		LD			DE, CLRTBL + (8  * 1)
		LD			HL, tile_auxiliar
		CALL		LDIRVM
		
		LD			BC, 8
		LD			DE, CLRTBLBANCO1 + (8  * 1)
		LD			HL, tile_auxiliar
		JP			LDIRVM
;fin_poner_tile_aux_en_puerta_color:


nivel0_pinta_estrellas:
		LD			BC, TILMAP + (32 * 0) + 3
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 0) + 23
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 1) + 7
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 1) + 16
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 2) + 0
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 2) + 11
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 3) + 20
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 3) + 23
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 4) + 1
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 4) + 30
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 5) + 2
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 5) + 28
		LD			 D, 30
		CALL		pinta_tile_suelto	
		LD			BC, TILMAP + (32 * 6) + 3
		LD			 D, 30
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 6) + 23
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 7) + 19
		LD			 D, 31
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 7) + 13
		LD			 D, 30
		JP			pinta_tile_suelto
;fin_nivel0_pinta_estrellas:
		
nivel0_pinta_luna:
		LD			BC, TILMAP + (32 * 0) + 26
		LD			 D, 33
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 0) + 27
		LD			 D, 34
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 1) + 26
		LD			 D, 35
		CALL		pinta_tile_suelto
		LD			BC, TILMAP + (32 * 1) + 27
		LD			 D, 36
		JP			pinta_tile_suelto
;fin_nivel0_pinta_luna:


;;=====================================================
;;PINTA_NOMBRE_ENEMIGO
;;=====================================================
; funcion: pinta el nombre del enemigo en la parte superior
pinta_nombre_enemigo:
			;si el subnivel no es 6 no es un jefe por lo que podemos salir
			LD			 A, (prota_pos_mapy)
			CP			 6
			RET			NZ
			
			;si drácula está muerto no es necesario pintar ya que los jefes estarán muertos
			LD			 A, (dracula_muerto)
			OR			 A
			RET			NZ
			
			;si habitación vacia no hace falta música
			LD			 A, (habitacion_terminada) 
			OR			 A
			RET			 NZ
			
			;hay que poner nombre según nivel
			;los nombre son consecutivos con saltos de 9 posiciones
			LD			HL, nombre_jefes
			
			LD			 A, (prota_nivel)
			LD			 B, A
			OR			 A
			JP			 Z, .fin_localiza_nombre	;en el nivel 0 no es necesario hacer cálculos
			
.busca_nombre:
[9]			INC			HL
			djnz		.busca_nombre

.fin_localiza_nombre:			
			LD			BC, 9				;nº posiciones a pintar
			LD			DE, TILMAP + 11		;destino en vram
			JP			LDIRVM
;fin_pinta_nombre_enemigo:
