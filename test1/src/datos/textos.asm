;;=====================================================
;;CONTANTES TEXTOS
;;=====================================================

IF	1=0	; 1=1 versión en español y 1=0 verión en inglés
;textos en español
texto_vidas:		DB	'V','I','D','A','S'

texto_energia:		DB	'E','N','E','R','G','.'

texto_reliquias:	DB	'R','E','L','I','Q','.'

texto_nivel:		DB	'N','I','V','E','L'

texto_entrefases:
texto_entrefases1:	DB	' ',' ','E','S','P','E','R','A','S',' ','U','N',' ','M','O','M','E','N','T','O',' ','E','N',' ','L','A','S',' ',' ',' '	; 30 caracteres
texto_entrefases2:	DB  'E','S','C','A','L','E','R','A','S',' ','M','I','E','N','T','R','A','S',' ','T','U','S',' ','O','J','O','S',' ',' ',' '	; 30 caracteres
texto_entrefases3:	DB  'S','E',' ','A','C','O','S','T','U','M','B','R','A','N','V',' ','A',' ','L','A',' ','O','S','C','U','R','I','D','A','D'	; 30 caracteres
texto_entrefases4:	DB  'Y',' ','E','L',' ','H','O','R','R','O','V','R',' ','Q','U','E',' ','T','E',' ','E','S','P','E','R','A','.',' ',' ',' '	; 30 caracteres

texto_iniciar:		DB	' ',' ','P','U','L','S','A',' ','F','U','E','G','O',' ','P','A','R','A',' ','C','O','M','E','N','Z','A','R',' ',' ',' '	;30 caracteres

ELSE		
;textos en inglés
texto_vidas:		DB	'L','I','V','E','S'

texto_energia:		DB	'E','N','E','R','G','Y'

texto_reliquias:	DB	'R','E','L','I','C','S'

texto_nivel:		DB	'L','E','V','E','L'

texto_entrefases:
texto_entrefases1:	DB	' ',' ','Y','O','U',' ','W','A','I','T',' ','F','O','R',' ','A',' ','M','O','M','E','N','T',' ','O','N',' ','T','H','E'	; 30 caracteres
texto_entrefases2:	DB  'S','T','A','I','R','S',' ','W','H','I','L','E',' ','Y','O','U','R',' ','E','Y','E','S',' ','A','D','J','U','S','T',' '	; 30 caracteres
texto_entrefases3:	DB  'T','O',' ','T','H','E',' ','D','A','R','K','N','E','S','S',' ','A','N','D',' ','T','H','E',' ','H','O','R','R','O','R'	; 30 caracteres
texto_entrefases4:	DB  'T','H','A','T',' ','A','W','A','I','T','S',' ','Y','O','U','.',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '	; 30 caracteres

texto_iniciar:		DB	'P','U','S','H',' ','T','R','I','G','G','E','R',' ','T','O',' ','S','T','A','R','T',' ','T','H','E',' ','G','A','M','E'

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
		LD			HL, texto_vidas		;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 5				;nº posiciones a pintar
		LD			DE, TILMAP + 577	;destino en vram
		JP			LDIRVM
fin_pinta_texto_vida:

pinta_texto_energia:
		LD			HL, texto_energia	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 6				;nº posiciones a pintar
		LD			DE, TILMAP + 641	;destino en vram
		JP			LDIRVM
fin_pinta_texto_energia:

pinta_texto_reliquias:
		LD			HL, texto_reliquias	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 6				;nº posiciones a pintar
		LD			DE, TILMAP + 705	;destino en vram
		JP			LDIRVM
fin_pinta_texto_reliquias:

pinta_texto_nivel:
		LD			HL, texto_nivel		;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 5				;nº posiciones a pintar
		LD			DE, TILMAP + 626	;destino en vram
		JP			LDIRVM
fin_pinta_texto_nivel:

pinta_texto_entrefases:
		LD			HL, texto_entrefases1;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 192	;destino en vram
		CALL		LDIRVM
		
		LD			HL, texto_entrefases2;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 256	;destino en vram
		CALL		LDIRVM
		
		LD			HL, texto_entrefases3;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 320	;destino en vram
		CALL		LDIRVM
		
		LD			HL, texto_entrefases4;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 384	;destino en vram
		JP			LDIRVM
fin_pinta_texto_entrefases:


pinta_textos_inicio:
		;pinta texto pulsa disparo
		LD			HL, texto_iniciar	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 32 * 16;destino en vram
		CALL		LDIRVM
		
fin_pinta_textos_inicio:
		RET
