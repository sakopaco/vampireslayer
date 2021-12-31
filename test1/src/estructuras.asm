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


;Tipo:
;		0 - inactivo
;		1 - muerto (se pone daño 0 y vida: el tiempo apra desaparecer)
;movimiento:
;	1 - ciempies ????? (quieto)
;	2 - murciélago
;		araña 
;	"precalculadas" de 8 posibles (para usar R) desde la parte superior e irán bajando y 
;	subiendo verticalmente y con pos aleatorias horizontales para que no vayan todos al unísono
;	3 - lobo
;		zombie
;		cabalero blanco y negro
;	"precalculadas" de 8 posibles (para usar R) desde la parte izquierda a la derecha moviéndose
;	horizontalmente y con pos aleatorias verticales para que no vayan todos al unísono
;	4 - fantasma
;		fuego
;	describe círculos desde un punto central con radios (pseudoaleatorios) a cada vuelta
;	5 - magia
;		posiciones "pseudoaleatorias" por pantalla estando un contador en cada posición



	STRUCT ESTRUCTURA_ENEMIGO
activo_tipo			DB		0	;si inactivo = 0 si <> 0 es el tipo de enemigo
escena				DB		0	;sprite a mostrar
cont_sig_escena		DB		0	;siguiente sprite a mostrar ??(como normalmente usaré 2 no se si esto se usará)
reset_contador		DB		0	;se usa constante
ptr_sig_escena		DW		0	;?? si hay dos escenas no tiene sentido
energia				DB		0	;energía del enemigo antes de morir
direccion			DB		0	;?? (duda por si no tendría espacio para tanto sprite en memoria)
pos_x				DB		0	;pos x para mover y punto central del sprite para revisar disparo
pos_y				DB		0	;pos y para mover y punto central del sprite para revisar disparo
inc_x				DB		0	;incremento x para mover
inx_y				DB		0	;incremento y para mover
ptr_mover			DW		0	;puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
;se pondrán 8 sprites: 4 por si hay enemigos de hasta 4 sprites y por 2 por usar 2 escenas... si se usan 3 habría que ampliar
sprite_1a			DB		0
sprite_2a			DB		0
sprite_3a			DB		0
sprite_4a			DB		0
sprite_1b			DB		0
sprite_2b			DB		0
sprite_3b			DB		0
sprite_4b			DB		0
sprite_1c			DB		0
sprite_2c			DB		0
sprite_3c			DB		0
sprite_4c			DB		0
sprite_1d			DB		0
sprite_2d			DB		0
sprite_3d			DB		0
sprite_4d			DB		0
ptr_explosion		DW		0	;realiza cambios en caso de muerte
	ENDSTRUCT;ESTRUCTURA_ENEMIGO

array_dano:
		DB			


