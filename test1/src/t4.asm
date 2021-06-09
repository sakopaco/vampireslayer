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
	
	
		;cargamos los patrones
	LD		HL,tiles_patrones_pantalla
	LD		DE,#0000
	LD		BC,256*8*1
	CALL	LDIRVM		
	
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla
	LD		DE,#1800
	LD		BC,256*1
	CALL	LDIRVM
	
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla
	LD		DE,#2000
	LD		BC,256*8*1
	CALL	LDIRVM
	
loop_principal:
	
	NOP
	
	JP		loop_principal
	
	RET

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================		
	include "subrutinas.asm"
	
	
;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================		
	include "estructuras.asm"
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
	include "sprites.asm"
	
	include "habitaciones.asm"
	
nivel:		DB		0
pos_nivel:	DB		0	;como es una matriz de 8x8 (aunque sólo use 7x7) se usa el bytealto para fila y el byte bajo para columna
vidas:		DB		0
reliquias:	DB		0

	
;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	


END:
