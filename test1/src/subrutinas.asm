;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;INICIALIZA_NIVELES
;;=====================================================	
; función: 	copia la plantilla de niveles (habitaciones_plantilla) en los niveles de trabajo para el juego (habitaciones_juego)
; entrada: 	habitaciones_plantilla
; salida: 	habitaciones_juego
; toca: 	nada se usa push y pop
inicializa_niveles:
	PUSH	AF
	PUSH	BC
	PUSH	HL

	LD 		HL, habitaciones_plantilla
	LD 		DE, habitaciones_juego
	LD 		BC, 392			;8 bytes por subnivel x 7 subniveles x 7 niveles
	LDIR
	
	POP		HL
	POP		BC
	POP		AF
fin_iniciliza_niveles:
	RET


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
	XOR			A
	CALL 		CLS
fin_limpia_pantalla:

	;toca A y direcciones #F3E9/#F3EA/#F3EB
set_color:
	LD		 A,2				;verde oscuro
	LD 		(FORCLR),A
	LD		 A,1				;negro
	LD 		(BAKCLR),A
	LD		 A,1				;negro
	LD 		(BDRCLR),A
	CALL	CHGCLR  
fin_set_color:
	
	;cambiamos a SCREEN 2,2 del BASIC
	;toca A
screen2:
	LD		 A,2
	CALL	CHGMOD			;selecciona screen 2
sprites_16_16:
	LD		 A,(RG1SAV)
	OR		00000010b		;fuerza sprites de 16x16
	LD		(RG1SAV),A		;no lo guardamos en la copia de variables del sistema
	LD		 B,A
	LD		 C,1
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
; función: pinta el escenario, las 2 partes superiores y actualiza puertas
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_parte_superior_pantalla:

;************** preguntar cómo parametrizar esto **********************************************

	;cangando banco 1
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla11
	LD		DE,#0000
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla11
	LD		DE,#1800
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla11
	LD		DE,#2000
	LD		BC,256*8*1
	CALL	LDIRVM
	
	;cangando banco 2
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla12
	LD		DE,#0800
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla12
	LD		DE,#1900
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla12
	LD		DE,#2800
	LD		BC,256*8*1
	CALL	LDIRVM
	

fin_pinta_parte_superior_pantalla:
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
	LD		HL,tiles_patrones_pantalla3
	LD		DE,#1000
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla3
	LD		DE,#1A00
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla3
	LD		DE,#3000
	LD		BC,256*8*1
	CALL	LDIRVM
fin_pinta_parte_inferior_pantalla:
	RET



;;=====================================================
;;ACTUALIZA_MARCADOR_VIDAS
;;=====================================================	
; función:  actualiza el buffer de vidas
; entrada: 	prota.vidas
; salida: 	array_aux_vidas
; toca:		A,B,HL
actualiza_marcador_vidas:
	;PUSH	HL
	EXX

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
	LD		HL,array_aux_vidas
	LD		 A,(prota.vidas)
	LD		 B,A
loop_marcador_caras: ;asignar caras
	LD		(HL),POSCARAMAP	;13 posición mapa tiles para cara
	INC		HL
	DJNZ	loop_marcador_caras
fin_loop_marcador_caras:
	;POP		HL
	EXX
fin_actualiza_marcador_vidas:
	RET


;;=====================================================
;;PINTA_VIDAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinten y actualiza_vidas
; entrada: 	array_aux_vidas
; salida: 	actualiza_vidas_sn
; toca:		AF
pinta_vidas:
	EXX
	
	LD		HL,array_aux_vidas
	LD		DE,SC2MAP + POSVIDAS 	;inicio posición en el mapa de tiles de las vidas
	LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	CALL	LDIRVM
	
	;una vez quer está pintada ya no se actualizará a menos que perdamos/ganemos una vida
	XOR		 A
	LD		(actualiza_vidas_sn),A

	EXX
fin_pinta_vidas:
	RET
	



