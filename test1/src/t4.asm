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

;	CALL	pinta_energía
;	CALL	pinta_pantalla -> CALL pinta_puertas
	
fin_inicializa_variables_pruebas:
	RET




;;=====================================================
;;PINTA ENERGIA
;;=====================================================	
; función: 	actualiza el nivel de energia en la parte de puntuación
; nota:		el cuadrado más bajo de ejergía siempre estará pintado... se obviará
; entrada: 	prota.energia, array_aux_energia
; salida: 	-
; toca:		HL,DE,BC
pinta_energia:
	PUSH	HL						;por si acaso guardo el contenido de HL (si veo que no es necesario guardarlo lo quito)
	LD		 A,(prota.energia)
	LD		 B,A
	
	LD		HL,ultimo_pos_array_aux_energia	;coloco puntero en array e iré incrementando

pinta_ener:	
pinta_ener_8:
	AND		11110000b
	CP		11110000b
	JR		NZ,pinta_ener_8_no	
pinta_ener_8_si:
	LD		(HL),14					;tile banco 3 color verde
	JR		pinta_ener_7
pinta_ener_8_no:


fin_pinta_ener:	
	POP		HL
fin_pinta_energia:
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


;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	
END:
