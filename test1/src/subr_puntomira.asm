;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

dano_actual:
			DB		2	;daño actual cuando el prota dispara

estrucrura_pm:	
			DS		ESTRUCTURA_PUNTOMIRA	

datos_puntomira:			
			DB		POSXPM				;posición X de los sprites del punto de mira
			DB		POSYPM				;posición Y de los sprites del punto de mira
			DB		0					;valores porsibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
			DB		0					;incrementos extras para mover el punto de mira
			DB		0					;si se ha pulsado el botón 2
			DB		LIMCADENCIA			;velocidad de disparo si botón pulsado
			DB		DANO1				;daño que hace por defecto	
			DB		DANO2				;daño que hace con la ballesta mejorada
			DW		sprite_punto_mira_1	;dibujo de 16 x 16 del punto de mira 1
			DW		sprite_punto_mira_2	;dibujo de 16 x 16 del punto de mira 2
			DW		sprite_punto_mira_1_mejorado	;dibujo de 16 x 16 del punto de mira 1 (versión ballesta extra)
			DW		sprite_punto_mira_2_mejorado	;dibujo de 16 x 16 del punto de mira 2 (versión ballesta extra)
			DW		cambiar_ballesta	;función para intercambiar una ballesta con otra (mira variable prota_dano)
			DW		accion_boton2		;acción si se pulsa el botón 2
			

;;=====================================================
;;INICIALIZA_PUNTOMIRA
;;=====================================================	
; función: 	inicializa las variables de la estructura del punto de mira
; entrada: 	datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_punto_mira:
	;oracion
	LD		HL, datos_puntomira
	LD		DE, estrucrura_pm
	CALL	carga_datos_puntomira
fin_inicializa_punto_mira:	
	
	
;;=====================================================
;;CARGA_DATOS_PUNTOMIRA
;;=====================================================	
; función: 	carga los datos de la ayuda de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
;entrada
;			en realidad carga cualquier dato de 15 bytes
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_puntomira:
	LD		BC, 15;ESTRUCTURA_AYUDA ;equivale a 16.. el tamaño de la estructura en bytes
	LDIR
fin_carga_datos_puntomira:
	RET
	
	
cambiar_ballesta:
fin_cambiar_ballesta:
	RET

accion_boton2:
fin_accion_boton2:
	RET
