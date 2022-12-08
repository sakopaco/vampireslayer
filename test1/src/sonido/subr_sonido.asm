
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
		
		LD		 A, (PT3_SETUP)
		AND		11111110b
		LD		(PT3_SETUP), A

		;inicializacion de replayer musical
		;LD		HL, song-99			; hl <- initial address of module - 99
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
.musica:
		LD		 A, (musica_activa)	;si musica inactiva
		OR		 A
		JP		 Z, .efectos_sonido
			CALL	PT3_PLAY		;calcula el siguiente 'trocito' de musica que sera enviado al proxima vez
.efectos_sonido:
		JP		ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
fin_subrutina_isr:
	


;	entrada: A
play_musica_apropiada:		
		;A=0 musica normal
		;A=1 musica jefe
		;A=2 musica gameover
.mira_musica_normal:
		OR			 A
		JP			NZ, .mira_musica_jefe
		LD			HL, musica_normal-99			; hl <- initial address of module - 99
		JP			.fin_mira_posibles_musicas
.mira_musica_jefe:
		CP			MUSICAJEFE
		JP			NZ, .mira_musica_gameover
		LD			HL, musica_boss-99			; hl <- initial address of module - 99
		JP			.fin_mira_posibles_musicas
.mira_musica_gameover:	;si no es usica normal ni jefe es gameover
		LD			HL, musica_gameover-99			; hl <- initial address of module - 99
.fin_mira_posibles_musicas:
		JP			inicializa_replayer_efectos_interrupciones
fin_play_musica_apropiada:


musica_on:
		;incializacion de replayer con interrupciones
		PUSH		AF
		LD			 A, 1
		LD			(musica_activa), A	;musica off... sólo fx
		POP			AF
		JP			play_musica_apropiada
fin_musica_on:
musica_off:
		;incializacion de replayer con interrupciones
		XOR			 A
		LD			(musica_activa), A	;musica off... sólo fx
		JP			play_musica_apropiada
fin_musica_off:


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
subrutinas_sonido:
	include	"PT3-ROM_sjasm.asm"
	include "ayFX-ROM_sjasm.asm"
	

;;=====================================================
;;DEFINICIÓN DE CANCIONES Y EFECTOS DE SONIDO
;;=====================================================		
sfx_bank:
	incbin "sfx.afb"
	
musica_normal:
	incbin "ingame7.99"
	
musica_gameover:
	incbin "death2.99"
	
musica_boss:
	incbin "boss.99"
