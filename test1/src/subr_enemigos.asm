;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

array_dano_enemigo:	;la posición dependerá del tipo
						DB	5,5,5,5,5,5,5,5,5,5,5,5
					
plantilla_cienpies			ESTRUCTURA_ENEMIGO
plantilla_serpiente			ESTRUCTURA_ENEMIGO
plantilla_arana				ESTRUCTURA_ENEMIGO
plantilla_murcielago		ESTRUCTURA_ENEMIGO
plantilla_lobo				ESTRUCTURA_ENEMIGO
plantilla_zombi				ESTRUCTURA_ENEMIGO
plantilla_fantasma			ESTRUCTURA_ENEMIGO
plantilla_caballerogris		ESTRUCTURA_ENEMIGO
plantilla_caballeronegro	ESTRUCTURA_ENEMIGO
plantilla_fuego				ESTRUCTURA_ENEMIGO
plantilla_magia				ESTRUCTURA_ENEMIGO
plantilla_jefelobo			ESTRUCTURA_ENEMIGO
plantilla_jefemurciélago	ESTRUCTURA_ENEMIGO
plantilla_jefefantasma		ESTRUCTURA_ENEMIGO
plantilla_jefezobie			ESTRUCTURA_ENEMIGO
plantilla_jefecaballero		ESTRUCTURA_ENEMIGO
plantilla_jefebeholder		ESTRUCTURA_ENEMIGO
plantilla_manoderecha		ESTRUCTURA_ENEMIGO
plantilla_manoizquierda		ESTRUCTURA_ENEMIGO
plantilla_conde				ESTRUCTURA_ENEMIGO

					
;;=====================================================
;;SUBRUTINAS
;;=====================================================


;;=====================================================
;;INICIALIZA_ENEMIGOS
;;=====================================================	
; función: 	inicializa las variables "plantilla"
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos:
fin_inicializa_enemigos:
		RET


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE
;;=====================================================	
; función: 	inicializa las variables que serán usadas e el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase:
fin_inicializa_enemigos_fase:
		RET
