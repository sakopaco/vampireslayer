;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

array_dano_enemigo:	;la posición dependerá del tipo
		DB	5,5,5,5,5,5,5,5,5,5,5,5

muerto				ESTRUCTURA_ENEMIGO					
cienpies			ESTRUCTURA_ENEMIGO
serpiente			ESTRUCTURA_ENEMIGO
arana				ESTRUCTURA_ENEMIGO
murcielago			ESTRUCTURA_ENEMIGO
lobo				ESTRUCTURA_ENEMIGO
zombi				ESTRUCTURA_ENEMIGO
fantasma			ESTRUCTURA_ENEMIGO
caballerogris		ESTRUCTURA_ENEMIGO
caballeronegro		ESTRUCTURA_ENEMIGO
fuego				ESTRUCTURA_ENEMIGO
magia				ESTRUCTURA_ENEMIGO
jefelobo			ESTRUCTURA_ENEMIGO
jefemurcieélago		ESTRUCTURA_ENEMIGO
jefefantasma		ESTRUCTURA_ENEMIGO
jefezobie			ESTRUCTURA_ENEMIGO
jefecaballero		ESTRUCTURA_ENEMIGO
jefebeholder		ESTRUCTURA_ENEMIGO
manoderecha			ESTRUCTURA_ENEMIGO
manoizquierda		ESTRUCTURA_ENEMIGO
condedracula		ESTRUCTURA_ENEMIGO


;;=====================================================
;;DATOS_ENEMIGOS (EQUIVALE A PLANTILLAS)
;;=====================================================
datos_muerto:
		

datos_cienpies:
		
					
;;=====================================================
;;SUBRUTINAS
;;=====================================================


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE
;;=====================================================	
; función: 	inicializa las variables que serán usadas e el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase:
		LD			HL, datos_cienpies
		LD			DE, cienpies
		CALL		carga_datos_enemigo
fin_inicializa_enemigos_fase:
		RET
		

;;=====================================================
;;CARGA_DATOS_ENEMIGO
;;=====================================================	
; función: 	carga los datos del enemigo de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
; entrada
;  hl: origen de datos
;  de: destino de datos
; salida: 	-
; toca:		HL, DE, BC
carga_datos_ayuda:
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_carga_datos_ayuda:
	RET
	

;;=====================================================
;;CARGA_DATOS_ENEMIGO_FASE1
;;=====================================================	
; función: 	carga los datos del enemigo de una variable dentro de la variable estructura (más carga y espacio que rellenar a pelo desde IX en adelante pero más simple)
; entrada
;  hl: origen de datos
carga_datos_ayuda:
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_carga_datos_ayuda:
	RET
