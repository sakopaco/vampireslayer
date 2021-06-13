;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================	
array_aux_vidas: 		;array para pintar de golpe el marcador de vidas
			DB		POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP
fin_array_aux_vidas:
actualiza_vidas_sn:
			DB		0 ;valor que indica si hay que actualizar el marcador de vidas 1 ó no 0
fin_actualiza_vidas_sn:

array_aux_reliquias: 		;array para pintar de golpe el marcador de reliquias
			DB		POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP,POSCARAMAP 
fin_array_aux_reliquias:
actualiza_reliquias_sn:
			DB		0 ;valor que indica si hay que actualizar el marcador de reliquias 1 ó no 0
fin_actualiza_reliquias_sn:
