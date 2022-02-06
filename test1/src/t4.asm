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
	;inicializa pantalla y entonrno
	CALL	sub_preparapantalla			;screen 2,2 sin click al pulsar tecla y color 16,1,1
	
	;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
	CALL	inicializa_variables_pruebas
	
	;carga los patrones de los sprites de los enemigos según el nivel
	CALL	inicializa_enemigos_fase0
	
	;inicializa el punto de mira
	CALL	inicializa_punto_mira
	
	;inicializa los niveles por partida
	CALL	inicializa_niveles			;no es necesario parametrizarlo según el nivel del usuario ya que se cargan todos

	;inicializa los valores de cada puerta excepto si están activas o no (eso ocurre cuando se matan todos los enemigos de la hab. y sólo a las puertas que se muestren)
	CALL	inicializa_puertas
	
	;inicializa las estructuras de forma particular según ayuda pero sin poner valores de posición
	CALL	inicializa_ayudas
	
	;inicializa las estructuras de las antorchas y esqueletos
	CALL	inicializa_antorchas
	CALL	inicializa_esqueletos
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa
	
	;carga sprites en memoria (SE HA RETRASADO HASTA PARAMETRIZAR LA CARGA DE PANTALLAS)
	CALL 	carga_patrones_sprites_nivel
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	;una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	pinta_vidas
	CALL 	pinta_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa
	CALL	pinta_puertas

	LD		 A, TILEPROTAM
	LD		(elemento_pintar_mapa), A
	CALL	posiciona_en_mapa		;se le pasa elemento_pintar_mapa (tile del prota) está el prota y prota.posx y posy
	
	CALL	pinta_energia
	
	CALL	pinta_ayudas_habitacion
	
	CALL	pinta_extra_fondo
	
	;esta función no va aquí sino en check colisiones pero se pone aquí para realizar pruebas
	CALL	terminada_habitacion_recorrida ;para cuando se maten todos los enemigos de la habitación

	;incializacion de replayer con interrupciones
;	CALL	inicializa_replayer_efectos_interrupciones

loop_principal:
	HALT							;espera VBLANK y sincroniza
	
	CALL	render_sprites			;actualiza array de sprites y los pinta en pantalla
	
	CALL	actualiza_elementos_fondo;como antorchas o esqueletos
	
	CALL	check_enemigos_fase0	;examina los enemigos por pantalla y los pone e su sitio

	CALL	check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
	; incrementa el hearbeat para el movimiento de los enemigos
	LD		 A, (heartbeat)
	INC		 A
	LD		(heartbeat), A
	
	JP		loop_principal
fin_programa_principal:
	;no necesita RET





;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota_vidas),A

	LD		 A, 7
	LD		(prota_reliquias), A

	LD		 A, 25							
	LD		(prota_energia), A

	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles
	
	LD		 A, 0				;los niveles (matrices) son 7 del 0 al 6
	LD		(prota_nivel), A	;nivel empieza en 0 para usar las posiciones ascii

	LD		 A, 0				;los subniveles (filas) son 7 del 0 al 6
	LD		(prota_pos_mapy), A	;pos Y dentro del nivel (se empieza en 0)

	LD		 A, 3				;columnas 7: del 0 al 6
	LD		(prota_pos_mapx), A	;pos X dentro del nivel (se empieza en 0)
	
	LD		(is_habitacion_terminada), A
fin_inicializa_variables_pruebas:
	RET
;;************************************************************************



inicializa_enemigos_fase0:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
.nivel0:
		LD			 A, (prota_pos_mapy)
		SUB			 A, 7
		JP			NC, .nivel1
		CALL		inicializa_enemigos_fase0_nivel0
.nivel1:		
fin_inicializa_enemigos:
		RET


check_enemigos_fase0: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		;~ LD			IX, enemigo1
		;~ LD			 A, (IX)
		;~ OR			 A
		;~ JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		LD			(IY + 0), 100
		LD			(IY + 1), 100
		
		LD		 A, (heartbeat)
		LD			(IY + 2), A
		
		;LD			(IY + 2), 24
		LD			(IY + 3), 4
		
		CALL		test_OK
		
		
		
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posx)
		;~ LD			(IY + 1), A
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.posy)
		;~ LD			(IY + 2), A
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.sprite_1a)
		;~ LD			(IY + 3), A
		;~ LD			 A, (IX + ESTRUCTURA_ENEMIGO.color1)

		
.check_enemigo2:
.check_enemigo3:
.check_enemigo4:
.check_enemigo5:
.check_enemigo6:
.check_enemigo7:
.check_enemigo8:
.check_enemigo9:
fin_check_enemigos_fase0:
		RET			



;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
	include "subr_general.asm"
	
	include "subr_pintapantalla.asm"
	
	include "subr_puntomira.asm"
	
	include "subr_puertas.asm"
	
	include "subr_sprites.asm"
	
	include "subr_enemigos.asm"
	
	include "subr_teclado_joy.asm"
	
	include "subr_sonido.asm"
	
	include "subr_ayudas.asm"
	

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS DE FERNANDO PARA COMPRESIÓN Y SONIDO
;;=====================================================
;Este include lleva la rutina de descompresión de ROM/RAM a VRAM de pletter
;Está adaptada de la original a sjasm
;	HL = RAM/ROM source	; DE = VRAM destination
depack_VRAM:
	include "PL_VRAM_Depack_SJASM.asm"


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


END:
