;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================

	STRUCT ESTRUCTURA_PUNTOMIRA
posx		DB		0
posy		DB		0
color		DB		0
retardo		DB		0
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
nivel		DB		0
pos_mapx	DB		0	;pos columna
pos_mapy	DB		0	;pos fila
vidas		DB		3
energia		DB		250
reliquias	DB		3
	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA
	
	STRUCT ESTRUCTURA_ENEMIGO
existe		DB		0			;0 no existe y 1 existe (así recorro el array y sólo actuo en los enemigos creados no muertos)
tipo		DB		0			;(0 serpiente)
posx		DB		50
posy		DB		50
color		DB		5
paso		DB		0			;paso 0 o 1 (2 escenas)
retardo		DB		0			;entre 0 y 9
energia		DB		0			;energía del enemigo... si llega a 0 => existe <- 0
	ENDSTRUCT;ESTRUCTURA_PUNTOMIRAA
