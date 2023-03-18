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
incrementa_reloj:
			LD				IX, tiempo

			LD				 A, (IX + 2)
			INC				 A
			CP				50
			JP				 Z, avanza_segundos
			LD				(IX + 2), A
			RET
avanza_segundos:
			XOR				 A
			LD				(IX + 2), A
			
			LD				 A, (IX + 1)
			INC				 A
			CP				60
			JP				 Z, avanza_minutos
			LD				(IX + 1), A
			RET
avanza_minutos:
			XOR				 A
			LD				(IX + 1), A
			
			INC				(IX)	; incremento minutos
			RET
fin_incrementa_reloj:
