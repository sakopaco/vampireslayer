
		output "mus_int.bin"

		
GTTRIG		equ			#00D8	
		
H.KEYI		equ     	#FD9A
H.TIMI	 	equ     	#FD9F
	
romheader:

		db	#fe								;cabecera de ficheros que seran cargados con BLOAD desde basic
		dw	START
		dw	END
		dw	START
	
	


		org	#8200
	
START:
		di

		;inicializacion de replayer musical
		ld		hl,SONG-99			; hl <- initial address of module - 99
		call	PT3_INIT			; Inits PT3 player
		
		;inicializacion del reproductor de efectos sonoros
		ld		hl,sfx_bank
		call	ayFX_SETUP


		;salva actual rutina en H.KEYI
		LD	DE,OLDINT	; get address of old int. hook saved area
		LD	HL,H.TIMI	; get address of interrupt entry hook
		LD	BC,5		; lenght of hook is 5 bytes
		LDIR			; transfer
		;Engancha nuestra rutina de servicio al gancha que deja preparado la BIOS cuando se termina de pintar la pantalla (50 o 60 veces por segundo)
		ld		a,#c3
		ld		[H.TIMI],a
		ld		hl,nuestra_isr
		ld		[H.TIMI+1],hl
		ei		;optimizacion:
				;piensa que las dos ultimas lineas podrian haber sido: 
				;ei						;primero ei
				;ld		[H.TIMI+1],hl	;luego este ld
										;PENSAR (y consultar ) PORQUE!!!!
		
loop:
		halt		
		
		
		
		;Poner la logica del programa desde aqui ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;
		; por ejemplo mirar si se pulsa espacio y que suene un efecto sonoro:		
		xor		a
		call	GTTRIG
		or		a
		jr		z,loop			;si no se ha pulsado el espacio volvemos al principio
		;espacio pulsado!!

		ld		a,0
		ld		c,1
		call	ayFX_INIT			
		
		jp		loop
		;Poner la logica del programa hasta aqui ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





nuestra_isr:
		call	PT3_ROUT			;envia los datos a los registros del PSG
		call	PT3_PLAY			;calcula el siguiente 'trocito' de musica que sera enviado al proxima vez
		call 	ayFX_PLAY			;calcula el siguiente 'trocito' de efecto especial de sonido que sera enviado la proxima vez
		JP		OLDINT				;se va a ejecutar la rutina original	

;----- HOOK save area -----

OLDINT: DS	5




	include	"PT3-ROM_sjasm.asm"
	include "ayFX-ROM_sjasm.asm"


SONG:
	incbin "bloodytears_castlevania.99"
	
sfx_bank:
	incbin "demo.afb"




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



	
END
