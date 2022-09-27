;;=====================================================
;;DEFINICIÓN DE HABITACIONES x NIVEL
;;=====================================================	

; sólo voy a usar 7x7 pero como los arrays son lineales y voy a trabajar con matrices
; me interesa que seande  8x8 aunque sólo trabaje con 7x7

; ojo... la primera linea corresponderá a la primera linea del castillo no a la última

;; definición de estructura de bits
;16 bits por habitación

;NOTA: no es necesario asignar un bit para la puerta de arriba ya que en las habitaciones de la fila 7 sólo habrá una puerta que será una escalera
;1º byte
;~ 7 - sin asignar
;~ 6 - si 1 => hay ayudas 0 => no hay ayudas (se inicializan al empezar la partida)
;~ 5 - esqueletos
;~ 4 - SI enemigos => 0 y NO enemigos 1 => toca la variable "habitacion_terminada" (se inicializan al empezar la partida)
;(relacionado con la variable -- habitacion_terminada)
;~ 0,1,2,3 - nº puertas 1 arriba 1 derecha 1 abajo 1 izquierda
;2º byte
;~ 7 - oracion
;~ 6 - cruz
;~ 5 - agua bendita
;~ 4 - armadura
;~ 3 - planta
;~ 2 - vida extra
;~ 1 - ballesta
;~ 0 - antorchas

;importante: el byte de la columna 15 indicará con 1 y 0 habitaciones por las que se haya pasado
;cuando se inicie la partida todos se pondrán a 0
;por ejemplo 01000000b se ha pasado por la hab. 2 de esa fila en el nivel que sea


habitaciones_juego:
habitaciones_nivel0:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00011010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel1:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel2:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel3:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel4:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel5:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00001100b,00000000b,00000101b,00000000b,00001111b,00000000b,00000101b,00000000b,00001001b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00001010b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00001110b,10000000b,00000001b,00000000b,00000000b,00000000b,00000100b,00000000b,00001011b,00000100b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000110b,00000000b,00000101b,00000000b,00001101b,00000000b,00000101b,00000000b,00000011b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7
	
habitaciones_nivel6:
			;0		0'		   1        1'         2         2'         3        3'        4         4'       5         5'        6         6'
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00001010b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 1
	db 00000000b,00000000b,00000000b,00000000b,00000100b,00000000b,00001111b,00000000b,00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000100b,00000000b,00001111b,00000000b,00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000100b,00000000b,00001111b,00000000b,00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000100b,00000000b,00001111b,00000000b,00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000100b,00000000b,00001111b,00000000b,00000001b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 
	db 00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000010b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,00000000b,#00,#00 ;nivel 0 fila 7

