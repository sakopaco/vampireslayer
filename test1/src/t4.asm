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
	
		;toca A
limpia_pantalla:
	XOR			A
	CALL 		CLS
fin_limpia_pantalla:
	;toca A y direcciones #F3E9/#F3EA/#F3EB
set_color:
	LD		 A,2				;verde oscuro
	LD 		(FORCLR),A
	LD		 A,1				;negro
	LD 		(BAKCLR),A
	LD		 A,1				;negro
	LD 		(BDRCLR),A
	CALL	CHGCLR  
fin_set_color:
	
	;cambiamos a SCREEN 2,2 del BASIC
	;toca A
	LD		 A,2
	CALL	CHGMOD			;selecciona screen 2
	
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
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================		
	include "estructuras.asm"
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
	include "sprites.asm"
	
	include "habitaciones.asm"
	
;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
tiles_patrones_pantalla:	incbin "pan1_23.til.bank0.bin.chr"
tiles_color_pantalla:		incbin "pan1_23.til.bank0.bin.clr"
tiles_mapa_pantalla:		incbin "pan1_23.map.bank0.bin"
	

END:
