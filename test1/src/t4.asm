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
	CALL	sub_preparapantalla
	
	;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
	CALL	inicializa_variables_pruebas
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	; una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	actualiza_marcador_vidas
	CALL	actualiza_marcador_reliquias
	CALL	pinta_nivel
	
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
mira_pinta_vidas:
	LD		 A,(actualiza_vidas_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_vidas
	CALL	pinta_vidas
fin_mira_pinta_vidas:	

mira_pinta_reliquias:
	LD		 A,(actualiza_reliquias_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_reliquias
	CALL	pinta_reliquias
fin_mira_pinta_reliquias:
	
	NOP
		
	JP		loop_principal
	
	RET

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"

; sólo para hacer pruebas y pinter la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A,3
	LD		(prota.vidas),A

	LD		 A,SI	
	LD		(actualiza_vidas_sn),A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A,2
	LD		(prota.reliquias),A
	
	LD		 A,SI	
	LD		(actualiza_reliquias_sn),A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A,250
	LD		(prota.energia),A

	LD		 A,5
	LD		(prota.nivel),A		; nivel empieza en 0 para usar las posiciones ascii
	
	LD		 A,#04			;fila 0 columna 4
	LD		(prota.pos_nivel),A

;	CALL	pinta_vidas
;	CALL	pinta_reliquias
;	CALL	pinta_energía
;	CALL	pinta_pantalla -> CALL pinta_puertas
	
fin_inicializa_variables_pruebas:
	RET



;;=====================================================
;;ACTUALIZA_MARCADOR_RELIQUIAS
;;=====================================================	
; función: 	actualiza buffer de reliquias
; entrada: 	prota.reliquias
; salida: 	array_aux_reliquias
; toca:		A,B,HL
;~ actualiza_marcador_reliquias:
	;~ ;para no andar restando pongo todos los huecos a negro y luego en otro bucle las reliquias
	;~ ;1-pinto todo en blanco
	;~ LD		HL,array_aux_reliquias
	;~ LD		 B,NMAXVIDREL
;~ loop_marcador_reliquias_negro:	;asignar espacios en negro
	;~ LD		(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	;~ INC		HL
	;~ DJNZ	loop_marcador_reliquias_negro
;~ fin_loop_marcador_reliquias_negro:
	;~ ;2-pinto las cruces según el n de reliquias
	;~ LD		HL,array_aux_reliquias
	;~ LD		 A,(prota.reliquias)
	;~ LD		 B,A
;~ loop_marcador_reliquias: ;asignar reliquias
	;~ LD		(HL),POSRELIMAP	;17 posición mapa tiles para reliquia
	;~ INC		HL
	;~ DJNZ	loop_marcador_reliquias
;~ fin_loop_marcador_reliquias:
;~ fin_actualiza_marcador_reliquias:


actualiza_marcador_reliquias:
	;~ ;para no andar restando pongo todos los huecos a negro y luego en otro bucle las caras
	;~ ;1-pinto todo en blanco
	;~ LD		HL,array_aux_reliquias
	;~ LD		 B,NMAXVIDREL
;~ loop_marcador_reliquias_negro:	;asignar espacios en negro
	;~ LD		(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	;~ INC		HL
	;~ DJNZ	loop_marcador_reliquias_negro
;~ fin_loop_marcador_reliquias_negro:
	;2-pinto las caras según el n de vidas
	LD		IX,array_aux_reliquias
	LD		(IX),15
	LD		(IX+1),15
	LD		(IX+2),15
	LD		(IX+3),15
	LD		(IX+4),15
	
	
fin_loop_marcador_reliquias:
fin_actualiza_marcador_reliquias:

	RET



;;=====================================================
;;PINTA_RELIQUIAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para que en el próximo refresco se pinten y actualiza_reliquias
; entrada: 	array_aux_reliquias
; salida: 	actualiza_reliquias_sn
; toca:		BC,HL,DE
pinta_reliquias:
	LD		HL,array_aux_reliquias
	LD		DE,SC2MAP + POSRELIQ 	;inicio posición en el mapa de tiles de las vidas
	LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	CALL	LDIRVM
	
	;una vez quer está pintada ya no se actualizará a menos que ganemos/gastemos una reliquia
	XOR		 A
	LD		(actualiza_reliquias_sn),A
fin_pinta_reliquias:
	RET
	
	
	
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
	
; pasar a fichero aparte
;definicion de variable del prota usando la estructura del punto de mira
prota:		ESTRUCTURA_PUNTOMIRA




;(no sé si es útil) actualiza_vidas_sn:
;			DB		0 ;valor que indica si hay que actualizar el marcador de energía 1 ó no 0
;fin_actualiza_vida_sn:

;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	
END:
