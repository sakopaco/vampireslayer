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
datos_cienpies:
					DB		0	;(activo_tipo)si inactivo = 0 si <> 0 es el tipo de enemigo
					;aquí se usará el xor
					DB		0	;(escena) sprite a mostrar 1/2 
					DB		0	;(cont_sig_escena)retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
					DB		0	;(tiemp_cam_escena)cada cuantas iteraciones se cambiará la escena
					DB		0	;(energia)energía del enemigo antes de morir
					DB		0	;(pos_x)pos x para mover y punto central del sprite para revisar disparo
					DB		0	;(pos_y)pos y para mover y punto central del sprite para revisar disparo
					DB		0	;(radiox)radio x del enemigo para cuando se dispare encima
					DB		0	;(radioy)radio y del enemigo para cuando se dispare encima
					DB		0	;(inc_x)incremento x para mover
					DB		0	;(inx_y)incremento y para mover
					DB		0	;(radio)radio para movimientos circulares
					DB		0	;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
					DB		0	;(pasos)pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
;mezclo el ptr_sig_escena con el mover ya que son obligatorias no merece la pena tener 2
;ptr_sig_escena		DW		0	;funcion que cambia los sprites de la escena (según el nº de sprites será distinta)
					DW		mover_cienpies	;(ptr_mover)puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
;se pondrán 8 sprites: 4 por si hay enemigos de hasta 4 sprites y por 2 por usar 2 escenas... si se usan 3 habría que ampliar
sprite_1a			DB		0
sprite_2a			DB		0
sprite_3a			DB		0
sprite_4a			DB		0
sprite_1b			DB		0
sprite_2b			DB		0
sprite_3b			DB		0
sprite_4b			DB		0
sprite_1c			DB		0
sprite_2c			DB		0
sprite_3c			DB		0
sprite_4c			DB		0
sprite_1d			DB		0
sprite_2d			DB		0
sprite_3d			DB		0
sprite_4d			DB		0
color1				DB		0	;color sprite 1
color2				DB		0	;color sprite 2
color3				DB		0	;color sprite 3
color4				DB		0	;color sprite 4
	ENDSTRUCT;ESTRUCTURA_ENEMIGO

datos_muerto:
		


		
					
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
