	OUTPUT	"testsc2.bin"

;;ETIQUETAS/CONSTANTES BIOS TECLADO
CHGET	equ		#009F	;lee de teclado
CHPUT	equ		#00A2	;escribe en pantalla screen 0
POSIT	equ		#00C6	;locate en screen 0
INLIN	equ		#00B1	;almacena tecla pulsada en bufrer
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
;borrar tras verificar
GSPSIZ	equ		#008A	;borrar tras verificar que pinta correctamente 8x8


;;ETIQUETAS/CONSTANTES REGISTROS VDP
RG0SAV	equ		#F3DF	;Mirror of VDP register 0 (Basic: VDP(0))
RG1SAV	equ		#F3E0	;Mirror of VDP register 1 (Basic: VDP(1))
RG2SAV	equ		#F3E1	;Mirror of VDP register 2 (Basic: VDP(2))
RG3SAV	equ		#F3E2	;Mirror of VDP register 3 (Basic: VDP(3))
RG4SAV	equ		#F3E3	;Mirror of VDP register 4 (Basic: VDP(4))
RG5SAV	equ		#F3E4	;Mirror of VDP register 5 (Basic: VDP(5))
RG6SAV	equ		#F3E5	;Mirror of VDP register 6 (Basic: VDP(6))
RG7SAV	equ		#F3E6	;Mirror of VDP register 7 (Basic: VDP(7))
STATFL	equ		#F3E7	;Mirror of VDP(8) status register (S#0)

;;ETIQUETAS/CONSTANTES DE PROGRAMA
INIPMX	equ		100
INIPMY	equ		50
INIPMCOL equ	5


;;CABECERA FICHERO BIN
	DB	#FE
	DW	START
	DW	END
	DW	START
;;INICIO CÓDIGO PROGRAMA	
	ORG	#8200
	
START:
	;toca A
	CALL		elimina_clic		;desabiliata el sonido de clic al pulsar una tecla
	;toca A
	CALL		prepara_pantalla	;prepara screen 2 y color 6,1,1
	CALL		carga_patrones_sprites;
	
	;toca AF y BC
	CALL		DISSCR 				;desactiva pantalla	
	
	CALL		carga_pantalla		;carga pantalla de fondo screen 2
	
	;toca AF y BC
	CALL		ENASCR				;activa pantalla

loop:
	HALT							;espera VBLANK y sincroniza
	CALL 	volcado_atributos_sprites_a_VRAM
	CALL	mira_teclado_actualiza_posiciones
	CALL	actualiza_atributos_sprite
	
	CALL	retardar
	
	
	JP		loop	
	
;	RET		;vuelta al basic
;;
;;	FIN PROGRAMA
;;

retardar:
	CALL		retardo
	CALL		retardo
fin_retardar:
	RET


;*********************************************
;retardo
;entrada:
;salida/modifica:
;	. B que termina en 0
;*********************************************
retardo:
	LD	B,250
retardo_loop:
	NOP
	DJNZ	retardo_loop
	RET




;*********************************************
;carga_patrones_sprites
;carga datos de los patrones
;salida/modifica:
;	. A = 0 (o flag Z activo)
;*********************************************
carga_patrones_sprites:
	;sprite punto de mira
	LD		HL,sprite_punto_mira
	LD		DE,#3800
	LD		BC,32 * 4 				;(x 4 ya que hay definidos ahora 4 sprites)
	CALL	LDIRVM
fin_carga_patrones_sprites:
	RET


	
;*********************************************
;elimina_clic
;desabiliata el sonido de clic al pulsar una tecla
;salida/modifica:
;	. A = 0 (o flag Z activo)
;*********************************************	
elimina_clic;
	XOR		 A
	LD		(CLIKSW),A
fin_elimina_clic:
	RET
	

;*********************************************
;limpia_pantalla
;entrada:
;salida/modifica:
;	. A = 0 (o flag Z activo)
;*********************************************
limpia_pantalla:
	XOR			A
	CALL 		CLS
fin_limpia_pantalla:
	RET


