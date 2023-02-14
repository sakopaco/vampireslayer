;;=====================================================
;; FICHERO constantes.asm
;;=====================================================

;;ETIQUETAS/CONSTANTES BIOS TECLADO
GTTRIG				equ		#00D8	;Returns current trigger status
GTSTCK				equ		#00D5	;Returns the joystick/cursors status
CLIKSW				equ		#F3DB	;deshabilita el sonido de clic cuando se pulsa una tecla

;;ETIQUETAS/CONSTANTES BIOS VDP
RDVDP				equ		#013E	;lee registro status VDP
WRTVDP				equ		#0047	;escribe registros del VDP
LDIRVM				equ		#005C	;RAM/ROM -> VRAM
LDIRMV				equ		#0059	;VRAM -> RAM
FILVRM				equ		#0056	;Rellena la VRAM con un valor
WRTVRM				equ		#004D	;escribe un balor en una dirección de la VRAM
CHGMOD				equ		#005F	;cambia modo pantalla (screen mode)
DISSCR  			equ		#0041	;desactiva pantanlla
ENASCR  			equ		#0044	;activa pantalla
CHGCLR  			equ		#0062	;cambia color de pantalla (toca A y direcciones)
FORCLR				equ		#F3E9	;zona memoria color foreground
BAKCLR  			equ		#F3EA	;zona memoria color background
BDRCLR 				equ		#F3EB	;zona memoria bordercolor
CLS					equ		#00C3	;limpia pantalla (necesita A=0)

BORRASPRITE    		equ		#00D1	;si se pone en la Y de un sprite hace que desaparezca de pantalla
BORRASPRITESIG 		equ		#00D0	;si se pone en la Y de un sprite hace que desaparezca de pantalla y los de los planos siguientes

;;ETIQUETAS/CONSTANTES REGISTROS VDP
RG0SAV				equ		#F3DF	;Mirror of VDP register 0 (Basic: VDP(0))
RG1SAV				equ		#F3E0	;Mirror of VDP register 1 (Basic: VDP(1))
RG2SAV				equ		#F3E1	;Mirror of VDP register 2 (Basic: VDP(2))
RG3SAV				equ		#F3E2	;Mirror of VDP register 3 (Basic: VDP(3))
RG4SAV				equ		#F3E3	;Mirror of VDP register 4 (Basic: VDP(4))
RG5SAV				equ		#F3E4	;Mirror of VDP register 5 (Basic: VDP(5))
RG6SAV				equ		#F3E5	;Mirror of VDP register 6 (Basic: VDP(6))
RG7SAV				equ		#F3E6	;Mirror of VDP register 7 (Basic: VDP(7))
STATFL				equ		#F3E7	;Mirror of VDP(8) status register (S#0)

REGEST				equ		#0099	;registro de estado para escribir directamente en VRAM
REGESCVDP			equ		#0098	;registro donde escribir valor para VRAM

;;ETIQUETAS/CONSTANTES REGISTROS PSG (PARA JOYSTICK)
PSG_A  				equ  	0a0h  ;reg address
PSG_W  				equ  	0a1h  ;reg data WR
PSG_R  				equ  	0a2h  ;reg data

;;ETIQUETAS DE ZONAS DE MEMORIA DE LA VPD (MSX1)
CHRTBL				equ		#0000
TILMAP				equ		#1800
SPRART				equ		#1B00
CLRTBL				equ		#2000
SPRTBL				equ		#3800

;;ETIQUETAS ESTANDAR PARA DAR MÁS CLARIDAD AL CODIGO
SI					equ		1
NO					equ		0

;;PALETA DE COLORES DEL MSX
COLTRASP			equ		0
COLNEGRO			equ		1
COLVERDE			equ		2
COLVERCLA			equ		3
COLAZULOSC			equ		4
COLAZULLA			equ		5
COLROJOOSC			equ		6
COLCYAN				equ		7
COLROJO				equ		8
COLROJOCLA			equ		9
COLAMAROSC			equ		10
COLAMARCLA			equ		11
COLVERDOSC			equ		12
COLMAGENTA			equ		13
COLGRIS				equ		14
COLBLANCO			equ		15

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en mapa vdp)
POSMAPLIN1  		equ		#02F8
POSMAPLIN2  		equ		#02D8
POSMAPLIN3  		equ		#02B8
POSMAPLIN4  		equ		#0298
POSMAPLIN5  		equ		#0278
POSMAPLIN6  		equ		#0258
POSMAPLIN7  		equ		#0238

POSCARAMAP			equ		#000D
POSVIDAS			equ		#0248
POSRELIMAP			equ		#0011
POSRELIQ			equ		#02C8
POSENERG			equ		#0288
POSNIVEL			equ		#02B4
POSMAPA				equ 	#0238

POSPUERABAJ 		equ		#01EE
POSPUERARRI 		equ		#008E
POSPUERDERE 		equ		#00FC
POSPUERIZQU 		equ		#00E1
POSESCALERA 		equ		#006C	;32 x 3 + columna

;;POSICIONES DE LAS AYUDAS EN PANTALLA BANCO 1
POSORACION	 		equ		#0146;326	;256 + 70
POSCRUZ		 		equ		#01A3;419	;256 + 93
POSAGUA		 		equ		#016A;362
POSARMADURA	 		equ		#01AB;427
POSPLANTA	 		equ		#0172;370
POSVIDAEXT	 		equ		#01B6;438 
POSBALLESTA	 		equ		#0158;344

