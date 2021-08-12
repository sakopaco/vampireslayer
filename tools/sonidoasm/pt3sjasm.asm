
		output "pt3sjasm.bin"

		
	
	
romheader:

	db	#fe								;cabecera de ficheros que seran cargados con BLOAD desde basic
	dw	START
	dw	END
	dw	START
	
	


		org	#8200
	
START:
		di	
		ld		hl,SONG-99			; hl vale la direccion donde se encuentra la cancion - 99
		call	PT3_INIT			; Inicia el reproductor de PT3
		ei
	
loop:
		halt						;sincronizacion
		di
		call	PT3_ROUT			;envia datos a al PSG
		call	PT3_PLAY			;prepara el siguiente trocito de cancion que sera enviada mas tarde al PSG
		ei

		;Poner la logica del programa desde aqui
		;
		;

		jp		loop






	include	"PT3-ROM_sjasm.asm"					;replayer de PT3


SONG:
	incbin "bloodytears_castlevania.99"			;musica de ejemplo
		



	;Variables del replayer... las coloco desde aqui.
	;mirar que hace la directiva MAP del SJASM
	map		#f000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;PT3 REPLAYER
PT3_SETUP:		#1	;set bit0 to 1, if you want to play without looping
					;bit7 is set each time, when loop point is passed
PT3_MODADDR:	#2
PT3_CrPsPtr:		#2
PT3_SAMPTRS:		#2
PT3_OrnPtrs:		#2
PT3_PDSP:		#2
PT3_CSP:		#2
PT3_PSP:		#2
PT3_PrNote:		#1
PT3_PrSlide:		#2
PT3_AdInPtA:		#2
PT3_AdInPtB:		#2
PT3_AdInPtC:		#2
PT3_LPosPtr:		#2
PT3_PatsPtr:		#2
PT3_Delay:		#1
PT3_AddToEn:		#1
PT3_Env_Del:		#1
PT3_ESldAdd:		#2
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


	
END
