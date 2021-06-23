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
			
array_puerta3_no:
			DB		0,0,0,0
array_puerta3_si:
			DB		1,1,1,1			
