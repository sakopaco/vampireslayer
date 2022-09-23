;;=====================================================
;;VARIABLES TIEMPO
;;=====================================================
;~ tiempo:
;~ segundos:					DB	0
;~ minutos:						DB	0
;~ contador:					DB	0


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;ACTUALIZA_CONTADORES_TIEMPO
;;=====================================================	
; función: controla un contador 1/50 y segundos y minutos
			;~ XOR				 A
			;~ LD				(minutos),  A
			;~ LD				(segundos), A
			;~ LD				(contador), A
;~ loop_cambionivel:
			;~ CALL			actualiza_contadores_tiempo
			;~ LD				 A, (segundos)
			;~ CP				 5
			;~ JP				NZ, loop_cambionivel	
actualiza_contadores_tiempo:
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
fin_actualiza_contadores_tiempo:
