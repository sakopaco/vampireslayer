	output 	"variables.dat"

;se posiciona el siguiente codigo (variables en la página 3)
	ORG		#C000

;;=====================================================
;;DEFINICIÓN DE VARIABLES GENERALES
;;=====================================================

include "constantesyvariables/constantes.asm"
include "constantesyvariables/constantesenemigos.asm"
include "constantesyvariables/estructuras.asm"

;variables globales del prota
prota_nivel:				DB		0			;nivel del castillo donde está 0-6
prota_vidas:				DB		0
prota_reliquias:			DB		3
prota_pos_mapx:				DB		0			;pos columna
prota_pos_mapy:				DB		0			;pos fila
prota_energia:				DB		250
;array para pintar de golpe el marcador de vidas
array_aux_vidas: 			DB		0,0,0,0,0,0,0,0
;;RELIQUIAS
array_aux_reliquias:		DB		0,0,0,0,0,0,0,0	;array para pintar de golpe el marcador de reliquias
;;ENERGIA
array_aux_energia:								;array para pintar de golpe el marcador de energía
							DB		16,0,0,0,0,0,0	;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
							DB		0			;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte

;;MAPA	
array_aux_mapa_limpiar:		DB		0,0,0,0,0,0,0	;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
elemento_pintar_mapa:		DB		0			;TILEPROTAM = 19, ;TILEGRISM = 9
			
;;DECORACION PAREDES
antorchas:					DS		ESTRUCTURA_ANTORCHA
array_antorcha:				DB		197,198,199	;fuego + madera1 + madera2

esqueletos:					DS		ESTRUCTURA_ESQUELETO
array_esqueleto:			DB		194, 0, 195, 160, 164, 161, 0, 163, 0, 193, 162, 192
lista_escenas_calavera:		DB		164, 165, 164, 166
var_aux_calavera			DB		0			;flip_calavera_esqueletos


;; parte de los enemigos
; para movmiento
heartbeat					DB		0;			;reloj central que moverá los enemigos

;;SPRITES GENERAL (PROTA +  ENEMIGOS)
;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:			DS		 2 * 4		;el punto de mira siempre tiene 2 sprites
array_sprites_enem:			DS		30 * 4		;resto de sprites


;;=====================================================
;;VARIABLES AYUDAS
;;=====================================================
hay_ayudas_en_pantalla		DB	0		;1 => hay / 0 => no hay; variable que se actualiza cuando cambiemos de habitación para no mirar el bit de habitación cada vez

puntero_ayuda_actual:		DW	0		;puntero a ayuda que se muestra en pantalla (sólo se muestra una a la vez)

lista_ayudas:
ayuda_oracion:				DS		ESTRUCTURA_AYUDA		
ayuda_cruz:					DS		ESTRUCTURA_AYUDA
ayuda_aguabendita:			DS		ESTRUCTURA_AYUDA
ayuda_armadura:				DS		ESTRUCTURA_AYUDA
ayuda_planta:				DS		ESTRUCTURA_AYUDA
ayuda_vidaextra				DS		ESTRUCTURA_AYUDA
ayuda_ballesta:				DS		ESTRUCTURA_AYUDA


;;=====================================================
;;VARIABLES PINTA PANTALLAS + PUERTAS
;;=====================================================
;pinta_parte_superior_pantalla
tiles_patrones:				DW		0
tiles_colores:				DW		0
tiles_mapa:					DW		0

;pinta_array
wordaux1:					DW		0		;almacena la posición en el tilemap 0 al 675
wordaux2:					DW		0		;almacena puntero a array de tiles (posiciones en realidad) a pintar (posiciones repetidas en los 2 primeros bancos)
byteaux1:					DB		0		;nº filas Registro D
byteaux2:					DB		0		;nº columnas Registro E


lista_puertas:
puerta_arriba:				DS		ESTRUCTURA_PUERTA
puerta_derecha:				DS		ESTRUCTURA_PUERTA
puerta_abajo:				DS		ESTRUCTURA_PUERTA
puerta_izquierda:			DS		ESTRUCTURA_PUERTA
puerta_escalera:			DS		ESTRUCTURA_PUERTA


;;=====================================================
;;VARIABLES PUNTO MIRA
;;=====================================================
dano_actual:				DB		2		;daño actual cuando el prota dispara

puntomira:					DS		ESTRUCTURA_PUNTOMIRA


;;=====================================================
;;VARIABLES HABITACIONES
;;=====================================================
	include "datos/habitaciones.asm"


;;=====================================================
;;VARIABLES ENEMIGOS
;;=====================================================
enemigo1					DS	ESTRUCTURA_ENEMIGO
enemigo2					DS	ESTRUCTURA_ENEMIGO
enemigo3					DS	ESTRUCTURA_ENEMIGO
enemigo4					DS	ESTRUCTURA_ENEMIGO
enemigo5					DS	ESTRUCTURA_ENEMIGO
enemigo6					DS	ESTRUCTURA_ENEMIGO
enemigo7					DS	ESTRUCTURA_ENEMIGO

