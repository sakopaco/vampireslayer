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
		ADD		 	 C
		LD			 C, A
		ADC			 B
		SUB			 C
		LD		 	 B, A
fin_suma_A_BC:
		RET
		
		
;;=====================================================
;;SUMA_A_DE
;;=====================================================	
; función: 	suma A a DE por si da más de 255
; entrada: 	A, DE
; salida: 	A + DE
; toca:		A, DE
suma_A_DE:
		ADD		 	 E
		LD			 E, A
		ADC			 D
		SUB			 E
		LD		 	 D, A
fin_suma_A_DE:
		RET
	
	
;;=====================================================
;;SUMA_A_HL
;;=====================================================	
; función: 	suma A a HL por si da más de 255
; entrada: 	A, HL
; salida: 	A + HL
; toca:		A, HL
suma_A_HL:
		ADD		 	 L
		LD		 	 L, A
		ADC		 	 H
		SUB		 	 L
		LD		 	 H, A
fin_suma_A_HL:
		RET
	
	
;;=====================================================
;;TEST_OK
;;=====================================================	
; función: para pruebas.. cambia el color de fondo cuando se le llama
test_OK:
	PUSH	AF
	
	LD		 A, 15
	
	LD 		(FORCLR), A
	INC		HL
	
	LD 		(BAKCLR), A
	INC		HL
	
	LD		 A, (HL)
	LD 		(BDRCLR), A
	
	CALL	CHGCLR 
	
	POP		AF
fin_test_OK:
	RET


;;=====================================================
;;CARGA_VALORES_INICIALES_VARIABLES
;;=====================================================	
; función: 	subrutina para poder usar la página 2 de memoria
; entrada: 	
; salida: 	
; toca:		HL, A, C (y seguramente más)
carga_valores_iniciales_variables:
		LD			HL, inicializacion_variables
		LD			DE, #C000
		LD			BC, fin_inicializacion_variables - inicializacion_variables
		LDIR
fin_carga_valores_iniciales_variables:
		RET


;;=====================================================
;;RETARDO16BITS
;;=====================================================	
; función: 	crea un retardo según lo que se le pase en BC
; entrada: 	BC
; salida: 	
; toca:		BC
retardo16bits:		
.loop:
		DEC			BC
		LD			 A, B
		OR			 C
		JP			NZ, .loop
fin_retardo16bits:
		RET


;;=====================================================
;;RETARDO8BITS
;;=====================================================	
; función: 	crea un retardo según lo que se le pase en B
; entrada: 	B
; salida: 	
; toca:		B
retardo8bits:		
.loop:
		NOP
		DJNZ		.loop
fin_retardo8bits:
		RET
