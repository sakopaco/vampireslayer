;;textos que aparecen en pantalla

IF	1=1
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
