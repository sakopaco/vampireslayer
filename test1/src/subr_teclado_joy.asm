

;;=====================================================
;;MUEVE_ARRIBA
;;=====================================================	
; función: 	decrementa y si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	DEC			 A
	JP			 Z,.no_decrementa_y
	LD			(prota.posy), A
	
.no_decrementa_y:
	POP			AF
fin_mueve_arriba:
	RET
	
	
;;=====================================================
;;MUEVE_ARRIBA_DERECHA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_arriba_derecha:
	
	CALL		mueve_arriba
	JP			mueve_derecha
	
fin_mueve_arriba_derecha:
	;RET


;;=====================================================
;;MUEVE_DERECHA
;;=====================================================	
; función: 	incrementa si se no sale de los límites el valor del punto de mira a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	INC			 A
	CP			 A, LIMPANTDER - 16
	JP			 Z, .no_incrementa_x
	LD			(prota.posx), A
	
.no_incrementa_x:
	POP			AF
fin_mueve_derecha:
	RET

;;=====================================================
;;MUEVE_DERECHA_ABAJO
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la derecha
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_derecha_abajo:
	
	CALL		mueve_derecha
	JP			mueve_abajo
	
fin_mueve_derecha_abajo:
;	RET

;;=====================================================
;;MUEVE_ABAJO
;;=====================================================	
; función: 	incrementa y si se no sale de los límites el valor del punto de mira abajo
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo:
	PUSH		AF
	
	LD		 	 A, (prota.posy)
	INC			 A
	CP			 A, LIMPANTABA - 16
	JP			 Z,.no_incrementa_y
	LD			(prota.posy), A
	
.no_incrementa_y:
	POP			AF
fin_mueve_abajo:
	RET
	

;;=====================================================
;;MUEVE_ABAJO_IZQUIERDA
;;=====================================================	
; función: 	mueve punto de mira en diagonal abajo a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_abajo_izquierda:
	
	CALL		mueve_abajo
	JP			mueve_izquierda

fin_mueve_abajo_izquierda:
	;RET

	
;;=====================================================
;;MUEVE_IZQUIERDA
;;=====================================================	
; función: 	decrementa x si se no sale de los límites el valor del punto de mira a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda:
	PUSH		AF
	
	LD		 	 A, (prota.posx)
	DEC			 A
;	CP			 A, LIMPANTIZQ
	JP			 Z,.no_decrementa_x
	LD			(prota.posx), A
	
.no_decrementa_x:
	POP			AF
fin_mueve_izquierda:
	RET


;;=====================================================
;;MUEVE_IZQUIERDA_ARRIBA
;;=====================================================	
; función: 	mueve punto de mira en diagonal arriba a la izquierda
; entrada: 	-
; salida: 	-
; toca: 	-
mueve_izquierda_arriba:

	CALL		mueve_izquierda
	JP			mueve_arriba

fin_mueve_izquierda_arriba:
	;RET




;;============================================================
;;Código de D. Fernando García (BitVision) (al que siempre le estaré agradecido)
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







;;=====================================================
;;_USA_RELIQUIA
;;=====================================================	
; función: 	Resta vida a enemigos, resta 1 a prota_reliquias, modifica actualiza_reliquias_sn a clp de 0
; entrada: 	prota_reliquias
; salida: 	-
; toca: 	-
usa_reliquia:
fin_usa_reliquia:
	RET