;;=====================================================
;;ACTUALIZA_MARCADOR_RELIQUIAS
;;=====================================================	
; función: 	actualiza buffer de reliquias
; entrada: 	prota.reliquias
; salida: 	array_aux_reliquias
; toca:		A,B,HL
actualiza_marcador_reliquias:
	;para no andar restando pongo todos los huecos a negro y luego en otro bucle las reliquias
	;1-pinto todo en blanco
	LD		HL,array_aux_reliquias
	LD		 B,NMAXVIDREL
loop_marcador_reliquias_negro:	;asignar espacios en negro
	LD		(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	INC		HL
	DJNZ	loop_marcador_reliquias_negro
fin_loop_marcador_reliquias_negro:
	;2-pinto las cruces según el n de reliquias
	LD		HL,array_aux_reliquias
	LD		 A,(prota.reliquias)
	LD		 B,A
loop_marcador_reliquias: ;asignar reliquias
	LD		(HL),POSRELIMAP	;17 posición mapa tiles para reliquia
	INC		HL
	DJNZ	loop_marcador_reliquias
fin_loop_marcador_reliquias:
fin_actualiza_marcador_reliquias:
	RET



;;=====================================================
;;PINTA_RELIQUIAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinten y actualiza_reliquias
; entrada: 	array_aux_reliquias
; salida: 	actualiza_reliquias_sn
; toca:		AF
pinta_reliquias:
	EXX
	
	LD		HL,array_aux_reliquias
	LD		DE,SC2MAP + POSRELIQ 	;inicio posición en el mapa de tiles de las vidas
	LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	CALL	LDIRVM
	
	;una vez quer está pintada ya no se actualizará a menos que ganemos/gastemos una reliquia
	XOR		 A
	LD		(actualiza_reliquias_sn),A

	EXX
fin_pinta_reliquias:
	RET
	


	
;;=====================================================
;;PINTA_NIVEL
;;=====================================================	
; función: 	actualiza el nivel en la parte de puntuación
; entrada: 	prota.nivel
; salida: 	-
; toca:		HL,DE,BC
pinta_nivel:	
	;forma más avanzada sin llamada a la bios
	LD		BC,SC2MAP + POSNIVEL ;posición en el mapa de tiles del tile de nivel
	LD		 A,(prota.nivel)	;seleccionando la pos del banco de tiles a poner en el mapa
	ADD		'0'	
	LD		 D,A
	
	CALL	pinta_tile_suelto	;nota ... un call+ret se debe poder sustiruir por un jp
fin_pinta_nivel:
	RET



;;=====================================================
;;PINTA_TILE_SUELTO
;;=====================================================	
; función: 	pinta al tile que digamos en D, en la posición BC
; entrada: 	BC,D
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
	
	LD		 A,(prota.energia) 	;para las comparaciones A variable (actual) y B fijo (limites)

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
; toca:		AF
pinta_energia:
	EXX
	
	LD		HL,array_aux_energia
	LD		DE,SC2MAP + POSENERG 	;inicio posición en el mapa de tiles de las vidas
	LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	CALL	LDIRVM
		
	EXX
fin_pinta_energia:
	RET


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
	LD		DE,SC2MAP + POSMAPLIN1 	;inicio posición en el mapa de tiles de la primera fila del mapa
	LD		BC,NHABNIVEL			;cada nivel son 7 filas con 7 habitaciones "posibles"
	CALL	LDIRVM
	
	LD		HL,array_aux_mapa_limpiar
	LD		DE,SC2MAP + POSMAPLIN2
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar
	LD		DE,SC2MAP + POSMAPLIN3
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,SC2MAP + POSMAPLIN4
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,SC2MAP + POSMAPLIN5
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,SC2MAP + POSMAPLIN6
	LD		BC,NHABNIVEL
	CALL	LDIRVM

	LD		HL,array_aux_mapa_limpiar	
	LD		DE,SC2MAP + POSMAPLIN7
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
; entrada: 	A (tipo 0 gris 1 - tile 0,muñeco - tile 19) *********** no sé si sería bueno usar PUSH A y aquí POP A
; salida: 	-
; toca:		todos
posiciona_en_mapa:
	PUSH	 AF		;almacenamos el tipo a pintar para cuando terminemos de calcular la coordenada
	
	;#0238 es la posición en mapa de tiles de la esquina superior izquierda del mapa (569 en decimal)
	LD		HL,SC2MAP + POSMAPA ;pos inicial
	;~ ;ahora se le suma la fila * 32 + columna

	;sumar fila
	LD		DE,32	;32 ancho del mapa de tiles de una pantalla
	LD 		 A,(prota.pos_mapy)
	LD		 B,A
prod_coloca_fila:	
	ADD		HL,DE
	DJNZ	prod_coloca_fila
	
	;suma columna
	LD		DE,#0003
	ADD		HL,DE
	
	;resultado en BC
	LD		 B,H
	LD		 C,L
	
	;terminado de fijar la coordenada recuperamos a para ver el tipo
	POP		 AF
	OR		 A
	JP		 Z,pinta_pos_mapa_vacio
	LD		 D,TILEMAPPROT
	JP		fin_pinta_pos_mapa
pinta_pos_mapa_vacio:
	LD		 D,TILEMAPVACI				;********************* se puede hacer mejor o está bien usar push y pop

fin_pinta_pos_mapa:
	CALL	pinta_tile_suelto
fin_posiciona_en_mapa:
	RET



;=====================================================
;;PINTA_ARRAY
;;=====================================================	
;;;funcion:  se le pasa un array con posiciones de tiles y coordenadas x e y y los pinta en screen 2
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
; entrada: 	A (se miran los 5 bits más bajos) 1 escalera 1 puerta arriba 1 pu der 1 pu aba 1 pu izq (si es 0 pinta pared)
; salida: 	-
; toca:		- A
pinta_puertas:
	BIT		2,A
	CALL	nz,pinta_puerta_der

	BIT		3,A
	CALL	nz,pinta_puerta_arr

	BIT		1,A
	CALL	nz,pinta_puerta_aba
	
	BIT		0,A
	CALL	nz,pinta_puerta_izq
	
	XOR		 A
	LD		(actualiza_puertas_sn),A ;(1 actualiza y 0 no actualiza puertas) se pone a 0 para que no actualice todo el tiempo (ya se ha actualizado)
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
	LD		HL,SC2MAP + POSPUERABAJ			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,1								;nº de filas
	LD		E,4								;nº de columnas
	CALL	pinta_array
fin_pinta_puerta_aba:
	RET

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
	LD		HL,SC2MAP + POSPUERARRI			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,5								;nº de filas
	LD		E,4								;nº de columnas
	CALL	pinta_array
fin_pinta_puerta_arr:
	RET

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
	LD		HL,SC2MAP + POSPUERDERE			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,7								;nº de filas
	LD		E,3								;nº de columnas
	CALL	pinta_array
fin_pinta_puerta_der:
	RET
	
;;=====================================================
;;PINTA_PUERTA_IZQ
;;=====================================================	
; función: 	pinta la puerta de la izquierda
; entrada: 	array_puerta_izquierda, wordaux2, wordaux1
; salida: 	-
; toca:		HL,BC, DE
pinta_puerta_izq:
	LD		HL,array_puerta_izquierda		;guardo puntero al array a pintar (como psar por referencia)
	LD		(wordaux2),HL					;en la variable wordaux2
	LD		HL,SC2MAP + POSPUERIZQU			;calcula posición en tilemap
	LD		(wordaux1),HL					;guarda valor pos tilemap en wordaux1
	LD		B,H								;coloca posición tilemap BC
	LD		C,L
	LD		D,7								;nº de filas
	LD		E,3								;nº de columnas
	CALL	pinta_array
fin_pinta_puerta_izq:
	RET


