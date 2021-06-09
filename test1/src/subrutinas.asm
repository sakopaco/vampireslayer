;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	

sub_preparapantalla:
	;toca A y Z
elimina_clic;
	XOR		 A
	LD		(CLIKSW),A
fin_elimina_clic:

	;toca A
limpia_pantalla:
	XOR			A
	CALL 		CLS
fin_limpia_pantalla:

	;toca A y direcciones #F3E9/#F3EA/#F3EB
set_color:
	LD		 A,2				;verde oscuro
	LD 		(FORCLR),A
	LD		 A,1				;negro
	LD 		(BAKCLR),A
	LD		 A,1				;negro
	LD 		(BDRCLR),A
	CALL	CHGCLR  
fin_set_color:
	
	;cambiamos a SCREEN 2,2 del BASIC
	;toca A
screen2:
	LD		 A,2
	CALL	CHGMOD			;selecciona screen 2
sprites_16_16:
	LD		 A,(RG1SAV)
	OR		00000010b		;fuerza sprites de 16x16
	LD		(RG1SAV),A		;no lo guardamos en la copia de variables del sistema
	LD		 B,A
	LD		 C,1
	JP		WRTVDP			;opción alternativa de escribir las tres lineas siguientes
	;~ CALL	WRTVDP			;lo escribe en el registro 1 del VDP
	;~ RET
fin_sub_preparapantalla:
	
	
