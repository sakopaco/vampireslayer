;;=====================================================
;; FICHERO constantes.asm
;;=====================================================

;;ETIQUETAS/CONSTANTES BIOS TECLADO
GTTRIG		equ		#00D8	;Returns current trigger status
GTSTCK		equ		#00D5	;Returns the joystick/cursors status
CLIKSW		equ		#F3DB	;deshabilita el sonido de clic cuando se pulsa una tecla

;;ETIQUETAS/CONSTANTES BIOS VDP
RDVDP		equ		#013E	;lee registro status VDP
WRTVDP		equ		#0047	;escribe registros del VDP
LDIRVM		equ		#005C	;RAM/ROM -> VRAM
LDIRMV		equ		#0059	;VRAM -> RAM
CHGMOD		equ		#005F	;cambia modo pantalla (screen mode)
DISSCR  	equ		#0041	;desactiva pantanlla
ENASCR  	equ		#0044	;activa pantalla
CHGCLR  	equ		#0062	;cambia color de pantalla (toca A y direcciones)
FORCLR		equ		#F3E9	;zona memoria color foreground
BAKCLR  	equ		#F3EA	;zona memoria color background
BDRCLR 		equ		#F3EB	;zona memoria bordercolor
CLS			equ		#00C3	;limpia pantalla (necesita A=0)

;;ETIQUETAS/CONSTANTES REGISTROS VDP
RG0SAV		equ		#F3DF	;Mirror of VDP register 0 (Basic: VDP(0))
RG1SAV		equ		#F3E0	;Mirror of VDP register 1 (Basic: VDP(1))
RG2SAV		equ		#F3E1	;Mirror of VDP register 2 (Basic: VDP(2))
RG3SAV		equ		#F3E2	;Mirror of VDP register 3 (Basic: VDP(3))
RG4SAV		equ		#F3E3	;Mirror of VDP register 4 (Basic: VDP(4))
RG5SAV		equ		#F3E4	;Mirror of VDP register 5 (Basic: VDP(5))
RG6SAV		equ		#F3E5	;Mirror of VDP register 6 (Basic: VDP(6))
RG7SAV		equ		#F3E6	;Mirror of VDP register 7 (Basic: VDP(7))
STATFL		equ		#F3E7	;Mirror of VDP(8) status register (S#0)

;;ETIQUETAS DE ZONAS DE MEMORIA DE LA VPD (MSX1)
SC2MAP		equ		#1800

;; OTRAS LLAMADAS A LA BIOS
BEEP		equ		#00C0	;toca todos los registros

;;ETIQUETAS ESTANDAR PARA DAR MÁS CLARIDAD AL CODIGO
SI			equ		#0001
NO			equ		#0000

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en mapa vdp)
NMAXVIDREL	equ		#0008	;el número máximo de vidas y de reliquias es de 8

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en mapa vdp)
POSCARAMAP	equ		#000D
POSVIDAS	equ		#0248
POSRELIMAP	equ		#0011
POSRELIQ	equ		#02C8
POSNIVEL	equ		#02B4