;;POSICIONES X E Y PARA DETERMINAR IMPACTOS
POSORACIONX	 		equ		#38;56
POSORACIONY	 		equ		#58;88
POSCRUZX	 		equ		#20;32
POSCRUZY	 		equ		#70;112
POSAGUAX	 		equ		#58;88
POSAGUAY	 		equ		#60;96
POSARMADURAX 		equ		#60;96
POSARMADURAY 		equ		#70;112
POSPLANTAX	 		equ		#90;144
POSPLANTAY	 		equ		#60;96
POSVIDAEXTX	 		equ		#B8;184
POSVIDAEXTY	 		equ		#70;112
POSBALLESTAX 		equ		#C8;200
POSBALLESTAY 		equ		#58;88

;; TAMAÑO AYUDAS
ALTOAYUDA			equ		#02
ANCHOAYUDA			equ		#02

;; RETARDO TIEMPO QUE PARA EL JUEGO POR TIRAR UNA RELIQUIA
RETARDOREL			equ		2000

;; RADIOS DE DISPARO
RADIOAYUDAX 		equ		#08
RADIOAYUDAY 		equ		#08

;;POSICIÓN INICIAL DEL SPRITE DEL PUNTO DE MIRA
POSXPM				equ		116
POSYPM				equ		96

;;ESTADO HABITACION
ISHABTERMIN			equ		1 	;0 sería no terminada

;;ETIQUETAS PARA PUNTO DE MIRA
LIMCADENCIA 		equ		4	;nº de veces que se ejecutará el disparo antes de ejecutar un disparo real (porque cuando se pulsa la tecl dispara 3 ó 4 veces de rápido que va)
SPRI_DANO1A 		equ		0	;posiciones de los sprites en memoria (va de 4 en 4 al tratarse de sprites de 16 x 16)
SPRI_DANO1B 		equ		4
SPRI_DANO2A 		equ		8
SPRI_DANO2B 		equ		12

;;POSICIONES DE LAS ANTORCHAS
POSANTOR1			equ		136
POSANTOR2			equ		151
MAPLLAMA1			equ		196
MAPLLAMA2			equ		197
RESETLLAMA			equ		255

;;POSICIONES DE LOS ESQUELETOS
POSESQUEL1			equ		136
POSESQUEL2			equ		149
POSCALAVE1			equ		169
POSCALAVE2			equ		182
RESETESQUEL			equ		25
RESETESCENAESQUEL 	equ		4	;hay 4 caras con las que el esqueleto cambia (se ha metido el 0 para facilitar código)

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (relacionadas con posiciones en en el banco de memoria)
TILEPROTAM  		equ		19		;tile del prota para pintar en mapa
TILEGRISM			equ		9		;tile gris que representa vacio (por donde el prota va pasando)
TILEMAPROJO 		equ		16
TILEMAPAMAR 		equ		15
TILEMAPVERD 		equ		14

;;ETIQUETAS ESPECIFICAS PARA DAR MÁS CLARIDAD AL CODIGO (generales)
NMAXVIDREL			equ		8		;el número máximo de vidas y de reliquias es de 8
NHABNIVEL			equ		7
MAXENERGIA  		equ		248
TILEENERG8  		equ		217
TILEENERG7  		equ		186
TILEENERG6  		equ		155
TILEENERG5  		equ		124
TILEENERG4  		equ		93
TILEENERG3  		equ		62
TILEENERG2  		equ		31
TILEENERG1			equ 	648
TILENEGRO			equ		0
TILEVIDA1			equ 	584

;limites
LIMPANTIZQ  		equ		0
LIMPANTDER 			equ		255
LIMPANTARR 			equ		0
LIMPANTABA  		equ		128

;matriz de 7x7 empieza en 0, y fila y x col, cuento desde esquina sup izq
BASEMAPY			equ		6
BASEMAPX			equ		3

;; CONSTANTES DE INICIO PARA EL PROTA
PROTANIVEL			equ		4;0			;nivel del castillo donde está 0-6 - los niveles (matrices) son 7 del 0 al 6
PROTAVIDAS			equ		3
PROTARELIQUIAS		equ		3
PROTAPOSMAPX		equ		3			;pos columna 7 columnas 7: del 0 al 6 ;pos X dentro del nivel (se empieza en 0)
PROTAPOSMAPY		equ		6;0			;pos fila los subniveles (filas) son 7 del 0 al 6 ;pos Y dentro del nivel (se empieza en 0)
PROTAENERGIA		equ		248			;MAXENERGIA;valor real de la energía
PROTAENERGIABYTEBAJO equ	0			;cuando se llene este es cuando se pierde prota_energí
PROTADANO1			equ		3			;daño del punto de mira
PROTADANO2			equ		6			;daño del punto de mira cuando se tiene la ayuda
PROTADANORELIQUIA	equ		25			;daño del punto de mira cuando se tiene la ayuda

;; TIPOS DE GAMEOVER
NOQUEDANVIDAS		equ		0
FINBUENO			equ		1

;;CONTANTES PARA SONIDO
SONIDORELIQUIA		equ		5
SONIDOINICIO		equ		4
SONIDOBOMBA			equ		2
SONIDODISPARO		equ		1

MUSICANORMAL		equ		0
MUSICAJEFE			equ		1
MUSICAGAMEOVER		equ		2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONSTANTES PARA INTERRUPCIONES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
H.KEYI				equ     	#FD9A
H.TIMI	 			equ     	#FD9F



