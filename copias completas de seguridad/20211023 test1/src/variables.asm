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


lista_ayudas:
ayuda_oracion:		DS		ESTRUCTURA_AYUDA		
ayuda_cruz:			DS		ESTRUCTURA_AYUDA
ayuda_aguabendita:	DS		ESTRUCTURA_AYUDA
ayuda_armadura:		DS		ESTRUCTURA_AYUDA
ayuda_planta:		DS		ESTRUCTURA_AYUDA
ayuda_vidaextra		DS		ESTRUCTURA_AYUDA
ayuda_ballesta:		DS		ESTRUCTURA_AYUDA

;datos ayudas
datos_oracion:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_oracionon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_oracionoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSORACION		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSORACIONX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_oracion	;subrutina que indica la acción si se dispara en el objeto						8,9
datos_cruz:
				;~ DB    	0				;0 no activo <>0 activo															0
				;~ DW		array_cruzon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				;~ DW		array_cruzoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				;~ DB		POSCRUZ			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				;~ DB		POSCRUZX		;pos del pixel central (esquina superior + 8x)									6
				;~ DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				;~ DW		accion_cruz		;subrutina que indica la acción si se dispara en el objeto						8,9 
				
				DB    	0				;0 no activo <>0 activo															0
				DW		array_cruzon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_cruzoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		167			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		64		;pos del pixel central (esquina superior + 8x)									6
				DB		112		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_cruz		;subrutina que indica la acción si se dispara en el objeto						8,9 
				
datos_aguabendita:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_aguaon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_aguaoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSAGUA			;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSAGUAX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_agua		;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16    
datos_armadura:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_armaduraon;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_armaduraoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSARMAD		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSARMADX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_armadura	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16    
datos_planta:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_plantaon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_plantaoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSPLANTA		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSPLANTAX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_planta	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16     
datos_vidaextra:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_extraon	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_extraoff	;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSVIDAEXT		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSVIDAEXTX		;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_vidaextra;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16     
datos_ballesta:
				DB    	0				;0 no activo <>0 activo															0
				DW		array_ballestaon;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				1,2
				DW		array_ballestaoff;pos en memoria ver array_ayudas de cómo se mostrarán (wordaux2)				3,4
				DB		POSBALLESTA		;pos en pantalla (memoria en el banco 1 se le suma 256 + TILEMAP) (wordaux1)	5
				DB		POSBALLESTAX	;pos del pixel central (esquina superior + 8x)									6
				DB		POSAYUDASY		;pos del pixel central (esquina superior + 8y) (para toas igual)				7
				DW		accion_oracion	;subrutina que indica la acción si se dispara en el objeto						8,9
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16    
				DB		0	;relleno																		10-16   
				DB		0	;relleno																		10-16      





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
array_extraon:				DB	240,242
array_extraon1:				DB	241,243
array_extraoff:				DB	244,246
array_extraoff1:			DB	245,247
array_ballestaon:			DB	248,250
array_ballestaon1:			DB	249,251
array_ballestaoff:			DB	252,254
array_ballestaoff1:			DB	253,255

antorchas:			DS		ESTRUCTURA_ANTORCHA
array_antorcha:				DB	197,198,199	;fuego + madera1 + madera2

esqueletos:			DS		ESTRUCTURA_ESQUELETO
array_esqueleto:			DB	194, 0, 195, 160, 164, 161, 0, 163, 0, 193, 162, 192
lista_escenas_calavera:		DB	164, 165, 164, 166




;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:				DS	2 * 4
array_sprites_enem:				DS	30 * 4
lista_enemigos:					DS	10 * ESTRUCTURA_ENEMIGO
; puntero al array a pintar en VRAM
puntero_array_atrib_array_VRAM: DW	0	;ARRAYSPTRIES + 8