;*********************************************
;set_color
;Establezca el color de primer plano en el modo de pantalla FORCLR (F3E9H), el color de fondo en
;BAKCLR (F3EAH) y el color periférico en BDRCLR (F3EBH) antes de llamar.
;entrada:
;salida/modifica:
;	. A
;*********************************************
set_color:
	LD		 A,2				;verde oscuro
	LD 		(FORCLR),A
	LD		 A,1				;negro
	LD 		(BAKCLR),A
	LD		 A,1				;negro
	LD 		(BDRCLR),A
	CALL	CHGCLR  
fin_set_color:
	RET


;*********************************************
;prepara_pantalla
;pone screen 2,2 + color verdeoscuro,negro,negro
;entrada:
;salida/modifica:
;	. A
;*********************************************
prepara_pantalla:
	;toca A
	CALL		limpia_pantalla		;limpiamos pantalla
	;toca A y direcciones #F3E9/#F3EA/#F3EB
	CALL		set_color			;ponemos color de fondo de pantalla y texto
	
	;cambiamos a SCREEN 2,2 del BASIC
	;toca A
	LD		 A,2
	CALL	CHGMOD			;selecciona screen 2
	
	LD		 A,(RG1SAV)
	OR		00000010b		;fuerza sprites de 16x16
	LD		(RG1SAV),A		; ;no lo guardamos en la copia de variables del sistema
	LD		 B,A
	LD		 C,1
	JP		WRTVDP			;opción alternativa de escribir las tres lineas siguientes
	;~ CALL	WRTVDP			;lo escribe en el registro 1 del VDP
;~ fin_prepara_pantalla:
	;~ RET


;*********************************************
;carga_pantalla
;entrada:
;salida/modifica:
;	. HL,DE,BC
;*********************************************
carga_pantalla:
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla
	LD		DE,#0000
	LD		BC,256*8*3
	CALL	LDIRVM		
	
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla
	LD		DE,#1800
	LD		BC,256*3
	CALL	LDIRVM
	
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla
	LD		DE,#2000
	LD		BC,256*8*3
	CALL	LDIRVM
fin_carga_pantalla:
	RET
	

;*********************************************
;actualiza_atributos_sprite
;entrada:
;salida/modifica:
;	. HL,DE,BC
;*********************************************
actualiza_atributos_sprite:
	;carga datos de atributos de sprites
	LD		IX,atributos_sprite_pm
	LD		 A,(punto_mira.posy)
	LD		(IX+0),A
	LD		 A,(punto_mira.posx)
	LD		(IX+1),A
	XOR		 A
	LD		(IX+2),A					;plano 0
	LD		 A,(punto_mira.color)
	LD		(IX+3),A
fin_actualiza_atributos_sprite:
	RET


;*********************************************
;volcado_atributos_sprites_a_VRAM
;entrada:
;salida/modifica:
;	. HL,DE,BC
;*********************************************
volcado_atributos_sprites_a_VRAM:
	LD		HL,atributos_sprite_pm
	LD		DE,#1B00
	LD		BC,4
	CALL	LDIRVM
fin_volcado_atributos_sprites_a_VRAM:
	RET


;*********************************************
;mira_teclado_actualiza_posiciones
; actualiza posición del punto de mira según teclas pulsadas
; a => 0000 (joystick pulsado) 0000 (tecla pulsada)
;entrada:
;salida/modifica:
;	. HL,DE,BC
;*********************************************
mira_teclado_actualiza_posiciones:
	LD		DE,tabla_mover_direccion_puntomira
	XOR		 A						;mirar cursores (a=0)
	CALL	GTSTCK					;llamada a BIOS resultado se almacena en A
	
	LD		 H,0
	LD		 L,A
	ADD		HL,DE					;se llama al método correspondiente ya que son consecutivos
	
	; obteniendo la posición de memoria guardada en HL
	LD		 A,(HL)
	INC		HL ;son dos bytes
	LD		 H,(HL)
	LD		 L,A
	; saltamos a la posición de memoria donde está la función y que estaba almacenada en el array
	JP		(HL)


