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
;	0  - inactivo
;	1  - muerto (se pone daño 0 y vida: el tiempo para desaparecer)
;	2  - ciempiés
;	3  - serpiente
;	4  - araña
;	5  - murciélago
;	6  - lobo
;	7  - zombi
;	8  - fantasma
;	9  - caballero gris
;	10 - caballero negro
;	11 - fuego
;	12 - magia
;	13 - jefe lobo gigante
;	14 - jefe murciélago gigante
;	15 - jefe fantasma gigante
;	16 - jefe zombie gigante
;	17 - jefe caballero
;	18 - jefe beholder
;	19 - mano derecha conde drácula
;	20 - izquierda conde drácula
;	21 - conde drácula
;
;Sprites que usa (16x16):
;	2  - ciempiés: 1
;	3  - serpiente: 1
;	4  - araña: 1
;	5  - murciélago: 1
;	6  - lobo: 2 (horz)
;	7  - zombi: 2 (vert)
;	8  - fantasma: 3 (triángulo invertido)
;	9  - caballero gris: 2 (vert)
;	10 - caballero negro: 2 (vert)
;	11 - fuego: 2 (vert)
;	12 - magia: 2 (horz)
;	13 - jefe lobo gigante: 4
;	14 - jefe murciélago gigante: 4
;	15 - jefe fantasma gigante: 4
;	16 - jefe zombie gigante: 4
;	17 - jefe caballero: 4
;	18 - jefe beholder: 4
;	19 - mano derecha conde drácula: 2 (vert)
;	21 - mano izquierda conde drácula: 2 (vert)
;	22 - conde drácula: 2 (vert)
;		
;movimiento:
;	1 - ciempiés
;		beholder
;		posiciones aleatoriaas precalculadas (duran en posición cont_sig_escena)
;	2 - murciélago
;		araña 
;		"precalculadas en horizontal" de 8 posibles (para usar R) desde la parte superior e irán bajando y 
;		subiendo verticalmente y con pos aleatorias horizontales para que no vayan todos al unísono
;		NOTA: para el murciélado me gustaría una onda senoidal a la altura de un tercio 				?? investigar
;	3 - serpiente
;		lobo
;		zombie
;		cabalero gris y negro
;		"precalculadas en vertical" de 8 posibles (para usar R) desde la parte izquierda a la derecha moviéndose
;		horizontalmente y con pos aleatorias verticales para que no vayan todos al unísono
;	4 - fantasma
;		fuego
;		describe círculos desde un punto central con radios (pseudoaleatorios) a cada vuelta
;	5 - magia
;		manos del conde drácula
;		posiciones "pseudoaleatorias" por pantalla estando un contador en cada posición
;	6 - conde drácula
;		posiciones aleatoriaas precalculadas (duran en posición cont_sig_escena)


	STRUCT ESTRUCTURA_ENEMIGO
activo_tipo			DB		0	;si inactivo = 0 si <> 0 es el tipo de enemigo
escena				DB		0	;sprite a mostrar 1/2
cont_sig_escena		DB		0	;retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
tiemp_cam_escena	DB		0	;cada cuantas iteraciones se cambiará la escena
ptr_sig_escena		DW		0	;funcion que cambia los sprites de la escena (según el nº de sprites será distinta)
energia				DB		0	;energía del enemigo antes de morir
ptr_explosion		DW		0	;realiza cambios en caso de muerte (energía = 0)
pos_x				DB		0	;pos x para mover y punto central del sprite para revisar disparo
pos_y				DB		0	;pos y para mover y punto central del sprite para revisar disparo
inc_x				DB		0	;incremento x para mover
inx_y				DB		0	;incremento y para mover
radio				DB		0	;radio para movimientos circulares
direccion			DB		0	;?? (duda por si no tendría espacio para tanto sprite en memoria)
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
color1				DB		0	;color sprite 1
color2				DB		0	;color sprite 1
color3				DB		0	;color sprite 1
color4				DB		0	;color sprite 1
	ENDSTRUCT;ESTRUCTURA_ENEMIGO

