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

;ya no se usa esta función pero la guardo por si acaso y para futuros proyectos
;~ ;;=====================================================
;~ ;;BORRA_PANTALLA_INICIO
;~ ;;=====================================================	
;~ ; función: 	borra la pantalla de inicio de una forma chula caracter a caracter
;~ ; entrada: 	-
;~ ; salida: 	-
;~ ; toca:		AF, BC
;~ borra_pantalla_inicio:
			;~ LD			 BC, 256	;tiles por pantalla en screen2 - 1 (768 total)
			;~ LD			 DE, 0		;posición tile "vacio"
;~ .loop:
			;~ PUSH		BC
				;~ LD			BC, TILMAP + 256
				;~ LD			 A, E
				;~ CALL	suma_A_BC
			
				;~ CALL		pinta_tile_suelto
				;~ INC			 E
		
				;~ LD			 BC, 850
				;~ CALL		retardo16bits
			;~ POP			BC
			;~ DEC			BC
			;~ LD			 A, B
			;~ OR			 C
			;~ JP			NZ, .loop
			
			;~ JP			limpia_pantalla_completa
;~ ;fin_borra_pantalla_inicio:

