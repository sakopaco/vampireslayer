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
activo				DB		0	;0 no activo <>0 activo 											0
postilemem_nousado	DW		0	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)	1,2
postilemem_usado	DW		0	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)	3,4
pospantalla			DB		0	;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
posx				DB		0	;pos del pixel central (esquina superior + 8x)						6
posy				DB		112	;pos del pixel central (esquina superior + 8y) (para toas igual)	7
puntero_accion		DW		0	;subrutina que indica la acción si se dispara en el objeto			8,9
ayu_aux1			DB		0	;relleno
ayu_aux2			DB		0	;relleno
ayu_aux3			DB		0	;relleno
ayu_aux4			DB		0	;relleno
ayu_aux5			DB		0	;relleno
ayu_aux6			DB		0	;relleno
	ENDSTRUCT;ESTRUCTURA_AYUDA


	STRUCT ESTRUCTURA_ANTORCHA
activo				DB		0	;0 no activa <>0 activo
postilemem_antor1	DW		0	;pos en memoria ver array_antorcha de cómo se mostrará (wordaux2)	1,2
pospantalla_antor1	DB		0	;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	3
pospantalla_antor2	DB		0	;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	4
escena				DB		0	;(va entre 0 y 1 - 0=>llama1 y llama2 o 1=>llama2 y llama1	7 - tiles 196 y 197)	5
cont_sig_escena		DB		10	;	6
	ENDSTRUCT;ESTRUCTURA_ANTORCHA

	STRUCT ESTRUCTURA_ESQUELETO
activo				DB		0	;0 no activa <>0 activo
postilemem_antor1	DW		0	;pos en memoria ver array_antorcha de cómo se mostrará (wordaux2)	1,2
pospantalla_esquel1	DB		0	;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	3
pospantalla_esquel2	DB		0	;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	4
escena				DB		0	;(va entre 0 y 4 - tiles 164, 165, 164, 166)	5
cont_sig_escena		DB		0	;	6
	ENDSTRUCT;ESTRUCTURA_ESQUELETO
	
	STRUCT	ESTRUCTURA_PUERTA
activo				DB		0	;0 no activa <>0 activo
posx				DB		0	;punto x de la puerta para cuando se dispare encima
posy				DB		0	;punto y de la puerta para cuando se dispare encima
radiox				DB		0	;radio x de la puerta para cuando se dispare encima
radioy				DB		0	;radio y de la puerta para cuando se dispare encima
accion				DW		0	;función para acción de cada tipo de puerta
tiles_puertas		DW		0	;puntero al array con los tiles de las puertas
	ENDSTRUCT;ESTRUCTURA_PUERTA






