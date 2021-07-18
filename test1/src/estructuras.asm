;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================

;crear estructura
;variables globales del prota
prota_nivel:			;nivel del castillo donde está 0-6
			DB		0
prota_vidas:
			DB		0
prota_reliquias:
			DB		3


	STRUCT ESTRUCTURA_PUNTOMIRA
posx		DB		0
posy		DB		0
color		DB		0
retardo		DB		0	;contador_siguiente_escena

pos_mapx	DB		0	;pos columna
pos_mapy	DB		0	;pos fila

energia		DB		250
escena			DB		0
reset_contador	DB		0
color1			DB		0
color2			DB		0
velocidad		DB		0
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
pm_aux1			DB		0	;para llegar a los 16 campos
pm_aux2			DB		0	;para llegar a los 16 campos
pm_aux3			DB		0	;para llegar a los 16 campos
pm_aux4			DB		0	;para llegar a los 16 campos


	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA
	
	STRUCT ESTRUCTURA_ENEMIGO
tipo				DB		0	;(0 serpiente por ejemplo) #FF muerto o no existe
posx				DB		5
posy				DB		50
color				DB		5
escena				DB		0
contador_siguiente_escena	DB	0
reset_contador		DB		0
dano				DB		0	;daño
energia				DB		0	;energía del enemigo... si llega a 0 => existe <- 0
;indica el nº de sprite a mostrar y si está compuesto por uno o dos sprites y si están en horizontal o vertical
ver_hor				DB		0
manejador_dibujo 	DW		0
en_aux3				DB		0
en_aux4				DB		0
	ENDSTRUCT;ESTRUCTURA_ENEMIGO
	
	STRUCT ESTRUCTURA_EXTRA		;vidas extra, plantas de curación de energía, reliquias	
tipo				DB		0	;#FF muerto/usado o no existe
posx				DB		50
posy				DB		50
color				DB		5
contador			DB		0	;por si doy dos reliquias en vez de una, por ejemplo
en_aux1				DB		0	;para llegar a los 16 campos
en_aux2				DB		0
en_aux3				DB		0
en_aux4				DB		0
en_aux5				DB		0
en_aux6				DB		0
en_aux7				DB		0
en_aux8				DB		0
en_aux9				DB		0
en_aux10			DB		0
en_aux11			DB		0
	ENDSTRUCT;ESTRUCTURA_EXTRA

ID_ARANA		equ		0
ID_LOBO			equ		1
;....



;entrada: 
;DE = XY
;HL = puntero a manejador pintado
;C = tipo de enemigo
add_enemy:
	EXX
	
;primero buscar hueco en lista_enemigos
	LD		IX, lista_enemigos
	LD		B, 10 (USAR CTE)
.LOOP
	LD		A, (IX)
	CP		#FF
	JP		Z,.ENCONTRADO
NO ENCONTRADO:
	LD		DE, ESTRUCTURA_ENEMIGO
	ADD		IX,DE
	DJNZ	.LOOP
	JR		$
.ENCONTRADO:
	EXX
	
	LD		(IX+ESTRUCTURA_ENEMIGO.manejador_dibujo+0), L 
	LD		(IX+ESTRUCTURA_ENEMIGO.manejador_dibujo+1), H
;una vez encontrado inicializar: x, y, manejador_dibujo
; inicializar el resto de campos	

		
	
	
	ret

	
actualiza_enemigos:
	LD		IX, lista_enemigos
	LD		B, 10 (USAR CTE)
.LOOP
	LD		A, (IX)
	CP		#FF
	call	NZ,.actualiza_variables_enemigo

	LD		DE, ESTRUCTURA_ENEMIGO
	ADD		IX,DE
	DJNZ	.LOOP

fin_actualiza_enemigos:
	ret
	
	
pinta_enemigos:
	LD		IX, lista_enemigos
	LD		B, 10 (USAR CTE)
.LOOP
	LD		A, (IX)
	CP		#FF
	JR		Z, .continua
	
	LD		HL,.continua
	PUSH	HL
	LD		L, (IX+ESTRUCTURA_ENEMIGO.manejador_dibujo+0)
	LD		H, (IX+ESTRUCTURA_ENEMIGO.manejador_dibujo+1)
	JP		(hl)

	;EL RET DEL dibujo_anara DEVULEVE EL PC


.continua:
	DJNZ	.LOOP

fin_pinta_enemigos:
	ret









;entrada IX puntero a la estructura del enemigo
dibujo_anara:
	eXX ¿?
	;puntero_array_atrub_array_VRAM
	ld 		HL, (puntero_array_atrib_array_VRAM)
	;calculamos la y
	ld		a, (ix + ESTRUCTURA_ENEMIGO.posy)
	ld		(HL), a
	inc		HL
	;calculamos la x
	ld		a, (ix + ESTRUCTURA_ENEMIGO.posx)
	ld		(HL), a
	inc		HL
	;calculamos el patron
	ld		a, 3; ya lo debo saber (usar ctes)
	ld		(HL), a
	inc		HL
	;calculamos el color
	ld		a, 3; ya lo debo saber (usar ctes)
	ld		(HL), a
	
	ld 		(puntero_array_atrib_array_VRAM),HL
	
	ret
	
	




