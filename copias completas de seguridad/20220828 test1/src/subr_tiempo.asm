;;=====================================================
;;VARIABLES TIEMPO
;;=====================================================
;~ tiempo:
;~ segundos:					DB	0
;~ contador:					DB	0


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;ACTUALIZA_CONTADORES_TIEMPO
;;=====================================================	
; función: controla un contador 1/50 y segundos y minutos
actualiza_contadores_tiempo:
			LD				IX, tiempo

			LD				 A, (IX + 1)
			INC				 A
			CP				50
			JP				 Z, avanza_segundos
			LD				(IX + 1), A
			RET
avanza_segundos:
			XOR				 A
			LD				(IX + 1), A
			INC				(IX)	; incremento segundos
			RET
fin_actualiza_contadores_tiempo:
