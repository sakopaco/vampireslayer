;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================

;crear estructura

	STRUCT ESTRUCTURA_PUNTOMIRA
posx			DB		POSXPM
posy			DB		POSYPM
escena			DB		0	;valores porsibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
velocidad		DB		0
cadencia		DB		0	;velocidad de disparo si botón pulsado
spritea			DB		0	;valor en pos de memoria del sprite grande del punto de mira
spriteb			DB		0 	;valor en pos de memoria del sprite pequeño del punto de mira
	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA


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


	STRUCT ESTRUCTURA_AYUDA	
activa				DB		0	;0 no activa <>0 activo (y muestra tiles ayudaoff)
posx				DB		0	;punto x de la ayuda para cuando se dispare encima
posy				DB		112	;punto y de la ayuda para cuando se dispare encima
radiox				DB		0	;radio x de la ayuda para cuando se dispare encima
radioy				DB		0	;radio y de la ayuda para cuando se dispare encima
accion				DW		0	;función para acción de cada tipo de ayuda
tiles_ayudaon		DW		0	;puntero al array con los tiles de las ayudas sin usar para wordaux2
tiles_ayudaoff		DW		0	;puntero al array con los tiles de las ayudas sin usar para wordaux2
pos_en_tilemap		DW		0	;calcula posición en tilemap para wordaux1
alto				DB		2	;alto en tiles del dibujo de la puerta (filas)
ancho				DB		2	;ancho en tiles del dibujo de la puerta (columnas)
	ENDSTRUCT;ESTRUCTURA_PUERTA


	STRUCT ESTRUCTURA_PUERTA	;también servirá para la escalera
activa				DB		0	;0 no activa <>0 activo
posx				DB		0	;punto x de la puerta para cuando se dispare encima
posy				DB		0	;punto y de la puerta para cuando se dispare encima
radiox				DB		0	;radio x de la puerta para cuando se dispare encima
radioy				DB		0	;radio y de la puerta para cuando se dispare encima
accion				DW		0	;función para acción de cada tipo de puerta
tiles_puerta		DW		0	;puntero al array con los tiles de las puertas para wordaux2
pos_en_tilemap		DW		0	;calcula posición en tilemap para wordaux1
alto				DB		0	;alto en tiles del dibujo de la puerta (filas)
ancho				DB		0	;ancho en tiles del dibujo de la puerta (columnas)
	ENDSTRUCT;ESTRUCTURA_PUERTA






