	OUTPUT	"t4.bin"
	
;;=====================================================
;;DEFINICIÓN DE CONSTANTES
;;=====================================================	
	include "constantes.asm"

;;=====================================================
;;DEFINICIÓN DE CABECERA DE ARCHIVO BIN
;;=====================================================		
	include "cabecerabin.asm"
	
START:
	;incializacion de replayer con interrupciones
	CALL	inicializa_replayer_efectos_interrupciones
	
	
	;inicializa pantalla y entonrno
	CALL	sub_preparapantalla			;screen 2,2 sin click al pulsar tecla y color 16,1,1
	
	;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
	CALL	inicializa_variables_pruebas
	
	;inicializa los niveles por partida
	CALL	inicializa_niveles			;no es necesario parametrizarlo según el nivel del usuario ya que se cargan todos
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa 
	
	;carga sprites en memoria (SE HA RETRASADO HASTA PARAMETRIZAR LA CARGA DE PANTALLAS)
	CALL 	carga_patrones_sprites_nivel1
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	;una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	pinta_vidas
	CALL 	pinta_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa
	CALL	pinta_puertas	

	LD		 A, TILEPROTAM
	LD		(elemento_pintar_mapa), A
	CALL	posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.poxx y posy
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
	
	CALL	render_sprites			;actualiza array de sprites y los pinta en pantalla
	
	CALL	pinta_energia			;pinta la energia en pantalla

	CALL	check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
	JP		loop_principal
fin_programa_principal:
	;RET



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

	;~ ;salva actual rutina en H.KEYI
	;~ LD	DE,OLDINT	; get address of old int. hook saved area
	;~ LD	HL,H.TIMI	; get address of interrupt entry hook
	;~ LD	BC,5		; lenght of hook is 5 bytes
	;~ LDIR			; transfer
	
	;Engancha nuestra rutina de servicio al gancha que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
	LD		A, #C3
	LD		[H.TIMI], A
	LD		HL, nuestra_isr
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
nuestra_isr:
	CALL	PT3_ROUT			;envia los datos a los registros del PSG
	CALL	PT3_PLAY			;calcula el siguiente 'trocito' de musica que sera enviado al proxima vez
	JP		ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
fin_nuestra_isr:
	;RET




;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota_vidas),A

	LD		 A, 4
	LD		(prota_reliquias), A

	LD		 A, 100
	LD		(prota_energia), A

	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles
	
	LD		 A, 4				;los niveles (matrices) son 7 del 0 al 6
	LD		(prota_nivel), A	;nivel empieza en 0 para usar las posiciones ascii

	LD		 A, 6				;los subniveles (filas) son 7 del 0 al 6
	LD		(prota_pos_mapy), A	;pos Y dentro del nivel (se empieza en 0)

	LD		 A, 2				;columnas 7: del 0 al 6
	LD		(prota_pos_mapx), A	;pos X dentro del nivel (se empieza en 0)
	
fin_inicializa_variables_pruebas:
	RET
;;************************************************************************









;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
	include "subr_pintapantalla.asm"
	
	include "subr_sprites.asm"
	
	include "subr_teclado_joy.asm"
	

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
;Este include lleva la rutina de descompresión de ROM/RAM a VRAM de pletter
;Está adaptada de la original a sjasm
;	HL = RAM/ROM source	; DE = VRAM destination
depack_VRAM:
	include "PL_VRAM_Depack_SJASM.asm"

subrutinas_sonido:
	include	"PT3-ROM_sjasm.asm"
	include "ayFX-ROM_sjasm.asm"
	
;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================		
	include "estructuras.asm"
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
	include "sprites.asm"
	
	include "habitaciones.asm"
	
	include "variables.asm"
	
;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"

;;=====================================================
;;DEFINICIÓN DE CANTIONES Y EFECTOS DE SONIDO
;;=====================================================		
song:
	incbin "bloodytears_castlevania.99"
	
sfx_bank:
	incbin "demo.afb"
	
END:
