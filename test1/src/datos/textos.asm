;;=====================================================
;;CONTANTES TEXTOS
;;=====================================================

;1=1 versión en español y 2=2 verión en inglés y 3 = 3 versión portugues
IF	1=0	;textos en español
texto_vidas:		DB	'VIDAS'

texto_energia:		DB	'ENERG.'

texto_reliquias:	DB	'RELIQ.'

texto_nivel:		DB	'NIVEL'

texto_instruc:		
texto_instruc1:		DB	'MATA A TODOS LOS ENEMIGOS PARA  '
texto_instruc2:		DB	'ATRAVESAR LAS PUERTAS ELLOS DAN '
texto_instruc3:		DB	'SU VIDA PARA DEFENDER A SU AMO  '

texto_entrefases:
texto_entrefases1:	DB	'  ESPERAS UN MOMENTO EN LAS   '	; 30 caracteres
texto_entrefases2:	DB  'ESCALERAS MIENTRAS TUS OJOS   '	; 30 caracteres
texto_entrefases3:	DB  'SE ACOSTUMBRAN A LA OSCURIDAD '	; 30 caracteres
texto_entrefases4:	DB  'Y EL HORROR QUE TE ESPERA.    '	; 30 caracteres

texto_iniciar:		DB	'   PULSA FUEGO PARA COMENZAR  '	;30 caracteres

texto_vidamenos:	DB 	'VIGILA TUS VIDAS'	;16 caracteres

texto_gameover:		DB	'HAS MUERTO'	;10 caracteres
texto_gameover1A:	DB	'VIVIRAS PARA SIEMPRE COMO UN '	;29 caracteres
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

texto_graciasporjugar:	DB	'GRACIAS POR JUGAR '

ENDIF

IF	2=0 ;textos en inglés
texto_vidas:		DB	'LIVES'

texto_energia:		DB	'ENERGY'

texto_reliquias:	DB	'RELICS'

texto_nivel:		DB	'LEVEL'

texto_instruc:		
texto_instruc1:		DB	'KILL ALL THE ENEMIES TO PASS    '
texto_instruc2:		DB	'THROUGH THE GATES THEY WILL GIVE'
texto_instruc3:		DB	'THEIR LIFE TO DEFEND THEIR MASTR'

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

texto_graciasporjugar:	DB	'THANKS FOR PLAYING'

ENDIF

IF	3=3	;textos en portugues
texto_vidas:        	DB    'VIDAS'

texto_energia:        	DB    'ENERG.'

texto_reliquias:    	DB    'RELIQ.'

texto_nivel:        	DB    'NIVEL'

texto_instruc:
texto_instruc1:        	DB    'MATAM TODOS OS INIMIGOS PARA    '
texto_instruc2:        	DB    'ATRAVESSAR OS PORTOES DAO A VIDA'
texto_instruc3:        	DB    'PARA DEFENDER O SEU MESTRE      '

texto_entrefases:
texto_entrefases1:    	DB    'ESPERA UM MOMENTO NAS ESCADAS '  ; 30 caracteres 
texto_entrefases2:    	DB    'ENQUANTO OS SEUS OLHOS SE     '    ; 30 caracteres
texto_entrefases3:    	DB    'ADAPTAM A ESCURIDAO E AO      '    ; 30 caracteres
texto_entrefases4:    	DB    'HORROR QUE O ESPERA.          '    ; 30 caracteres

texto_iniciar:        	DB    '    PREMIR FOGO PARA INICIAR  ' ;30 caracteres+

texto_vidamenos:    	DB    'UMA VIDA A MENOS'    ;16 caracteres +

texto_gameover:        	DB    'MORRESTE. '    ;10 caracteres+
texto_gameover1A:    	DB    ' VIVERAS PARA SEMPRE COMO UM '   ;29 caracteres+
texto_gameover1B:    	DB    '   ZOMBIE. SER ESCRAVO DE    '   ;29 caracteres+
texto_gameover1C:    	DB    '   DRACULA SERA O TEU FIM.   ' 	;29 caracteres+

texto_finalbueno:
texto_finalbueno1:    	DB    'DEPOIS DE ACABAR COM O VAMPIRO  ';32 caracteres
texto_finalbueno2:    	DB    'CHEFE A ENERGIA QUE MANTINHA O  ';32 caracteres
texto_finalbueno3:    	DB    'CASTELO E OS INIMIGOS JUNTOS DES';32 caracteres
texto_finalbueno4:    	DB    'APARECE E ENTERRA-OS PARA SEMPRE';32 caracteres
texto_finalbueno5:    	DB    'ESTAS EXAUSTO APOS A VITORIA  EN';32 caracteres
texto_finalbueno6:    	DB    'TREGAS A RAPARIGA AO SEU PAI E  ';32 caracteres
texto_finalbueno7:    	DB    'RECEBES A TUA MERECIDA RECOMPNSA';32 caracteres
texto_finalbueno8:    	DB    'TORNASTE-TE UMA LENDA           ';32 caracteres

texto_finalmalo
texto_finalmalo1:    	DB    'NAO FOSTE SUFICIENTEMENTE       ';32 caracteres
texto_finalmalo2:    	DB    'RAPIDO. DEPOIS DE ELIMINARES O  ';32 caracteres
texto_finalmalo3:    	DB    'VAMPIRO CHEFE A ENERGIA QUE     ';32 caracteres
texto_finalmalo4:    	DB    'MANTINHA O CASTELO E OS INIMIGOS';32 caracteres
texto_finalmalo5:    	DB    'UNIDOS DESAPARECE. TU E A       ';32 caracteres
texto_finalmalo6:    	DB    'MARITZA FICAM ENTERRADOS DEBAIXO';32 caracteres
texto_finalmalo7:    	DB    'DOS ESCOMBROS.                  ';32 caracteres
texto_finalmalo8:   	DB    '                                ';32 caracteres

texto_deaddracula:
texto_deaddracula1:    	DB    'PARABENS. DERROTARAM O DRACULA  ';32 caracteres
texto_deaddracula2:    	DB    'E SALVARAM A RAPARIGA. MAS ISTO ';32 caracteres
texto_deaddracula3:    	DB    'NAO E O FIM. O PODER DO VAMPIRO ';32 caracteres
texto_deaddracula4:    	DB    'MANTEVE O CASTELO DE PE. TEM DE ';32 caracteres
texto_deaddracula5:    	DB    'ESCAPAR ANTES QUE ELE CAIA SOBRE';32 caracteres
texto_deaddracula6:    	DB    'AS VOSSAS CABECAS.              ';32 caracteres
texto_deaddracula7:    	DB    '     ISTO AINDA NAO ACABOU.     ';32 caracteres
texto_deaddracula8:    	DB    '                                ';32 caracteres

texto_graciasporjugar:  DB    'OBRIGADO POR JOGAR'

ENDIF


;NOMBRE DE ENEMIGOS
nombre_jefes:
nombre_jefe_lobo:		DB	'VERFARKAS'
nombre_jefe_murcielago:	DB	' DENEVER '
nombre_jefe_fantasma:	DB	' SZELLEM '
nombre_jefe_zombi:		DB	'ELOHALOTT'
nombre_jefe_caballero:	DB	'URIEMBER '
nombre_jefe_beholder:	DB	'SZEMLELO '
nombre_jefe_dracula:	DB	'TANITVANY'


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



















