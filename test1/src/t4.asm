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
	CALL	actualiza_marcador_vidas
	CALL	actualiza_marcador_reliquias
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
	
mira_pinta_vidas:
	LD		 A, (actualiza_vidas_sn)
	OR		 A
	JR		 Z, fin_mira_pinta_vidas
	CALL	pinta_vidas
fin_mira_pinta_vidas:	

mira_pinta_reliquias:
	LD		 A, (actualiza_reliquias_sn)
	OR		 A
	JR		 Z, fin_mira_pinta_reliquias
	CALL	pinta_reliquias
fin_mira_pinta_reliquias:

	CALL	check_player			;MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
	
	CALL	mira_pinta_energia		;actualiza el array de energia siempre pero no pinta eso lo hace pinta_energia
	
	JP		loop_principal
fin_programa_principal:
	RET




;;=====================================================
;;CHECK_PLAYER
;;=====================================================	
; función: 	MIRA EL CONTROL Y APLICA LA LOGICA DE MOVIMIENTO DEL PROTAGONISTA
; entrada: 	-
; salida: 	-
; toca: 	
check_player:
	EXX
	
	XOR		 A
	CALL	GTSTCK
	CP		MUEARR
	CALL	 Z,mueve_arriba
	CP		MUEARRDER
	CALL	 Z,mueve_arriba_derecha
	CP		MUEDER
	CALL	 Z,mueve_derecha
	CP		MUEDERABA
	CALL	 Z,mueve_derecha_abajo
	CP		MUEABA
	CALL	 Z,mueve_abajo
	CP		MUEABAIZQ
	CALL	 Z,mueve_abajo_izquierda
	CP		MUEIZQ
	CALL	 Z,mueve_izquierda
	CP		MUEIZQARR
	CALL	 Z,mueve_izquierda_arriba

	CALL	vuelca_resultado_puntomira_array

	EXX
fin_check_player:
	RET


;;=====================================================
;;MUEVE_ARRIBA
;;=====================================================	
; función: 	decrementa y si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	DEC			 A
	JP			 Z,.no_decrementa_y
	LD			(prota.posy), A
	
.no_decrementa_y:
	POP			AF
fin_mueve_arriba:
	RET
	
	
;;=====================================================
;;MUEVE_ARRIBA_DERECHA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba_derecha:
	PUSH		AF
	
	CALL		mueve_arriba
	CALL		mueve_derecha
	
	POP			AF
fin_mueve_arriba_derecha:
	RET


;;=====================================================
;;MUEVE_DERECHA
;;=====================================================	
; función: 	incrementa si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	INC			 A
	CP			 A, LIMPANTDER - 16
	JP			 Z, .no_incrementa_x
	LD			(prota.posx), A
	
.no_incrementa_x:
	POP			AF
fin_mueve_derecha:
	RET

;;=====================================================
;;MUEVE_DERECHA_ABAJO
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha_abajo:
	PUSH		AF
	
	CALL		mueve_derecha
	CALL		mueve_abajo
	
	POP			AF
fin_mueve_derecha_abajo:
	RET

;;=====================================================
;;MUEVE_ABAJO
;;=====================================================	
; función: 	incrementa y si se no sale de los límites el valor del punto de mira abajo
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	INC			 A
	CP			 A, LIMPANTABA - 16
	JP			 Z,.no_incrementa_y
	LD			(prota.posy), A
	
.no_incrementa_y:
	POP			AF
fin_mueve_abajo:
	RET
	

;;=====================================================
;;MUEVE_ABAJO_IZQUIERDA
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo_izquierda:
	PUSH		AF
	
	CALL		mueve_abajo
	CALL		mueve_izquierda
	
	POP			AF
fin_mueve_abajo_izquierda:
	RET

	
;;=====================================================
;;MUEVE_IZQUIERDA
;;=====================================================	
; función: 	decrementa x si se no sale de los límites el valor del punto de mira a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	DEC			 A
;	CP			 A, LIMPANTIZQ
	JP			 Z,.no_decrementa_x
	LD			(prota.posx), A
	
.no_decrementa_x:
	POP			AF
fin_mueve_izquierda:
	RET


;;=====================================================
;;MUEVE_IZQUIERDA_ARRIBA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda_arriba:
	PUSH		AF
	
	CALL		mueve_izquierda
	CALL		mueve_arriba
	
	POP			AF
fin_mueve_izquierda_arriba:
	RET

;;=====================================================
;;VUELCA_RESULTADO_PUNTOMIRA_ARRAY
;;=====================================================	
; función: 	coloca los valores del punto de mira en la variable array_sprites para ser volcados en VRAM
; entrada: 	-
; salida: 	-
; toca: 	-
vuelca_resultado_puntomira_array:
	PUSH	AF
	
	LD		IX, array_sprites_pm
	;posición y de los dos sprites que conforman el punto de mira
	LD		 A, (prota.posy)
	LD		(IX  ), A
	LD		(IX+4), A
	;posición x de los dos sprites que conforman el punto de mira
	LD		 A, (prota.posx)
	LD		(IX+1), A
	LD		(IX+5), A
	;plano
	LD		(IX+2), 0
	LD		(IX+6), 4	;al ser sprites de 16x16 hay que ir de 4 en 4
	;color
	LD		(IX+3), COLBLANCO
	LD		(IX+7), COLROJO
	
	POP		AF
fin_vuelca_resultado_puntomira_array:
	RET






;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota_vidas),A

	LD		 A, SI	
	LD		(actualiza_vidas_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A, 5
	LD		(prota_reliquias), A
	
	LD		 A, SI	
	LD		(actualiza_reliquias_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

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
