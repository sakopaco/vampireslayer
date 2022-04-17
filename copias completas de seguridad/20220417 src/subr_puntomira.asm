;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	
			

;;=====================================================
;;INICIALIZA_PUNTOMIRA
;;=====================================================	
; función: 	inicializa las variables de la estructura del punto de mira
; entrada: 	datos_delasdistintasayudas, variable estructura_ayuda_ayudaquesea
; salida: 	lista_ayudas
; toca:		HL, DE, BC
inicializa_punto_mira:
		LD			HL, datos_puntomira
		LD			DE, puntomira
		JP			carga_datos_puntomira
fin_inicializa_punto_mira:	
	
	
;;=====================================================
;;CARGA_DATOS_PUNTOMIRA
;;=====================================================	
; función: 	carga los datos de la ayuda de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
;			en realidad carga cualquier dato de 5 bytes
; entrada:
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_puntomira:
		LD			BC, ESTRUCTURA_PUNTOMIRA;ESTRUCTURA_PUNTOMIRA ;equivale a 8.. el tamaño de la estructura en bytes
		LDIR
fin_carga_datos_puntomira:
		RET
	
	
;;=====================================================
;;ACCION_BOTON1
;;=====================================================	
; función: 	acción cuando se pulsa botón priario (disparo normal)
; entrada:	A datos del byte de disparo que se obtiene de mira_disparo, prota_reliquias
; salida: 	-
; toca:		-
accion_boton1:
		;cambio colores del sprite
		LD			IX, puntomira
		LD			 A, (IX + ESTRUCTURA_PUNTOMIRA.escena)
		CPL		 
		LD			(IX + ESTRUCTURA_PUNTOMIRA.escena), A
		;reseteo cadencia para el próximo disparo
		LD			 A, LIMCADENCIA				;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		LD			(IX + ESTRUCTURA_PUNTOMIRA.cadencia), A		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		
		;ejecuto sonido						;; ajustar cadencia y que cuando el disparo sea efectivo se reseteen los colores
		XOR			 A
		LD			 C, 1
		CALL		ayFX_INIT
			
		;examino si el disparo le dió a algo activo
		JP			check_colisiones_objetos	;revisa las colisiones con puertas, ayudas y enemigos
fin_accion_boton1:


;;=====================================================
;;ACCION_BOTON2
;;=====================================================	
; función: 	acción cuando se pulsa botón secundario (tira bomba - reliquia)
; entrada:	A datos del byte de disparo que se obtiene de mira_disparo, prota_reliquias
; salida: 	-
; toca:		-
accion_boton2:	
		LD		 A, (prota_reliquias)	;miro si le quedan reliquias
		OR		 A
		RET		 Z						;si no le quedan salgo ya
	
		;actuaciones si se usa la reliquia botón 2 o M y quedn reliquias.. (antes ya se puso el valor en A)
		LD		A, (prota_reliquias)
		DEC		 A
		LD		(prota_reliquias), A
	
		LD		 A, 1
		LD		 C, A
		CALL	ayFX_INIT
	
		CALL 	efecto_imagen_tira_reliquia
	
		JP		pinta_reliquias
fin_accion_boton2:


