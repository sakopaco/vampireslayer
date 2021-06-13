;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;PREPARAPANTALLA
;;=====================================================	
; función: elimina clic cuando se pulsa tecla, cls, screen 2,2
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
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
	

;;=====================================================
;;PINTA_PANTALLA_COMPLETA
;;=====================================================	
; función: pinta el escenario, las 3 partes
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_pantalla_completa:
	CALL 	pinta_parte_superior_pantalla
	
	CALL 	pinta_parte_inferior_pantalla
fin_pinta_pantalla_completa:
	RET


;;=====================================================
;;PINTA_PARTE_SUPERIOR_PANTALLA
;;=====================================================	
; función: pinta el escenario, las 2 partes superiores y actualiza puertas
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_parte_superior_pantalla:

;aquí deberíamos ver qué habitación es (por el nº de puertas, enemigos, si es final y teine escalera, etc) dentro de qué nivel

	;cangando banco 1
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla11
	LD		DE,#0000
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla11
	LD		DE,#1800
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla11
	LD		DE,#2000
	LD		BC,256*8*1
	CALL	LDIRVM
	
	;cangando banco 2
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla12
	LD		DE,#0800
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla12
	LD		DE,#1900
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla12
	LD		DE,#2800
	LD		BC,256*8*1
	CALL	LDIRVM
	
	;actualiza numero de puertas
	;CALL	actualiza_puertas
fin_pinta_parte_superior_pantalla:
	RET


;;=====================================================
;;PINTA_PARTE_INFERIOR_PANTALLA
;;=====================================================	
; función: pinta la parte inferior del escenario que es común
; entrada: -
; salida: -
; toca: si no son todos los regristros, casi todos
pinta_parte_inferior_pantalla:
	;cangando banco 3
	;cargamos los patrones
	LD		HL,tiles_patrones_pantalla3
	LD		DE,#1000
	LD		BC,256*8*1
	CALL	LDIRVM		
	;cargamos mapa de pantalla
	LD		HL,tiles_mapa_pantalla3
	LD		DE,#1A00
	LD		BC,256*1
	CALL	LDIRVM
	;cargamos los colores de los patrones
	LD		HL,tiles_color_pantalla3
	LD		DE,#3000
	LD		BC,256*8*1
	CALL	LDIRVM
	


	;CALL	actualiza_vidas
	;CALL	actualiza_energia
	;CALL	actualiza_reliquias
	;CALL	actualiza_nivel
	;CALL	actualiza_tiempo
	;CALL	actualiza_mapa
	;CALL	actualiza_posición
fin_pinta_parte_inferior_pantalla:
	RET
