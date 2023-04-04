;;=====================================================
;;CONTANTES PUNTOMIRA
;;=====================================================
datos_puntomira:			
				DB		POSXPM		;posición X de los sprites del punto de mira
				DB		POSYPM		;posición Y de los sprites del punto de mira
				DB		0			;valores posibles 0 (blanco+rojo en punto de mira) y NEG 0 (al revés)
				DB		0			;velocidad (por si lo pongo variable)
				DB		4			;cadencia
				DB		SPRI_DANO1A	;valor en pos de memoria del sprite grande del punto de mira
				DB		SPRI_DANO1B	;valor en pos de memoria del sprite pequeño del punto de mira
				
				
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
		LD			BC, ESTRUCTURA_PUNTOMIRA;ESTRUCTURA_PUNTOMIRA ;equivale a 8.. el tamaño de la estructura en bytes
		LDIR
fin_inicializa_punto_mira:	
	
	
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
		LD			 A, SONIDODISPARO	;1
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
; toca:		HL
accion_boton2:	
			LD			 A, (prota_reliquias)	;miro si le quedan reliquias
			OR			 A
			RET			 Z						;si no le quedan salgo ya
	
			;actuaciones si se usa la reliquia botón 2 o M y quedn reliquias.. (antes ya se puso el valor en A)
			DEC			 A
			LD			(prota_reliquias), A
	
			LD			 A, SONIDOBOMBA		;2
			CALL		ayFX_INIT
	
			CALL 		efecto_imagen_tira_reliquia
		
			CALL		efecto_enemigos_tira_reliquia
	
			JP			pinta_reliquias
fin_accion_boton2:


;;=====================================================
;;EFECTO_ENEMIGOS_TIRA_RELIQUIA
;;=====================================================
; funcion:	Mata enemigos de una pantalla o resta vida (mucha) a jefes enemigos.
efecto_enemigos_tira_reliquia:


;ñññññññññ


;es enemigo jefe
		LD		 B, 6
		
		LD		 A, (prota_pos_mapy);primero miro la posición y. los jefes están en la 6 (7 en realidad)
		CP		 B
		JP		 Z, enemigo_jefe
		
		LD		 A, (prota_nivel)	;si el nivel es 6 (7 en realidad) son todos jefes)
		CP		 B
		JP		 Z, enemigo_jefe

;tira bomba a enemigo NO JEFE
enemigo_nojefe:
		LD		IX, enemigos
		LD		 B, 7
		LD		 C, 2
		
.loop:	
.examina_enemigo:
		LD			 A, (IX)
		CP			 C
		JP			 C, .fin_examina_enemigo
		
		PUSH		BC
		CALL		mata_enemigo
		POP			BC	
.fin_examina_enemigo:
		CALL		pasa_siguiente_enemigo
		DJNZ	.loop
		RET
		
;tira bomba a enemigo JEFE --- nota: se mantiene el bucle porque el últio enemigo (drácula) es equivalente a 3 enemigos
enemigo_jefe:
		LD		IX, enemigos
		LD		 B, 5
		LD		 C, 2
		
.loopjefe:	
.examina_enemigojefe:
		LD			 A, (IX)
		CP			 C
		JP			 C, .fin_examina_enemigojefe
		
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
		SUB			PROTADANORELIQUIA
		JP			NC, .fin_examina_enemigojefe
		
		PUSH		BC
		CALL		mata_enemigo
		POP			BC
.fin_examina_enemigojefe:
		LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se resta la energía que 
		CALL		pasa_siguiente_enemigo
		DJNZ	.loopjefe
		RET
fin_efecto_enemigos_tira_reliquia:


pasa_siguiente_enemigo:
		[23]	INC			IX
		;ññññññññññññññññññ
fin_pasa_siguiente_enemigo:
		RET

