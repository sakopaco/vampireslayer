

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

