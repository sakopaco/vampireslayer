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

	CALL	localiza_info_habitacion	;devuelve variable habitacion_actual 	

	LD		 A,1
	CALL	posiciona_en_mapa		;se le pasa A 1 (tile del prota) está el prota y prota.poxx y posy
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
	
	CALL	render_sprites			;actualiza array de sprites y los pinta en pantalla
	
	CALL	pinta_energia			;pinta la energia en pantalla

mira_pinta_puertas:
	LD		 A,(actualiza_puertas_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_puertas
	
	;primero preparo la pantalla como si no hubiera puertas
	CALL 	pinta_parte_superior_pantalla
	
	CALL	pinta_puertas
fin_mira_pinta_puertas:

	CALL	check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
	CALL	mira_pinta_energia		;meter esto dentro de pinta_energia ;actualiza el array de energia siempre pero no pinta eso lo hace pinta_energia
	
	JP		loop_principal
fin_programa_principal:
	;RET



;;=====================================================
;;EFECTO_IMAGEN_TIRA_RELIQUIA
;;=====================================================	
; función: 	hace que el fondo de la pantalla parpadee N veces
; entrada: 	actualiza_reliquias_sn
; salida: 	-
; toca: 	todo
efecto_imagen_tira_reliquia:
	LD		 A, 20;RETARDOREL
	LD		 B, A

.parpadea_fondo:
	PUSH	BC
	LD		HL, color_bomba1
	CALL	color_pantalla
	
	;~ PUSH	BC
	;~ LD		 A, 255
	;~ LD		 B, A
;~ .bucle_de_espera:
	;~ NOP
	;~ DJNZ	 .bucle_de_espera
	;~ POP		BC
	HALT

	
	LD		HL, color_bomba2
	CALL	color_pantalla
	POP		BC
	DJNZ	.parpadea_fondo
	
	LD		HL, color_base
	JP		color_pantalla
fin_efecto_imagen_tira_reliquia:
	;CALL/RET






;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota_vidas),A

	LD		 A, 4
	LD		(prota_reliquias), A

	LD		 A, 100
	LD		(prota_energia), A

	LD		 A, 1
	LD		(prota_nivel), A		;nivel empieza en 0 para usar las posiciones ascii
	
	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles

	LD		 A, 0				;los niveles son 7 del 0 al 6
	LD		(prota_pos_mapy), A	;pos y dentro del nivel (se empieza en 0)

	LD		 A, 3				;columnas 7 del 0 al 6
	LD		(prota_pos_mapx), A	;pos y dentro del nivel (se empieza en 0)
	
	;************************************************
	;importante : revisar pintado de mapa

	LD			 A, 1 
	LD			(actualiza_puertas_sn), A;(1 actualiza y 0 no actualiza puertas)
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
