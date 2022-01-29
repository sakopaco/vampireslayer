;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================

;Colores base de la pantalla
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

;array para pintar de golpe el marcador de reliquias
array_aux_reliquias:	
			DB		0,0,0,0,0,0,0,0

array_aux_energia:								;array para pintar de golpe el marcador de energía
			DB		16,0,0,0,0,0,0 				;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
			DB		0							;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte
			
array_aux_mapa_limpiar:							;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
			DB		0,0,0,0,0,0,0
elemento_pintar_mapa:
			DB		0							;TILEPROTAM = 19, ;TILEGRISM = 9
			
;; nota importante: cada vez que se cambie de nivel se actualizará el contenido

antorchas:			DS		ESTRUCTURA_ANTORCHA
array_antorcha:				DB	197,198,199		;fuego + madera1 + madera2

esqueletos:			DS		ESTRUCTURA_ESQUELETO
array_esqueleto:			DB	194, 0, 195, 160, 164, 161, 0, 163, 0, 193, 162, 192
lista_escenas_calavera:		DB	164, 165, 164, 166

;; parte de los enemigos
; para movmiento
heartbeat			DB		0;					;reloj central que moverá los enemigos


;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:				DS	2 * 4
array_sprites_enem:				DS	30 * 4
lista_enemigos:					DS	10 * ESTRUCTURA_ENEMIGO
; puntero al array a pintar en VRAM
puntero_array_atrib_array_VRAM: DW	0	;ARRAYSPTRIES + 8





