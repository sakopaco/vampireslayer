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
TILMAPBANK1 equ		#1900
SPRART		equ		#1B00
CLRTBL		equ		#2000
SPRTBL		equ		#3800


;;ETIQUETAS ESTANDAR PARA DAR MÁS CLARIDAD AL CODIGO
SI			equ		1
NO			equ		0
LIMCADENCIA equ		4	;nº de veces que se ejecutará el disparo antes de ejecutar un disparo real (porque cuando se pulsa la tecl dispara 3 ó 4 veces de rápido que va)
;hay que estudiar si 3 es un nº mejor



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

;;POSICIONES DE LAS AYUDAS EN PANTALLA BANCO 1
POSORACION	equ		163
POSCRUZ		equ		167
POSAGUA		equ		171
POSARMAD	equ		175
POSPLANTA	equ		179
POSVIDAEXT	equ		183
POSBALLESTA	equ		187

;;POSICIONES DE LAS AYUDAS EN PANTALLA PIXEL CENTRAL X
POSORACIONX	equ		32
POSCRUZX	equ		64
POSAGUAX	equ		96
POSARMADX	equ		128
POSPLANTAX	equ		160
POSVIDAEXTX	equ		192
POSBALLESTAX equ	224

;;POSICIONES DE LAS AYUDAS EN PANTALLA PIXEL CENTRAL Y
POSAYUDASY	equ		112	;se pone por poner porque las estructuras de ayudas ya se inicializan con este valor

;;ESTADO ESTRUCTURA
INACTIVA	equ		0
ACTIVA		equ		1
HABTERMIN	equ		1

;;POSICIONES DE LAS ANTORCHAS
POSANTOR1	equ		136
POSANTOR2	equ		151
MAPLLAMA1	equ		196
MAPLLAMA2	equ		197
RESETLLAMA	equ		255

;;POSICIONES DE LOS ESQUELETOS
POSESQUEL1	equ		136
POSESQUEL2	equ		149
POSCALAVE1	equ		169
POSCALAVE2	equ		182
RESETESQUEL	equ		25
RESETESCENAESQUEL 	equ	4	;hay 4 caras con las que el esqueleto cambia (se ha metido el 0 para facilitar código)

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en en el banco de memoria)
TILEPROTAM  equ		19		;tile del prota para pintar en mapa
TILEGRISM	equ		9		;tile gris que representa vacio (por donde el prota va pasando)
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTES PARA INTERRUPCIONES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
H.KEYI		equ     	#FD9A
H.TIMI	 	equ     	#FD9F


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTES PARA SONIDO 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	map		#f000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PT3 REPLAYER
PT3_SETUP:		#1	;set bit0 to 1, if you want to play without looping
					;bit7 is set each time, when loop point is passed
PT3_MODADDR:	#2
PT3_CrPsPtr:	#2
PT3_SAMPTRS:	#2
PT3_OrnPtrs:	#2
PT3_PDSP:		#2
PT3_CSP:		#2
PT3_PSP:		#2
PT3_PrNote:		#1
PT3_PrSlide:	#2
PT3_AdInPtA:	#2
PT3_AdInPtB:	#2
PT3_AdInPtC:	#2
PT3_LPosPtr:	#2
PT3_PatsPtr:	#2
PT3_Delay:		#1
PT3_AddToEn:	#1
PT3_Env_Del:	#1
PT3_ESldAdd:	#2
PT3_NTL3:		#2	; AND A / NOP (note table creator)

VARS:			#0

ChanA:			#29			;CHNPRM_Size
ChanB:			#29			;CHNPRM_Size
ChanC:			#29			;CHNPRM_Size

;GlobalVars
DelyCnt:		#1
CurESld:		#2
CurEDel:		#1
Ns_Base_AddToNs:	#0
Ns_Base:		#1
AddToNs:		#1

NT_:			#192	; Puntero a/tabla de frecuencias

AYREGS:			#0
VT_:			#14
EnvBase:		#2
VAR0END:		#0

T1_:			#0		
T_NEW_1:		#0
T_OLD_1:		#24
T_OLD_2:		#24
T_NEW_3:		#0
T_OLD_3:		#2
T_OLD_0:		#0
T_NEW_0:		#24
T_NEW_2:		#166
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PT3 REPLAYER END

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ayFX REPLAYER 
ayFX_MODE:		#1			; ayFX mode
ayFX_BANK:		#2			; Current ayFX Bank
ayFX_PRIORITY:	#1			; Current ayFX stream priotity
ayFX_POINTER:	#2			; Pointer to the current ayFX stream
ayFX_TONE:		#2			; Current tone of the ayFX stream
ayFX_NOISE:		#1			; Current noise of the ayFX stream
ayFX_VOLUME:	#1			; Current volume of the ayFX stream
ayFX_CHANNEL:	#1			; PSG channel to play the ayFX stream

	;IF (AYFXRELATIVE == 1 ) 
;ayFX_VT:	ds	2			; ayFX relative volume table pointer
	;ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ayFX REPLAYER END



