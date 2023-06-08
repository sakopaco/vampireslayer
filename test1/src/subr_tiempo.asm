;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;RESETEA_TIEMPO
;;=====================================================	
; función: pone el croómetro a 0 para contar 2 mins. para salir del castillo
resetea_tiempo:
		LD			(contador), A
		LD			(segundos), A
		LD			(minutos),  A
fin_resetea_tiempo:
		RET


;;=====================================================
;;INCREMENTA_RELOJ
;;=====================================================	
; función: controla un contador 1/50 y segundos y minutos
; nota importante: este código es una adaptación del del Fernando García en su
; curso de ensamblador. Muchas gracias. Si se quiere reproducir cotacten con el (@bitvision) 
incrementa_reloj:
			LD				IX, tiempo

			LD				 A, (IX + 2)
			INC				 A
			CP				50
			JR				 Z, avanza_segundos
			LD				(IX + 2), A
			RET
avanza_segundos:
			XOR				 A
			LD				(IX + 2), A
			
			LD				 A, (IX + 1)
			INC				 A
			CP				60
			JR				 Z, avanza_minutos
			LD				(IX + 1), A
			RET
avanza_minutos:
			XOR				 A
			LD				(IX + 1), A
			
			INC				(IX)	; incremento minutos
			RET
fin_incrementa_reloj:


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
		JR			NZ, .loop
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


;;=====================================================
;;ESPERA_ESTANDAR
;;=====================================================	
; función: espera un tiempo aceptable para leer un texto
espera_estandar:
		LD			 B, 6
.loop_espera:
		PUSH		BC
		LD			BC, 60000
		CALL		retardo16bits
		POP			BC
		DJNZ		.loop_espera
fin_espera_estandar:
		RET
