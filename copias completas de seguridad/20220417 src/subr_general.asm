;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS GENERALES USABLES PARA CUALQUIER PROYECTO
;;=====================================================	

;;=====================================================
;;SUMA_A_BC
;;=====================================================	
; función: 	suma A a BC por si da más de 255
; entrada: 	A, BC
; salida: 	A + BC
; toca:		A, BC
suma_A_BC:
	ADD		 C
	LD		 C, A
	ADC		 B
	SUB		 C
	LD		 B, A
fin_suma_A_BC:
	RET
	
;;=====================================================
;;SUMA_A_HL
;;=====================================================	
; función: 	suma A a HL por si da más de 255
; entrada: 	A, HL
; salida: 	A + HL
; toca:		A, HL
suma_A_HL:
	ADD		 L
	LD		 L, A
	ADC		 H
	SUB		 L
	LD		 H, A
fin_suma_A_HL:
	RET
	
	
;;=====================================================
;;TEST_OK
;;=====================================================	
; función: para pruebas.. cambia el color de fondo cuando se le llama
test_OK:
	EXX
	
	LD		 A, 15
	
	LD 		(FORCLR), A
	INC		HL
	
	LD 		(BAKCLR), A
	INC		HL
	
	LD		 A, (HL)
	LD 		(BDRCLR), A
	
	CALL	CHGCLR 
	
	EXX
fin_test_OK:
	RET
