;;=====================================================
;;DEFINICIÓN DE VARIABLES GENERALES
;;=====================================================

;colores base de la pantalla
color_base:
			DB		COLNEGRO,COLNEGRO,COLNEGRO

;colores de pantalla cuando se tira bomba
color_bomba1:
			DB		COLROJO,COLROJO,COLROJO
color_bomba2:
			DB		COLROJOOSC,COLROJOOSC,COLROJOOSC

;variables globales del prota
prota_nivel:									;nivel del castillo donde está 0-6
			DB		0
prota_vidas:
			DB		0
prota_reliquias:
			DB		3
prota_pos_mapx:
			DB		0							;pos columna
prota_pos_mapy:
			DB		0							;pos fila
prota_energia:
			DB		250

;array para pintar de golpe el marcador de vidas
array_aux_vidas: 		
			DB		0,0,0,0,0,0,0,0

;;RELIQUIAS
array_aux_reliquias:							;array para pintar de golpe el marcador de reliquias
			DB		0,0,0,0,0,0,0,0

;;ENERGIA
array_aux_energia:								;array para pintar de golpe el marcador de energía
			DB		16,0,0,0,0,0,0 				;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
			DB		0							;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte

;;MAPA	
array_aux_mapa_limpiar:							;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
			DB		0,0,0,0,0,0,0
elemento_pintar_mapa:
			DB		0							;TILEPROTAM = 19, ;TILEGRISM = 9
			
;;DECORACION PAREDES
antorchas:			DS		ESTRUCTURA_ANTORCHA
array_antorcha:				DB	197,198,199		;fuego + madera1 + madera2

esqueletos:			DS		ESTRUCTURA_ESQUELETO
array_esqueleto:			DB	194, 0, 195, 160, 164, 161, 0, 163, 0, 193, 162, 192
lista_escenas_calavera:		DB	164, 165, 164, 166


;; parte de los enemigos
; para movmiento
heartbeat			DB		0;					;reloj central que moverá los enemigos

;;SPRITES GENERAL (PROTA +  ENEMIGOS)
;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:				DS	2 * 4
array_sprites_enem:				DS	30 * 4



;;=====================================================
;;VARIABLES AYUDAS
;;=====================================================

hay_ayudas_en_pantalla				DB	0		;1 => hay / 0 => no hay; variable que se actualiza cuando cambiemos de habitación para no mirar el bit de habitación cada vez
puntero_ayuda_actual:				DW	0		;puntero a ayuda que se muestra en pantalla (sólo se muestra una a la vez)


;array de ayudas
;posición dentro del bank1 (o 0 que son iguales) de los tiles de la ayuda (cómo en los sprites de 2x2)
array_ayudas:
array_oracionon:			DB	200,202
array_oracionon1:			DB	201,203
array_oracionoff:			DB	204,206
array_oracionoff1:			DB	205,207
array_cruzon:				DB	208,210
array_cruzon1:				DB	209,211
array_cruzoff:				DB	212,214
array_cruzoff1:				DB	213,215
array_aguaon:				DB	216,218
array_aguaon1:				DB	217,219
array_aguaoff:				DB	220,222
array_aguaoff1:				DB	221,223
array_armaduraon:			DB	224,226
array_armaduraon1:			DB	225,227
array_armaduraoff:			DB	228,230
array_armaduraoff1:			DB	229,231
array_plantaon:				DB	232,234
array_plantaon1:			DB	233,235
array_plantaoff:			DB	236,238
array_plantaoff1:			DB	237,239
array_vidaextraon:			DB	240,242
array_vidaextraon1:			DB	241,243
array_vidaextraoff:			DB	244,246
array_vidaextraoff1:		DB	245,247
array_ballestaon:			DB	248,250
array_ballestaon1:			DB	249,251
array_ballestaoff:			DB	252,254
array_ballestaoff1:			DB	253,255


lista_ayudas:
ayuda_oracion:		DS		ESTRUCTURA_AYUDA		
ayuda_cruz:			DS		ESTRUCTURA_AYUDA
ayuda_aguabendita:	DS		ESTRUCTURA_AYUDA
ayuda_armadura:		DS		ESTRUCTURA_AYUDA
ayuda_planta:		DS		ESTRUCTURA_AYUDA
ayuda_vidaextra		DS		ESTRUCTURA_AYUDA
ayuda_ballesta:		DS		ESTRUCTURA_AYUDA

