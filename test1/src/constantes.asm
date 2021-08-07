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

REGEST		equ		#0099	;registro de estado para escribir directamente en VRAM
REGESCVDP	equ		#0098	;registro donde escribir valor para VRAM

;;ETIQUETAS/CONSTANTES REGISTROS PSG (PARA JOYSTICK)
PSG_A  equ  0a0h  ;reg address
PSG_W  equ  0a1h  ;reg data WR
PSG_R  equ  0a2h  ;reg data


;;ETIQUETAS DE ZONAS DE MEMORIA DE LA VPD (MSX1)
CHRTBL		equ		#0000
TILMAP		equ		#1800
SPRART		equ		#1B00
CLRTBL		equ		#2000
SPRTBL		equ		#3800


;;ETIQUETAS ESTANDAR PARA DAR MÁS CLARIDAD AL CODIGO
SI			equ		1
NO			equ		0

;;PALETA DE COLORES DEL MSX
COLTRASP	equ		0
COLNEGRO	equ		1
COLVERDE	equ		2
COLVERCLA	equ		3
COLAZULOSC	equ		4
COLAZULLA	equ		5
COLROJOOSC	equ		6
COLCYAN		equ		7
COLROJO		equ		8
COLROJOCLA	equ		9
COLAMAROSC	equ		10
COLAMARCLA	equ		11
COLVERDOSC	equ		12
COLMAGENTA	equ		13
COLGRIS		equ		14
COLBLANCO	equ		15



;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en mapa vdp)
POSMAPLIN1  equ		#02F8
POSMAPLIN2  equ		#02D8
POSMAPLIN3  equ		#02B8
POSMAPLIN4  equ		#0298
POSMAPLIN5  equ		#0278
POSMAPLIN6  equ		#0258
POSMAPLIN7  equ		#0238

POSCARAMAP	equ		#000D
POSVIDAS	equ		#0248
POSRELIMAP	equ		#0011
POSRELIQ	equ		#02C8
POSENERG	equ		#0288
POSNIVEL	equ		#02B4
POSMAPA		equ 	#0238

POSPUERABAJ equ		#01EE
POSPUERARRI equ		#008E
POSPUERDERE equ		#00FC
POSPUERIZQU equ		#00E1


;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en en el banco de memoria)
TILEMAPPROT equ		19
TILEMAPVACI	equ		9
TILEMAPROJO equ		16
TILEMAPAMAR equ		15
TILEMAPVERD equ		14


;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (generales)
NMAXVIDREL	equ		8		;el número máximo de vidas y de reliquias es de 8
NHABNIVEL	equ		7
MAXENERGIA  equ		248
TILEENERG8  equ		217
TILEENERG7  equ		186
TILEENERG6  equ		155
TILEENERG5  equ		124
TILEENERG4  equ		93
TILEENERG3  equ		62
TILEENERG2  equ		31
TILENEGRO	equ		0

;limites
LIMPANTIZQ  equ		0
LIMPANTDER  equ		255
LIMPANTARR  equ		0
LIMPANTABA  equ		128


;matriz de 7x7 empieza en 0, y fila y x col, cuento desde esquina sup izq
BASEMAPY	equ		6
BASEMAPX	equ		3

;para que haga un bucle cuando se use una reliquia
RETARDOREL  equ		1;75
