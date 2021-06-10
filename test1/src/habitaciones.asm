;;=====================================================
;;DEFINICIÓN DE HABITACIONES x NIVEL
;;=====================================================	

; sólo voy a usar 7x7 pero como los arrays son lineales y voy a trabajar con matrices
; me interesa que seande  8x8 aunque sólo trabaje con 7x7

; ojo... la primera linea corresponderá a la primera linea del castillo no a la última

;; definición de estructura de bits
;~ Tipo DW
;~ 0 - lleno o vacío (si ya se ha pasado)
;~ 0000 - nº puertas 1 arriba 1 derecha 1 abajo 1 izquierda
;~ 1 - hay reliquia?
;~ 1 - hay vida extra?
;~ 1 - hay arma extra (durará 6 pantallas - sonido distinto)
;~ 1 - hay energía? (sobran bits ... se puede usar otro como carga energía +)
;~ 1 - es pantalla final?
;~ 1 - es pantalla inicial (equivaldría a la puerta de un castillo)?
;~ 1 - es pantalla de mostruo fin de fase?


habitaciones:

habitaciones_nivel1:
;--------------------* habitación inicial
	dw  #00,#00,#00,#1F,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel2:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel3:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel4:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel5:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel6:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
habitaciones_nivel7:
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(primera fila)
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00
	dw  #00,#00,#00,#00,#00,#00,#00,#00 ;(última fila)
	