datos_ayudas:
datos_oracion:			
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSORACIONX			;punto x de la ayuda para cuando se dispare encima
				DB		POSORACIONY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_oracion		;función para acción de cada tipo de ayuda
				DW		array_oracionon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_oracionoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSORACION ;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_cruz:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSCRUZX			;punto x de la ayuda para cuando se dispare encima
				DB		POSCRUZY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_cruz			;función para acción de cada tipo de ayuda
				DW		array_cruzon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_cruzoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSCRUZ	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)
					
datos_aguabendita:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSAGUAX			;punto x de la ayuda para cuando se dispare encima
				DB		POSAGUAY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_aguabendita	;función para acción de cada tipo de ayuda
				DW		array_aguaon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_aguaoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSAGUA	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_armadura:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSARMADURAX		;punto x de la ayuda para cuando se dispare encima
				DB		POSARMADURAY		;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_armadura		;función para acción de cada tipo de ayuda
				DW		array_armaduraon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_armaduraoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSARMADURA;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_planta:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSPLANTAX			;punto x de la ayuda para cuando se dispare encima
				DB		POSPLANTAY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_planta		;función para acción de cada tipo de ayuda
				DW		array_plantaon		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_plantaoff		;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSPLANTA	;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)

datos_vidaextra:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSVIDAEXTX			;punto x de la ayuda para cuando se dispare encima
				DB		POSVIDAEXTY			;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_vidaextra	;función para acción de cada tipo de ayuda
				DW		array_vidaextraon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_vidaextraoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSVIDAEXT ;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)
  
datos_ballesta:
				DB		ACTIVA				;0 no activa <>0 activo (y muestra tiles ayudaoff)
				DB		POSBALLESTAX		;punto x de la ayuda para cuando se dispare encima
				DB		POSBALLESTAY		;punto y de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAX			;radio x de la ayuda para cuando se dispare encima
				DB		RADIOAYUDAY			;radio y de la ayuda para cuando se dispare encima
				DW		accion_ballesta		;función para acción de cada tipo de ayuda
				DW		array_ballestaon	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		array_ballestaoff	;puntero al array con los tiles de las ayudas sin usar para wordaux2
				DW		TILMAP + POSBALLESTA;calcula posición en tilemap para wordaux1
				DB		ALTOAYUDA			;alto en tiles del dibujo de la puerta (filas)
				DB		ANCHOAYUDA			;ancho en tiles del dibujo de la puerta (columnas)  


;;=====================================================
;;VARIABLES PINTA PANTALLAS
;;=====================================================
;pinta_parte_superior_pantalla
tiles_patrones:		DW	0
tiles_colores:		DW	0
tiles_mapa:			DW	0

;pinta_array
wordaux1:		DW	0	;almacena la posición en el tilemap 0 al 675
wordaux2:		DW	0	;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 2 primeros bancos)
byteaux1:		DB	0	;nº filas Registro D
byteaux2:		DB	0	;nº columnas Registro E

;flip_calavera_esqueletos
var_aux_calavera	DB	0;


;;=====================================================
;;VARIABLES PUERTAS
;;=====================================================
;; arrays con mapa de tiles de las puertas
array_puerta_arriba:
		DB	3,1,1,3
		DB	1,1,1,1
		DB	1,1,1,1
		DB	1,1,1,1
		DB	1,1,1,1
		DB	1,1,1,1

array_puerta_derecha:
		DB	1,3,3
		DB	1,1,3
		DB	1,1,1
		DB	1,1,1
		DB	1,1,1
		DB	1,1,1
		DB	4,1,1
		DB	4,4,1
	
array_puerta_abajo:			
		DB	1,1,1,1

array_puerta_izquierda:
		DB	3,3,1
		DB	3,1,1
		DB	1,1,1
		DB	1,1,1
		DB	1,1,1
		DB	1,1,1
		DB	1,1,4
		DB	1,4,4

array_escalera:
		DB	5,5,5,5,5,5,5,5
		DB	5,0,0,0,1,1,1,5
		DB	5,0,0,0,1,1,1,5
		DB	5,0,0,6,6,6,6,5
		DB	5,0,6,6,6,6,6,5
		DB	5,6,6,6,6,6,6,5
		DB	5,4,4,4,4,4,4,5


lista_puertas:
puerta_arriba:		DS		ESTRUCTURA_PUERTA
puerta_derecha:		DS		ESTRUCTURA_PUERTA
puerta_abajo:		DS		ESTRUCTURA_PUERTA
puerta_izquierda:	DS		ESTRUCTURA_PUERTA
puerta_escalera:	DS		ESTRUCTURA_PUERTA

datos_puertas:
datos_puerta_escalera:
					DB		#00;0		; 0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#30;48		;punto y de la puerta para cuando se dispare encima
					DB		#20;32		;radio x de la puerta para cuando se dispare encima
					DB		#18;24		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba;función para acción de cada tipo de puerta
					DW		array_escalera		;puntero al array con los tiles de las puertas
					DW		TILMAP + POSESCALERA
					DB		7			;alto/filas
					DB		8			;ancho/columnas

datos_puerta_arriba:
					DB		#00;0		;0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#34;52		;punto y de la puerta para cuando se dispare encima
					DB		#10;16		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_arriba	;función para acción de cada tipo de puerta
					DW		array_puerta_arriba		;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERARRI
					DB		6			;alto/filas
					DB		4			;ancho/columnas

datos_puerta_derecha:
					DB		#00;0		;0 no activa <>0 activo
					DB		#EC;236		;punto x de la puerta para cuando se dispare encima
					DB		#54;84		;punto y de la puerta para cuando se dispare encima
					DB		#0C;12		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_derecha	;función para acción de cada tipo de puerta
					DW		array_puerta_derecha	;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERDERE
					DB		8			;alto/filas
					DB		3			;ancho/columnas
					
datos_puerta_abajo:
					DB		#00;0		;0 no activa <>0 activo
					DB		#80;128		;punto x de la puerta para cuando se dispare encima
					DB		#7C;124		;punto y de la puerta para cuando se dispare encima
					DB		#11;		;radio x de la puerta para cuando se dispare encima
					DB		#06;		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_abajo		;función para acción de cada tipo de puerta
					DW		array_puerta_abajo		;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERABAJ
					DB		1			;alto/filas
					DB		4			;ancho/columnas

datos_puerta_izquierda:
					DB		#00;0		;0 no activa <>0 activo
					DB		#18;24		;punto x de la puerta para cuando se dispare encima
					DB		#54;84		;punto y de la puerta para cuando se dispare encima
					DB		#0C;12		;radio x de la puerta para cuando se dispare encima
					DB		#14;20		;radio y de la puerta para cuando se dispare encima
					DW		accion_puerta_izquierda	;función para acción de cada tipo de puerta
					DW		array_puerta_izquierda	;puntero al array con los tiles de las puertas
					DW		TILMAP + POSPUERIZQU
					DB		8			;alto/filas
					DB		3			;ancho/columnas


;;=====================================================
;;VARIABLES PUNTO MIRA
;;=====================================================
dano_actual:	DB		2	;daño actual cuando el prota dispara

puntomira:		DS		ESTRUCTURA_PUNTOMIRA

datos_puntomira:			
				DB		POSXPM		;posición X de los sprites del punto de mira
				DB		POSYPM		;posición Y de los sprites del punto de mira
				DB		0			;valores posibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
				DB		0			;velocidad (por si lo pongo variable)
				DB		4			;cadencia
				DB		SPRI_DANO1A	;valor en pos de memoria del sprite grande del punto de mira
				DB		SPRI_DANO1B	;valor en pos de memoria del sprite pequeño del punto de mira


;;=====================================================
;;VARIABLES HABITACIONES
;;=====================================================
	include "../datos/habitaciones.asm"

;;=====================================================
;;VARIABLES SPRITES
;;=====================================================
	include "../datos/sprites.asm"


;;=====================================================
;;VARIABLES ENEMIGOS
;;=====================================================


;;=====================================================
;;VARIABLES GENERALES ENEMIGOS
;;=====================================================
enemigo1			DS	ESTRUCTURA_ENEMIGO
enemigo2			DS	ESTRUCTURA_ENEMIGO
enemigo3			DS	ESTRUCTURA_ENEMIGO
enemigo4			DS	ESTRUCTURA_ENEMIGO
enemigo5			DS	ESTRUCTURA_ENEMIGO
enemigo6			DS	ESTRUCTURA_ENEMIGO


;;=====================================================
;;VARIABLES ARANA
;;=====================================================
posiciones_arana_x: 		;16 posisiones iniciales posibles
			DB		0,16,32,48,64,80,96,112,128,144,160,176,192,208,224,240

datos_arana:
			DB		4		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		DIRABAJO	;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_arana	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo


;;=====================================================
;;VARIABLES CIENPIES
;;=====================================================
;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_cienpies_x:
			DB		240,100,175,150,200,75,0,125,25
posiciones_cienpies_y:
			DB		60,72,24,36,108,84,12,96,48

datos_cienpies:	
			DB		2		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_cienpies	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo


;;=====================================================
;;VARIABLES SERPIENTE
;;=====================================================
posiciones_serpiente_y:	;16 posisiones iniciales posibles
			DB			80,83,86,89,92,95,98,101,104,107,110,113,116,119,122,125
		
datos_serpiente:
			DB		3		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		0		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		0		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		0		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_serpiente	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo


;;=====================================================
;;VARIABLES MURCIELAGO
;;=====================================================
variacion_murcielagoy:
			DB		1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

datos_murcielago:
			DB		5		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		MURCIELAGO_LIMIZQ	;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		24		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA			;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_murcielago	;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		0		;izq arriba
			DB		0		;izq abajo
			DB		0		;der_arriba
			DB		0		;der_abajo



;;=====================================================
;;VARIABLES LOBO
;;=====================================================
datos_lobo:
			DB		TIPOLOBO		;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		LOBO_LIMIZQ		;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		LOBO_POSY		;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_lobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		LOBO_SPRITE1A	;izq arriba
			DB		LOBO_SPRITE2A	;der_arriba
			DB		LOBO_SPRITE3A	;izq abajo
			DB		LOBO_SPRITE4A	;der_abajo



;;=====================================================
;;VARIABLES JEFELOBO
;;=====================================================
datos_jefelobo:
			DB		TIPOJEFELOBO	;(activo_tipo) si inactivo = 0 si <> 0 es el tipo de enemigo
			DB		0		;(escena) sprite a mostrar 1/2
			DB		00010000b		;(cont_sig_escena) retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
			DB		10		;(energia) energía del enemigo antes de morir
			DB		JEFELOBO_LIMIZQ1;(posx) pos x para mover y punto central del sprite para revisar disparo
			DB		JEFELOBO_POSY	;(posy) pos y para mover y punto central del sprite para revisar disparo
			DB		8		;(radiox) radio x del enemigo para cuando se dispare encima
			DB		8		;(radioy) radio y del enemigo para cuando se dispare encima
			DB		0		;(incx) incremento x para mover
			DB		0		;(inxy) incremento y para mover
			DB		DIRDERECHA		;(direccionx) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(direcciony) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
			DB		0		;(pasos) pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
			DB		0		;(radio) radio para movimientos circulares
			DW		mover_jefelobo		;(ptr_mover) puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
			DB		JEFELOBO_SPRITE1A	;izq arriba
			DB		JEFELOBO_SPRITE2A	;der_arriba
			DB		JEFELOBO_SPRITE3A	;izq abajo
			DB		JEFELOBO_SPRITE4A	;der_abajo


datos_esqueleto:
datos_zombi:
datos_fantasma:
datos_caballerogris:
datos_caballeronegro:
datos_fuego:
datos_magia:		
datos_jefemurcielago:
datos_jefefatasma:
datos_jefezombie:
datos_jefecaballero:
datos_jefebeholder:
datos_manoderecha:
datos_manoizquierda:
datos_conde:

