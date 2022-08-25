;;=====================================================
;;VARIABLES TIEMPO
;;=====================================================
;~ tiempo:
;~ minutos:					DB	0
;~ segundos:					DB	0
;~ contador:					DB	0


;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================	


;;=====================================================
;;ACTUALIZA_CONTADORES
;;=====================================================	
; función: controla un contador 1/50 y segundos y minutos
actualiza_contadores:
			LD				 A, (IX + 2)
			INC				 A
			CP				60
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
			LD				(IX), A
			INC				(IX)
			RET
fin_actualiza_contadores:
