;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================

	STRUCT ESTRUCTURA_PUNTOMIRA
posx		DB		0
posy		DB		0
color		DB		0
retardo		DB		0	;contador_siguiente_escena
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
nivel		DB		0
pos_mapx	DB		0	;pos columna
pos_mapy	DB		0	;pos fila
vidas		DB		3
energia		DB		250
reliquias	DB		3

escena				DB		0
reset_contador		DB		0
color1				DB		0
color2				DB		0
velocidad			DB		0
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
pm_aux				DB		0	;para llegar a los 16 campos

	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA
	
	STRUCT ESTRUCTURA_ENEMIGO
tipo				DB		0	;(0 serpiente por ejemplo) #FF muerto o no existe
posx				DB		50
posy				DB		50
color				DB		5
escena				DB		0
contador_siguiente_escena	DB	0
reset_contador		DB		0
dano				DB		0	;daño
energia				DB		0	;energía del enemigo... si llega a 0 => existe <- 0
;indica el nº de sprite a mostrar y si está compuesto por uno o dos sprites y si están en horizontal o vertical
spr1				DB		0
spr2				DB		0
ver_hor				DB		0
en_aux1				DB		0	;para llegar a los 16 campos
en_aux2				DB		0
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
