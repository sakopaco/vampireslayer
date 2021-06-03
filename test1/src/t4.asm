	OUTPUT	"t4.bin"
	
;;=====================================================
;;DEFINICIÓN DE CONSTANTES
;;=====================================================	

	include "constantes.asm"
	
	include "cabecerabin.asm"
	
START:
	LD		 B,250
loop_principal:
	CALL	BEEP
	DJNZ	loop_principal
	
	RET
END:
