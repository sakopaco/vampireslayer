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
prota_pos_mapx:
			DB		0	;pos columna
prota_pos_mapy:
			DB		0	;pos fila
prota_energia:
			DB		250

	STRUCT ESTRUCTURA_PUNTOMIRA
posx			DB		100
posy			DB		100
escena			DB		0	;valores porsibles 0 (blanco+rojo en punto de mira) y 1 (al revés)
velocidad		DB		0
color1			DB		15
color2			DB		8
boton2_pressed  DB		0
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
pm_aux1			DB		0	;para llegar a los 16 campos
pm_aux2			DB		0	;para llegar a los 16 campos
pm_aux3			DB		0	;para llegar a los 16 campos
pm_aux4			DB		0	;para llegar a los 16 campos
pm_aux5			DB		0	;para llegar a los 16 campos
pm_aux6			DB		0	;para llegar a los 16 campos
pm_aux7			DB		0	;para llegar a los 16 campos
pm_aux8			DB		0	;para llegar a los 16 campos
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







