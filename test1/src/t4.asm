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
	
loop_principal:
	
	NOP
	
	JP		loop_principal
	
	RET

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
inicializa_variables_pruebas:
	LD		 A,2			;hay vida cero y se pinta como una vida para facilitar cálculos
	LD		(prota.vidas),A

	LD		 A,3
	LD		(prota.reliquias),A

	LD		 A,250
	LD		(prota.energia),A

	XOR		 A
	LD		(prota.nivel),A
	
	LD		 A,#04			;fila 0 columna 4
	LD		(prota.pos_nivel),A

;	CALL	pinta_vidas
;	CALL	pinta_reliquias
;	CALL	pinta_energía
;	CALL	pinta_pantalla -> CALL pinta_puertas
	
fin_inicializa_variables_pruebas:
	RET

;;=====================================================
;;PINTA_VIDAS
;;=====================================================	
pinta_vidas:
	
fin_pinta_vidas:
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
; pasar a fichero aparte
;definicion de variable del prota usando la estructura del punto de mira
prota:		ESTRUCTURA_PUNTOMIRA


;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	
END:
