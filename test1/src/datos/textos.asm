;;=====================================================
;;CONTANTES TEXTOS
;;=====================================================

IF	1=1	; 1=1 versión en español y 1=0 verión en inglés
;textos en español
texto_vidas:		DB	'VIDAS'

texto_energia:		DB	'ENERG.'

texto_reliquias:	DB	'RELIQ.'

texto_nivel:		DB	'NIVEL'

texto_entrefases:
texto_entrefases1:	DB	'  ESPERAS UN MOMENTO EN LAS   '	; 30 caracteres
texto_entrefases2:	DB  'ESCALERAS MIENTRAS TUS OJOS   '	; 30 caracteres
texto_entrefases3:	DB  'SE ACOSTUMBRAN A LA OSCURIDAD '	; 30 caracteres
texto_entrefases4:	DB  'Y EL HORROR QUE TE ESPERA.    '	; 30 caracteres

texto_iniciar:		DB	'   PULSA FUEGO PARA COMENZAR  '	;30 caracteres

texto_vidamenos:	DB 	'VIGILA TUS VIDAS'	;16 caracteres

texto_gameover:		DB	'HAS MUERTO'	;10 caracteres
texto_gameover1A:	DB	'VIVIRAS PARA SIEMPRE COMO UN'	;29 caracteres
texto_gameover1B:	DB	'ZOMBI. SER ESCLAVO DE DRACULA'	;29 caracteres
texto_gameover1C:	DB	'        SERA TU FIN.         ' ;29 caracteres

texto_finalbueno:
texto_finalbueno1:	DB	'TRAS ACABAR CON EL VAMPIRO JEFE ';32 caracteres
texto_finalbueno2:	DB	'LA ENERGIA QUE MANTENIA CASTILLO';32 caracteres
texto_finalbueno3:	DB	'Y ENEMIGOS DESAPARECE Y LOS     ';32 caracteres
texto_finalbueno4:	DB	'SEPULTA PARA SIEMPRE. ESTAS     ';32 caracteres
texto_finalbueno5:	DB	'EXTENUADO TRAS LA VICTORIA. DAS ';32 caracteres
texto_finalbueno6:	DB	'LA CHICA A SU PADRE Y RECIBES TU';32 caracteres
texto_finalbueno7:	DB	'MERECIDA RECOMPENSA.            ';32 caracteres
texto_finalbueno8:	DB	'TE HAS CONVERTIDO EN UNA LEYENDA';32 caracteres

texto_finalmalo:
texto_finalmalo1:	DB	'                                ';32 caracteres
texto_finalmalo2:	DB	'NO FUISTE SUFICIENTEMENTE RAPIDO';32 caracteres
texto_finalmalo3:	DB	'TRAS ACABAR CON EL VAMPIRO JEFE ';32 caracteres
texto_finalmalo4:	DB	'LA ENERGIA QUE MANTENIA CASTILLO';32 caracteres
texto_finalmalo5:	DB	'Y ENEMIGOS DESAPARECE. MARITZA Y';32 caracteres
texto_finalmalo6:	DB	'TU CAEIS SEPULTADOS BAJO LOS    ';32 caracteres
texto_finalmalo7:	DB	'ESCOMBROS.                      ';32 caracteres
texto_finalmalo8:	DB	'                                ';32 caracteres

texto_deaddracula:
texto_deaddracula1:	DB	'FELICIDADES. VENCISTE A DRACULA ';32 caracteres
texto_deaddracula2:	DB	'Y RESCATASTE A LA CHICA. PERO   ';32 caracteres
texto_deaddracula3:	DB	'NO ES EL FINAL. EL PODER DEL    ';32 caracteres
texto_deaddracula4:	DB	'VAMPIRO MANTENIA EN PIE EL      ';32 caracteres
texto_deaddracula5:	DB	'CASTILLO. DEBES ESCAPAR ANTES   ';32 caracteres
texto_deaddracula6:	DB	'DE QUE DERRUMBE SOBRE VUESTRAS  ';32 caracteres
texto_deaddracula7:	DB	'CABEZAS. ESTO AUN NO HA ACABADO.';32 caracteres
texto_deaddracula8:	DB	'                                ';32 caracteres

ELSE		
;textos en inglés
texto_vidas:		DB	'LIVES'

texto_energia:		DB	'ENERGY'

texto_reliquias:	DB	'RELICS'

texto_nivel:		DB	'LEVEL'

texto_entrefases:
texto_entrefases1:	DB	'  YOU WAIT FOR A MOMENT ON THE'	; 30 caracteres
texto_entrefases2:	DB  'STAIRS WHILE YOUR EYES ADJUST '	; 30 caracteres
texto_entrefases3:	DB  'TO THE DARKNESS AND THE HORROR'	; 30 caracteres
texto_entrefases4:	DB  'THAT AWAITS YOU.              '	; 30 caracteres

texto_iniciar:		DB	' PUSH TRIGER TO START THE GAME'

texto_vidamenos:	DB 	'WATCH YOUR LIVES'	;16 caracteres

texto_gameover:		DB	'GAME OVER '	;10 caracteres
texto_gameover1A:	DB	' YOU WILL LIVE FOREVER LIKE  '	;29 caracteres
texto_gameover1B:	DB	'A ZOMBI. BEING DRACULAS SLAVE'	;29 caracteres
texto_gameover1C:	DB	'        WILL BE YOUR END     ' ;29 caracteres

texto_finalbueno:
texto_finalbueno1:	DB	'AFTER FINISHING THE VAMPIRE     ';32 caracteres
texto_finalbueno2:	DB	'BOSS THE ENERGY THAT MAINTAINED ';32 caracteres
texto_finalbueno3:	DB	'THE CASTLE AND ENEMIES          ';32 caracteres
texto_finalbueno4:	DB	'DISAPPEARS AND BURIES THEM      ';32 caracteres
texto_finalbueno5:	DB	'FOREVER YOU ARE EXHAUSTED AFTER ';32 caracteres
texto_finalbueno6:	DB	'THE VICTORY. YOU GIVE THE GIRL  ';32 caracteres
texto_finalbueno7:	DB	'TO HER FATHER AND RECEIVE YOUR  ';32 caracteres
texto_finalbueno8:	DB	'DESERVED REWARD. YOU RE A LEGEND';32 caracteres

texto_finalmalo:
texto_finalmalo1:	DB	'                                ';32 caracteres
texto_finalmalo2:	DB	'YOU WERE NOT FAST ENOUGHT       ';32 caracteres
texto_finalmalo3:	DB	'AFTER FINISHING THE BOSS VAMPIRE';32 caracteres
texto_finalmalo4:	DB	'THE ENERGY THAT MAINTAINED THE  ';32 caracteres
texto_finalmalo5:	DB	'CASTLE AND ENEMIES DISAPPEARED  ';32 caracteres
texto_finalmalo6:	DB	'YOU AND MARITZA ARE BURIED DOWN ';32 caracteres
texto_finalmalo7:	DB	'UNDER TONS OF RUBBLE            ';32 caracteres
texto_finalmalo8:	DB	'                                ';32 caracteres

texto_deaddracula:
texto_deaddracula1:	DB	'CONGRATULATIONS. YOU BEAT       ';32 caracteres
texto_deaddracula2:	DB	'DRACULA AND YOU RESCUED THE     ';32 caracteres
texto_deaddracula3:	DB	'GIRL. BUT IT IS NOT THE END.    ';32 caracteres
texto_deaddracula4:	DB	'THE POWER OF VAMPIRE KEPT THE   ';32 caracteres
texto_deaddracula5:	DB	'CASTLE. YOU MUST ESCAPE BEFORE  ';32 caracteres
texto_deaddracula6:	DB	'IT COLLAPSES ON YOU HEADS       ';32 caracteres
texto_deaddracula7:	DB	'THIS IS NOT OVER YET.           ';32 caracteres
texto_deaddracula8:	DB	'                                ';32 caracteres

ENDIF

texto_autoria:		DB	'SEAMSOFT  2022' ; 14 caracteres
texto_iniciar_blanco:	DB	'                              '


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


pinta_textos_inicio_disparo:
		;pinta texto pulsa disparo
		LD			HL, texto_iniciar	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 32 * 16;destino en vram
		JP			LDIRVM
fin_pinta_textos_inicio_disparo:


pinta_textos_inicio_disparo_blanco:
		;pinta texto blanco
		LD			HL, texto_iniciar_blanco	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 30				;nº posiciones a pintar
		LD			DE, TILMAP + 32 * 16;destino en vram
		JP			LDIRVM
fin_pinta_textos_inicio_disparo_blanco:

		
pinta_textos_inicio_autoria:	
		;pinta autoría
		LD			HL, texto_autoria	;guardo puntero al array a pintar (como psar por referencia)
		LD			BC, 14				;nº posiciones a pintar
		LD			DE, TILMAP + 32 * 23 + 8;destino en vram
		JP			LDIRVM
fin_pinta_textos_inicio_autoria:



