;	aquí habría que mirar disparo o botón secundario ******************

fin_mira_teclado_actualiza_posiciones:
;	RET		**************


;*********************************************
;listado de funciones apuntadas en el array tabla_mover_direccion_puntomira
;
;*********************************************
arriba:
	LD		 A,(punto_mira.posy)
	;~ OR		 A ; reviso limite izquierdo
	;~ RET		 Z ; se ha llegado a lim izq y no hace nada
	DEC		 A ; no se ha lledado al límite izq y decremento x
	LD		(punto_mira.posy),A
	JP		fin_mira_teclado_actualiza_posiciones
arribaderecha:
	JP		fin_mira_teclado_actualiza_posiciones
derecha:
	JP		fin_mira_teclado_actualiza_posiciones
derechaabajo:
	JP		fin_mira_teclado_actualiza_posiciones
abajo:
	JP		fin_mira_teclado_actualiza_posiciones
abajoizquierda:
	JP		fin_mira_teclado_actualiza_posiciones
izquierda:
	LD		 A,(punto_mira.posx)
	;~ OR		 A ; reviso limite izquierdo
	;~ RET		 Z ; se ha llegado a lim izq y no hace nada
	DEC		 A ; no se ha lledado al límite izq y decremento x
	LD		(punto_mira.posx),A
	JP		fin_mira_teclado_actualiza_posiciones
izquierdaarriba:
	JP		fin_mira_teclado_actualiza_posiciones



; DEFINICION DE VARIABLES

;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================
	STRUCT ESTRUCTURA_PUNTOMIRA
posx		DB		INIPMX
posy		DB		INIPMY
color		DB		INIPMCOL
retardo		DB		0
	ENDSTRUCT;ESTRUCTURA_PUNTOMIRA

;;=====================================================
;;DEFINICIÓN DE CONSTANTES DE PROGRAMA
;;=====================================================	
tiles_patrones_pantalla:	incbin "tiles.bin.chr"
tiles_color_pantalla:		incbin "tiles.bin.clr"
tiles_mapa_pantalla:		incbin "mapa.map"

tabla_mover_direccion_puntomira:		;locallización del código que maneja el movimiento del punto de mira (incluido límites)
    dw  arriba
    dw	arribaderecha
    dw  derecha
    dw	derechaabajo
    dw  abajo
    dw	abajoizquierda
    dw  izquierda
    dw	izquierdaarriba

;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	
sprite_punto_mira:
	DB  #00,#01,#0F,#11,#20,#24,#20,#71
	DB  #71,#20,#24,#20,#11,#0F,#01,#00
	DB  #00,#80,#F0,#88,#04,#24,#04,#8E
	DB  #8E,#04,#24,#04,#88,#F0,#80,#00
	
sprite_punto_mira_disp:
	DB  #FF,#00,#FF,#00,#FF,#00,#FF,#00
	DB  #FF,#00,#FF,#00,#FF,#00,#FF,#00
	DB  #FF,#00,#FF,#00,#FF,#00,#FF,#00
	DB  #FF,#00,#FF,#00,#FF,#00,#ff,#00
	
serpiente1:
	DB #00,#00,#00,#00,#00,#00,#00,#10
	DB #30,#20,#60,#70,#38,#1C,#1F,#0F
	DB #00,#38,#7C,#76,#7E,#7C,#FA,#C1
	DB #E0,#60,#70,#78,#3C,#1C,#F8,#F8

serpiente2:
	DB #00,#00,#00,#00,#00,#00,#01,#05
	DB #1C,#30,#30,#30,#38,#1C,#1F,#0F
	DB #00,#70,#F8,#EC,#FC,#F8,#F5,#C2
	DB #E0,#60,#70,#38,#18,#1C,#F8,#F0
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES DE PROGRAMA
;;=====================================================	
punto_mira:				ESTRUCTURA_PUNTOMIRA
atributos_sprite_pm:	DB	4,0		;X,Y, patrón, color

END:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
