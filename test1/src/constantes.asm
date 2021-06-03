;;=====================================================
;; FICHERO constantes.asm
;;=====================================================

;;ETIQUETAS/CONSTANTES BIOS TECLADO
GTTRIG	equ		#00D8	;Returns current trigger status
GTSTCK	equ		#00D5	;Returns the joystick/cursors status
CLIKSW	equ		#F3DB	;deshabilita el sonido de clic cuando se pulsa una tecla

;;ETIQUETAS/CONSTANTES BIOS VDP
RDVDP	equ		#013E	;lee registro status VDP
WRTVDP	equ		#0047	;escribe registros del VDP
LDIRVM	equ		#005C	;RAM/ROM -> VRAM
LDIRMV	equ		#0059	;VRAM -> RAM
CHGMOD	equ		#005F	;cambia modo pantalla (screen mode)
DISSCR  equ		#0041	;desactiva pantanlla
ENASCR  equ		#0044	;activa pantalla
CHGCLR  equ		#0062	;cambia color de pantalla (toca A y direcciones)
FORCLR	equ		#F3E9	;zona memoria color foreground
BAKCLR  equ		#F3EA	;zona memoria color background
BDRCLR 	equ		#F3EB	;zona memoria bordercolor
CLS		equ		#00C3	;limpia pantalla (necesita A=0)


BEEP	equ		#00C0	;toca todos los registros

