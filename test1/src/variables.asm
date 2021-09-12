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

;definicion de variable del prota usando la estructura del punto de mira
prota:		ESTRUCTURA_PUNTOMIRA
;variables globales del prota
prota_nivel:			;nivel del castillo donde está 0-6
			DB		0
prota_vidas:
			DB		0
prota_reliquias:
			DB		3
prota_pos_mapx:
			DB		0	;pos columna
prota_pos_mapy:
			DB		0	;pos fila
prota_energia:
			DB		250

;array para pintar de golpe el marcador de vidas
array_aux_vidas: 		
			DB		0,0,0,0,0,0,0,0

;array para pintar de golpe el marcador de reliquias
array_aux_reliquias:	
			DB		0,0,0,0,0,0,0,0

array_aux_energia:					;array para pintar de golpe el marcador de energía
			DB		16,0,0,0,0,0,0 	;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
			DB		0				;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte
			
array_aux_mapa_limpiar:	;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
			DB		0,0,0,0,0,0,0
elemento_pintar_mapa:
			DB		0	;TILEPROTAM = 19, ;TILEGRISM = 9
			
;; nota importante: cada vez que se cambie de nivel se actualizará el contenido
;; arrays con mapa de tiles de las puertas
array_puerta_arriba:
array_puerta_arriba1:		DB	3,1,1,3
array_puerta_arriba2:		DB	1,1,1,1
array_puerta_arriba3:		DB	1,1,1,1
array_puerta_arriba4:		DB	1,1,1,1
array_puerta_arriba5:		DB	1,1,1,1

array_puerta_derecha:
array_puerta_derecha1:		DB	1,3,3
array_puerta_derecha2:		DB	1,1,3
array_puerta_derecha3:		DB	1,1,1
array_puerta_derecha4:		DB	1,1,1
array_puerta_derecha5:		DB	1,1,1
array_puerta_derecha6:		DB	2,1,1
array_puerta_derecha7:		DB	4,2,1
	
array_puerta_abajo:			DB	1,1,1,1

array_puerta_izquierda:
array_puerta_izquierda1:	DB	3,3,1
array_puerta_izquierda2:	DB	3,1,1
array_puerta_izquierda3:	DB	1,1,1
array_puerta_izquierda4:	DB	1,1,1
array_puerta_izquierda5:	DB	1,1,1
array_puerta_izquierda6:	DB	1,1,2
array_puerta_izquierda7:	DB	1,2,4

;array con posiciones pseudoaleatorias de ayudas y extras (qué valor se escogerá con R 0-127 + and 00001111)
;+256 porque aparecerán todas en el banco1
pos_ayudas:					DB	0,4,18,23,45,69,73,82,90,152,171,180,190,192,198,208

;array de ayudas
array_ayudas:
array_oracionon:			DB	200,202
array_oracionon1:			DB	202,203
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
array_extraon:				DB	240,242
array_extraon1:				DB	241,243
array_extraoff:				DB	244,246
array_extraoff1:			DB	245,247
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


;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:				DS	2 * 4
array_sprites_enem:				DS	30 * 4
lista_enemigos:					DS	10 * ESTRUCTURA_ENEMIGO
; puntero al array a pintar en VRAM
puntero_array_atrib_array_VRAM: DW	0	;ARRAYSPTRIES + 8





