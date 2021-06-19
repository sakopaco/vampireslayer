;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================	
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
