;;=====================================================
;;SUBRUTINAS PARA SONIDOS
;;=====================================================	


;;=====================================================
;;INICIALIZA_REPLAYER_EFECTOS_INTERRUPCIONES
;;=====================================================	
; función: 	inicializa: replayer de música, player de efectos e interrupciones
; entrada: 	HL  se le pasa cuando se llama a esta función y equivale a la melodía
; salida: 	-
; toca: 	HL, A
; nota importante: esta parte de código es del curso de ensamblador
;;por D. Fernando García (@BitVision) (al que siempre le estaré agradecido)
;;su difusión depende de su consentimiento o por lo menos de su mención como autor
;-----------------------------------------------------------
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
;fin_inicializa_replayer_efectos_interrupciones:
	RET


;;=====================================================
;;NUESTRA_ISR
;;=====================================================	
; función: 	envía datos al PSG + toca un trozo de música + toca trozo de 
; entrada: 	-
; salida: 	-
; toca: 	HL, A
; nota importante: esta parte de código es del curso de ensamblador
;;por D. Fernando García (@BitVision) (al que siempre le estaré agradecido)
;;su difusión depende de su consentimiento o por lo menos de su mención como autor
subrutina_isr:
		CALL	PT3_ROUT			;envia los datos a los registros del PSG
.musica:
		LD		 A, (musica_activa)	;si musica inactiva
		OR		 A
		JP		 Z, .efectos_sonido
			CALL	PT3_PLAY		;calcula el siguiente 'trocito' de musica que sera enviado al proxima vez
.efectos_sonido:
		;
		JP		ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
;fin_subrutina_isr:
	
	
;;=====================================================
;;PLAY_MUSICA
;;=====================================================	
; función: 	toca la música que se le idique
; entrada: 	A
			;A=0 musica off
			;A=2 musica jefe
			;A=3 musica gameover
play_musica:
		LD			(musica_activa), A
		OR			 A
		JP			NZ, .mira_musica_normal
		CALL		PT3_MUTE
		RET

.mira_musica_normal:
		CP			MUSICANORMAL
		JP			NZ, .mira_musica_jefe
		LD			HL, musica_normal-99			; hl <- initial address of module - 99
		JP			.fin_mira_posibles_musicas

.mira_musica_jefe:
		CP			MUSICAJEFE
		JP			NZ, .mira_musica_gameover
		LD			HL, musica_boss-99			; hl <- initial address of module - 99
		JP			.fin_mira_posibles_musicas
		
.mira_musica_gameover:	;si no es usica normal ni jefe es gameover MUSICAGAMEOVER = 3
		LD			HL, musica_gameover-99			; hl <- initial address of module - 99
		
.fin_mira_posibles_musicas:
		JP			inicializa_replayer_efectos_interrupciones
;fin_play_musica:


;;=====================================================
;;TOCA_MUSICA_SEGUN_CORRESPONDA
;;=====================================================	
; función: mira qué música debe tocar durate el juego normal/enemigo (no la de gameover)
toca_musica_segun_corresponda:
;si dracula_muerto
			;si dracula está muerto siempre suena la canción de jefe
			LD			 A, (dracula_muerto) 
			OR			 A
			JR			NZ, .musica_jefe
			
;otras_posibilidades
			;si no es habitación de jefe (prota_pos_mapy = 6) => suena múscia normal
			LD			 A, (prota_pos_mapy) 
			CP			 6
			JR			NZ, .musica_normal
			
			;lo que queda es que sea habitación de jefe
			;pero si la habitación está terminada suene musica normal
			CALL		localiza_info_habitacion
			LD			 A, (habitacion_terminada)
			OR			 A
			JR			 Z, .musica_jefe
			
.musica_normal:
			LD			 A, MUSICANORMAL
			CALL		play_musica
			RET
			
.musica_jefe:
			LD			 A, MUSICAJEFE
			CALL		play_musica
			RET
;fin_toca_musica_segun_corresponda:


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
	incbin "sfx2.afb"
	
musica_normal:
	incbin "ingame7.99"
	
musica_gameover:
	incbin "death2.99"
	
musica_boss:
	incbin "boss.99"
