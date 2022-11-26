
;;=====================================================
;;SUBRUTINAS PARA SONIDOS
;;=====================================================	

;;=====================================================
;;INICIALIZA_REPLAYER_EFECTOS_INTERRUPCIONES
;;=====================================================	
; función: 	inicializa: replayer de música, player de efectos e interrupciones
; entrada: 	-
; salida: 	-
; toca: 	HL, A
inicializa_replayer_efectos_interrupciones:
		DI

		;inicializacion de replayer musical
		LD		HL, song-99			; hl <- initial address of module - 99
		CALL	PT3_INIT			; Inits PT3 player
		
		;inicializacion del reproductor de efectos sonoros
		LD		HL, sfx_bank
		CALL	ayFX_SETUP
	
		;Engancha nuestra rutina de servicio al gancho que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
		LD		A, #C3
		LD		[H.TIMI], A
		LD		HL, subrutina_isr
		LD		[H.TIMI+1], HL
	
		EI		;optimizacion:
				;piensa que las dos ultimas lineas podrian haber sido: 
				;ei						;primero ei
				;ld		[H.TIMI+1],hl	;luego este ld
										;PENSAR (y consultar ) PORQUE!!!!
fin_inicializa_replayer_efectos_interrupciones:
	RET


;;=====================================================
;;NUESTRA_ISR
;;=====================================================	
; función: 	envía datos al PSG + toca un trozo de música + toca trozo de 
; entrada: 	-
; salida: 	-
; toca: 	HL, A
subrutina_isr:
		CALL	PT3_ROUT			;envia los datos a los registros del PSG
		CALL	PT3_PLAY			;calcula el siguiente 'trocito' de musica que sera enviado al proxima vez
		JP		ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
fin_subrutina_isr:
	;RET


;;=====================================================
;;SUBRUTINA_ISR_FX
;;=====================================================	
; función: 	nos vale como para apagar sonido
; entrada: 	-
; salida: 	-
; toca: 	-
subrutina_isr_fx:
		CALL		PT3_ROUT			;envia los datos a los registros del PSG
		JP			ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
fin_subrutina_isr_fx:


;;=====================================================
;;NUESTRA_ISR_FX
;;=====================================================	
; función: 	sustituye la función de la interrupción por una función vacía
; entrada: 	-
; salida: 	-
; toca: 	-
enciende_sonido_solofx:		
		CALL		PT3_MUTE
		
		DI

		;inicializacion del reproductor de efectos sonoros
		LD		HL, sfx_bank
		CALL	ayFX_SETUP
	
		;Engancha nuestra rutina de servicio al gancho que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
		LD		A, #C3
		LD		[H.TIMI], A
		LD		HL, subrutina_isr_fx
		LD		[H.TIMI+1], HL
	
		EI		;optimizacion:
fin_enciende_sonido_solofx:
		RET


play_musica_jefe:
		DI

		;inicializacion de replayer musical
		LD		HL, musica_boss-99	; hl <- initial address of module - 99
		CALL	PT3_INIT			; Inits PT3 player
		
		;inicializacion del reproductor de efectos sonoros
		LD		HL, sfx_bank
		CALL	ayFX_SETUP
		;Engancha nuestra rutina de servicio al gancho que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
		LD		A, #C3
		LD		[H.TIMI], A
		LD		HL, subrutina_isr
		LD		[H.TIMI+1], HL
	
		EI		;optimizacion:
			;piensa que las dos ultimas lineas podrian haber sido: 
			;ei						;primero ei
			;ld		[H.TIMI+1],hl	;luego este ld
									;PENSAR (y consultar ) PORQUE!!!
fin_musica_jefe:
		RET


play_musica_gameover:		
		DI

		;inicializacion de replayer musical
		LD		HL, musica_gameover-99			; hl <- initial address of module - 99
		CALL	PT3_INIT			; Inits PT3 player
	
		;Engancha nuestra rutina de servicio al gancho que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
		LD		A, #C3
		LD		[H.TIMI], A
		LD		HL, subrutina_isr
		LD		[H.TIMI+1], HL
	
		EI		;optimizacion:
				;piensa que las dos ultimas lineas podrian haber sido: 
				;ei						;primero ei
				;ld		[H.TIMI+1],hl	;luego este ld
										;PENSAR (y consultar ) PORQUE!!!!
fin_play_musica_gameover:
		RET
		

play_musica_apropiada:	
		;está muerto dracula?
		LD				 A, (dracula_muerto)
		OR				 A
		JP				 Z, .dracula_NO_esta_muerto
		CALL			play_musica_jefe
		RET
		
		;SI música jefe
.dracula_NO_esta_muerto:	;musica normal
		CALL			inicializa_replayer_efectos_interrupciones
		RET
fin_play_musica_apropiada:


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
subrutinas_sonido:
	include	"PT3-ROM_sjasm.asm"
	include "ayFX-ROM_sjasm.asm"
	

;;=====================================================
;;DEFINICIÓN DE CANCIONES Y EFECTOS DE SONIDO
;;=====================================================		
song:
	incbin "ingame7.99"
	
sfx_bank:
	incbin "sfx.afb"
	
musica_gameover:
	incbin "death2.99"
	
musica_boss:
	incbin "boss.99"
