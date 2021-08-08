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

;array para pintar de golpe el marcador de vidas
array_aux_vidas: 		
			DB		0,0,0,0,0,0,0,0

;array para pintar de golpe el marcador de reliquias
array_aux_reliquias:	
			DB		0,0,0,0,0,0,0,0

array_aux_energia:		;array para pintar de golpe el marcador de energía
			DB		16,0,0,0,0,0,0 ;el 16 primero es porque siempre estará pintado el cuadro primero rojo
ultimo_pos_array_aux_energia:
			DB		0			;el array completo es de 8 pero para posicionar sin niecesidad de cálculos  etiqueto este aparte
			
array_aux_mapa_limpiar:	;es por facilitar el reseteo del mapa (pinto 7 lineas en negro con bios) la otra opción es más larga en código y complicada aunque más rápida
			DB		0,0,0,0,0,0,0

actualiza_puertas_sn:	;0 no 1 sí (se pone a 1 cuando se cambia de habitación y al terminar se vuelve a poner a 0)
			DB		0 	;valor que indica si hay que actualizar las puertas de una pantalla (se crea porque sólo hay que actualizar si se cambia a de hab)
			
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


;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
array_sprites:
array_sprites_pm:				DS	2 * 4
array_sprites_enem:				DS	30 * 4
lista_enemigos:					DS	10 * ESTRUCTURA_ENEMIGO
; puntero al array a pintar en VRAM
puntero_array_atrib_array_VRAM: DW	0	;ARRAYSPTRIES + 8


