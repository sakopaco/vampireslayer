;;=====================================================
;;SUBRUTINAS QUE CAPTURAN EL JOYSTICK Y TECLADO Y MUEVEN PUNTO DE MIRA
;;=====================================================

;;=====================================================
;;MUEVE_ARRIBA
;;=====================================================	
; función: 	decrementa y si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	IX, puntomira
; salida: 	-
; toca: 	-
mueve_arriba:
	PUSH		AF
	
	LD		 	 A, (IX + ESTRUCTURA_PUNTOMIRA.posy)
	DEC			 A
	JP			 Z,.no_decrementa_y
	LD			(IX + ESTRUCTURA_PUNTOMIRA.posy), A
	
.no_decrementa_y:
	POP			AF
;fin_mueve_arriba:
	RET


;;=====================================================
;;MUEVE_DERECHA
;;=====================================================	
; función: 	incrementa si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	IX, puntomira
; salida: 	-
; toca: 	-
mueve_derecha:
	PUSH		AF
	
	LD		 	 A, (IX + ESTRUCTURA_PUNTOMIRA.posx)
	INC			 A
	CP			 A, LIMPANTDER - 16
	JP			 Z, .no_incrementa_x
	LD			(IX + ESTRUCTURA_PUNTOMIRA.posx), A
	
.no_incrementa_x:
	POP			AF
;fin_mueve_derecha:
	RET


;;=====================================================
;;MUEVE_ABAJO
;;=====================================================	
; función: 	incrementa y si se no sale de los límites el valor del punto de mira abajo
; entrada: 	IX, puntomira
; salida: 	-
; toca: 	-
mueve_abajo:
	PUSH		AF
	
	LD		 	 A, (IX + ESTRUCTURA_PUNTOMIRA.posy)
	INC			 A
	CP			 A, LIMPANTABA - 16
	JP			 Z,.no_incrementa_y
	LD			(IX + ESTRUCTURA_PUNTOMIRA.posy), A
	
.no_incrementa_y:
	POP			AF
;fin_mueve_abajo:
	RET
	
	
;;=====================================================
;;MUEVE_IZQUIERDA
;;=====================================================	
; función: 	decrementa x si se no sale de los límites el valor del punto de mira a la izquierda
; entrada: 	IX, puntomira
; salida: 	-
; toca: 	-
mueve_izquierda:
	PUSH		AF
	
	LD		 	 A, (IX + ESTRUCTURA_PUNTOMIRA.posx)
	DEC			 A
;	CP			 A, LIMPANTIZQ 			;no es necesario ya que es cero (Z)
	JP			 Z,.no_decrementa_x
	LD			(IX + ESTRUCTURA_PUNTOMIRA.posx), A
	
.no_decrementa_x:
	POP			AF
;fin_mueve_izquierda:
	RET


;;=====================================================
;;MIRA_DISPARO
;;=====================================================	
; función: 	Mira si se ha pulsado alguno de los dos disparos
; entrada: 	A que tendrá 0000 0 0 X-letra M X-espacio 
; salida: 	-
; toca: 	A, B
mira_disparo:
.mira_disparo1:
	RR		 A						;preparo en el carry si se ha pulsado botón 1
	JP		 NC, .mira_disparo2					
	PUSH	AF						;copia A para usarlo después en mira_disparo2
	;se ha pulsado barra o boton 1?
	LD		IX, puntomira
	LD		 A, (IX + ESTRUCTURA_PUNTOMIRA.cadencia)
	OR		 A
	;IF
	JP		 Z, .efectua_disparo	;toca efectuar disparo realmente porque se ha pulsado lo suficiente el disparo
.no_efectua_disparo:;THEN
		DEC		 A
		LD		(IX + ESTRUCTURA_PUNTOMIRA.cadencia), A	;resto cadencia hasta próximo disparo "real" (no automático por haber pulsado una tecla e ir demasiado rápido)
		JP		.fin_mira_disparo1
.efectua_disparo:	;ELSE
		CALL	accion_boton1
.fin_mira_disparo1

	POP			AF
.mira_disparo2:
	RR		 A
	RET		 NC ; no se ha pulsado shift o boton 2?
	;si se ha pulsado
	JP			accion_boton2
;fin_mira_disparo:


;;============================================================
;;Código de D. Fernando García (@BitVision) (al que siempre le estaré agradecido)
;;su difusión depende de su consentimiento o por lo menos de su mención como autor
;check_8th_keyboard_row
;read_joy_0
;check_8th_keyboard_row
;check_4th_keyboard_row
;;============================================================
;;  usa constantes:
;PSG_A  equ  0a0h  ;reg address
;PSG_W  equ  0a1h  ;reg data WR
;PSG_R  equ  0a2h  ;reg data

;;=====================================================
;;update_controllers_status
;;=====================================================	
;depends on the next rountine
;  returns
;  a - 0P2TRLDU

update_controllers_status:
     call  check_8th_keyboard_row
[4]  rrc    a
     ld    b,a    		;save for later  xxxTRDUL

     and    #01    		;save L
     sla    a
     sla    a    		;now 00000L00
     ld    c,a    		;save for later

     ld    a,b    		;again we've got xxxTRDUL. I am interested on leaving 000000DU on a
     srl    a
     and    00000011b
						;we've got 000000DU on a
     or    c    		;now we've got 00000LDU
     ld    c,a    		;save for later

     ld    a,b
     and    00011000b 	;we've got 000TR000
     or    c
     ;finally    000TRLDU

     ;and    00000100   ;preserve just
     ld    b,a    		;save for later
     call  check_4th_keyboard_row      ;check M & P
     push  af
     and    00000100b	;filter just M
     add    a
     add    a
     add    a           ;shift 3th to 6th bit
     or    b           	;merge with previous
     ld    b,a

     call  read_joy_0
     and    00111111b  	;we want just 002TRLDU  from joystick    (2 is second trigger)
     or    b      		;added 000TRLDU from keyboard
     ld    b,a      	;save for later
     pop    af      	; let's check on P

     and    00100000b
     add    a      		;P status on 6th bit  ... so 0P2TRLDU
     or    b

     ret


;ret
;  a -            xx2TRLDU
read_joy_0:
       di
       ld    a,15
       out    [PSG_A],a
       in    a,[PSG_R]
       and    10111111b        ;joy0

       out    [PSG_W],a        ;set joy0

       ld    a,14
       out    [PSG_A],a
       in    a,[PSG_R]

       ei
       cpl

       ret


;ret
;  a -      RDULxxxT
check_8th_keyboard_row:
     di
     in    a,(#aa)
     and    #f0
     or    8
     out    (#aa),a
     in    a,(#a9)
     ei
     cpl

     ret


;ret
;  a -      xxxxxMxx
check_4th_keyboard_row:
     di
     in    a,(#aa)
     and    #f0
     or    4
     out    (#aa),a
     in    a,(#a9)
     ei
     cpl

     ret

;--------------------------------------------

