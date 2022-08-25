;;=====================================================
;;CONTANTES TEXTOS
;;=====================================================

IF	1=0	; 1=1 versión en español y 1=0 verión en inglés
;textos en español
texto_vidas:
				DB	'V','I','D','A','S'
texto_energia:
				DB	'E','N','E','R','G','.'
texto_religuias:
				DB	'R','E','L','I','Q','.'
texto_nivel:
				DB	'N','I','V','E','L'
ELSE		
;textos en inglés
texto_vidas:
				DB	'L','I','V','E','S'
texto_energia:
				DB	'E','N','E','R','G','Y'
texto_religuias:
				DB	'R','E','L','I','C','S'
texto_nivel:
				DB	'L','E','V','E','L'
ENDIF


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;PINTA_PARTE_TEXTO_VIDA
;;=====================================================	
;~ BC - Block length
;~ DE - Start address of VRAM
;~ HL - Start address of memory
;~ LD			HL,texto_vidas		;guardo puntero al array a pintar (como psar por referencia)
;~ LD			BC, 5				;nº posiciones a pintar
;~ LD			DE, TILMAP + 577	;destino en vram (posición en pantalla 0 -> 768 -1
pinta_texto_vida:
		LD			HL,texto_vidas		;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 5				;nº posiciones a pintar
		LD			DE, TILMAP + 577	;destino en vram
		JP			LDIRVM
fin_pinta_texto_vida:

pinta_texto_energia:
		LD			HL,texto_energia	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 6				;nº posiciones a pintar
		LD			DE, TILMAP + 641	;destino en vram
		JP			LDIRVM
fin_pinta_texto_energia:

pinta_texto_reliquias:
		LD			HL,texto_religuias	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 6				;nº posiciones a pintar
		LD			DE, TILMAP + 705	;destino en vram
		JP			LDIRVM
fin_pinta_texto_reliquias:

pinta_texto_nivel:
		LD			HL,texto_nivel		;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 5				;nº posiciones a pintar
		LD			DE, TILMAP + 626	;destino en vram
		JP			LDIRVM
fin_pinta_texto_nivel:


