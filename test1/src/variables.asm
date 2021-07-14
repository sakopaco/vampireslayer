;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================	
;definicion de variable del prota usando la estructura del punto de mira
prota:		ESTRUCTURA_PUNTOMIRA

array_aux_vidas: 		;array para pintar de golpe el marcador de vidas
			DB		0,0,0,0,0,0,0,0
actualiza_vidas_sn:
			DB		0 	;valor que indica si hay que actualizar el marcador de vidas 1 ó no 0

array_aux_reliquias:	;array para pintar de golpe el marcador de reliquias
			DB		0,0,0,0,0,0,0,0
actualiza_reliquias_sn:
			DB		0 	;valor que indica si hay que actualizar el marcador de reliquias 1 ó no 0

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

array_sprites:			;array de 4 bytes x 32 sprites posibles en pantalla que sobreescribirá la tabla de sprites actualizando VRAM
;valores (Y 0-255 SC2   X 0-191 SC2  Nº_sps 0-255 simples y 0-63 2x2 col 0-15)
sprite_pos1:				DB 210,	0,	0,	0	;plano 0
sprite_pos2:				DB 210,	0,	1,	0	;plano 1
sprite_pos3:				DB 210,	0,	2,	0	;plano 2
sprite_pos4:				DB 210,	0,	3,	0	;plano 3
sprite_pos5:				DB 210,	0,	4,	0	;plano 4
sprite_pos6:				DB 210,	0,	5,	0	;plano 5
sprite_pos7:				DB 210,	0,	6,	0	;plano 6
sprite_pos8:				DB 210,	0,	7,	0	;plano 7
sprite_pos9:				DB 210,	0,	8,	0	;plano 8
sprite_pos10:				DB 210,	0,	9,	0	;plano 9
sprite_pos11:				DB 210,	0,	10,	0	;plano 10
sprite_pos12:				DB 210,	0,	11,	0	;plano 11
sprite_pos13:				DB 210,	0,	12,	0	;plano 12
sprite_pos14:				DB 210,	0,	13,	0	;plano 13
sprite_pos15:				DB 210,	0,	14,	0	;plano 14
sprite_pos16:				DB 210,	0,	15,	0	;plano 15
sprite_pos17:				DB 210,	0,	16,	0	;plano 16
sprite_pos18:				DB 210,	0,	17,	0	;plano 17
sprite_pos19:				DB 210,	0,	18,	0	;plano 18
sprite_pos20:				DB 210,	0,	19,	0	;plano 19
sprite_pos21:				DB 210,	0,	20,	0	;plano 20
sprite_pos22:				DB 210,	0,	21,	0	;plano 21
sprite_pos23:				DB 210,	0,	22,	0	;plano 22
sprite_pos24:				DB 210,	0,	23,	0	;plano 23
sprite_pos25:				DB 210,	0,	24,	0	;plano 24
sprite_pos26:				DB 210,	0,	25,	0	;plano 25
sprite_pos27:				DB 210,	0,	26,	0	;plano 26
sprite_pos28:				DB 210,	0,	27,	0	;plano 27
sprite_pos29:				DB 210,	0,	28,	0	;plano 28
sprite_pos30:				DB 210,	0,	29,	0	;plano 29
sprite_pos31:				DB 210,	0,	30,	0	;plano 30
sprite_pos32:				DB 210,	0,	31,	0	;plano 31
