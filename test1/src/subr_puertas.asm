;;=====================================================
;;SUBRUTINAS RELACIONADAS CON LAS PUERTAS
;;=====================================================

;;=====================================================
;;INICIALIZA_PUERTAS
;;=====================================================	
; función: 	inicializa las variables de estructuras de ayuda del array lista_puertas
; entrada: 	*********************datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_puertas:
	;inicializa puerta arriba
	LD		HL, datos_ballesta
	LD		DE, ayuda_ballesta
	CALL	carga_datos_puerta
	;inicializa puerta derecha
	;inicializa puerta abajo
	;inicializa puerta izquierda
fin_inicializa_puertas:
	RET





;;=====================================================
;;CARGA_DATOS_PUERTA
;;=====================================================	
; función: 	carga los datos de la puerta de una variable con los datos de la puerta
; entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_puerta:
	LD		BC, ESTRUCTURA_PUERTA ;el tamaño de la estructura en bytes
	LDIR
fin_carga_datos_puerta:
	RET


;;=====================================================
;;ACCION_PUERTA_ARRIBA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_arriba:
fin_accion_puerta_arriba:
	RET


;;=====================================================
;;ACCION_PUERTA_DERECHA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_derecha:
fin_accion_puerta_derecha:
	RET
	

;;=====================================================
;;ACCION_PUERTA_ABAJO
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_abajo:
fin_accion_puerta_abajo:
	RET
	
	
;;=====================================================
;;ACCION_PUERTA_IZQUIERDA
;;=====================================================	
; función: 	
; entrada: 	
; salida: 	
accion_puerta_izquierda:
fin_accion_puerta_izquierda:
	RET
