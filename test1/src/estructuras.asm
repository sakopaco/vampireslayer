;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================

;crear estructura

	STRUCT ESTRUCTURA_PUNTOMIRA
posx			DB		100
posy			DB		100
escena			DB		0	;valores porsibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
velocidad		DB		0
boton2_pressed  DB		0
cadencia		DB		5	;nº de veces que se ejecutará el disparo antes de ejecutar un disparo real (porque cuando se pulsa la tecl dispara 3 ó 4 veces de rápido que va)
; al final he decidido (ya que el punto de mira es el prota) que lo relacionado con el prota vaya en esta estructura
pm_aux1			DB		0	;para llegar a los 16 campos
pm_aux2			DB		0	;para llegar a los 16 campos
pm_aux3			DB		0	;para llegar a los 16 campos
pm_aux4			DB		0	;para llegar a los 16 campos
pm_aux5			DB		0	;para llegar a los 16 campos
pm_aux6			DB		0	;para llegar a los 16 campos
pm_aux7			DB		0	;para llegar a los 16 campos
pm_aux8			DB		0	;para llegar a los 16 campos
pm_aux9			DB		0	;para llegar a los 16 campos
pm_aux10		DB		0	;para llegar a los 16 campos
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
	
	STRUCT ESTRUCTURA_AYUDA		;vidas extra, plantas de curación de energía, reliquias	
activo				DB		0	;0 no activo <>0 activo 
tipo				DB		0	;ver constantes 
tipousado			DB		0	;es tipo + 4
postile				DW		0	;como tiene algo de aleatoriedad se guarda para dibujar los tiles de usado ;almacena la posición en el tilemap 0 al 675
posx				DB		0
posy				DB		0
puntero_accion		DW		0	;subrutina que indica la acción si se dispara en el objeto
ayu_aux1			DB		0	;relleno
ayu_aux2			DB		0	;relleno
ayu_aux3			DB		0	;relleno
ayu_aux4			DB		0	;relleno
ayu_aux5			DB		0	;relleno
ayu_aux6			DB		0	;relleno
ayu_aux7			DB		0	;relleno
	ENDSTRUCT;ESTRUCTURA_AYUDA







