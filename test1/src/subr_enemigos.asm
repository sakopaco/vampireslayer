;;=====================================================
;;SUBRUTINAS MANEJO DE OBJETOS AYUDA
;;=====================================================	

;;=====================================================
;;VARIABLES
;;=====================================================

;las posiciones iniciales dependerán de los últimos 3 bits del registro R
;nota: se pone un 0 de más para simplificar el bucle de selección
posiciones_iniciales_cienpies_x:
		DB			0,0,0,0,0,0,0,0,0

posiciones_iniciales_cienpies_y:
		DB			0,0,0,0,0,0,0,0,0

enemigo1			DS	ESTRUCTURA_ENEMIGO
enemigo2			DS	ESTRUCTURA_ENEMIGO
enemigo3			DS	ESTRUCTURA_ENEMIGO
enemigo4			DS	ESTRUCTURA_ENEMIGO
enemigo5			DS	ESTRUCTURA_ENEMIGO
enemigo6			DS	ESTRUCTURA_ENEMIGO
enemigo7			DS	ESTRUCTURA_ENEMIGO
enemigo8			DS	ESTRUCTURA_ENEMIGO
enemigo9			DS	ESTRUCTURA_ENEMIGO


;;=====================================================
;;DATOS_ENEMIGOS (EQUIVALE A PLANTILLAS)
;;=====================================================
datos_cienpies:
					DB		2	;(activo_tipo)si inactivo = 0 si <> 0 es el tipo de enemigo
					;aquí se usará el xor
					DB		0	;(escena) sprite a mostrar 1/2 
					DB		0	;(cont_sig_escena)retardo_explosion ;contador para ver cuando cambiar de sprite (y retardo_explosión irá hasta cero antes de que desaparezca la explosión)
					DB		0	;(tiemp_cam_escena)cada cuantas iteraciones se cambiará la escena
					DB		10	;(energia)energía del enemigo antes de morir
					DB		0	;(pos_x)pos x para mover y punto central del sprite para revisar disparo
					DB		0	;(pos_y)pos y para mover y punto central del sprite para revisar disparo
					DB		8	;(radiox)radio x del enemigo para cuando se dispare encima
					DB		8	;(radioy)radio y del enemigo para cuando se dispare encima
					DB		0	;(inc_x)incremento x para mover
					DB		0	;(inx_y)incremento y para mover
					DB		0	;(radio)radio para movimientos circulares
					DB		0	;(direccion) 0 derecha <> 0 izquierda // 0 abajo <> 0 arriba
					DB		0	;(pasos)pasos para no comprobar los límites de pentalla, sólo si pasos ha llegado a 0
;mezclo el ptr_sig_escena con el mover ya que son obligatorias no merece la pena tener 2
;ptr_sig_escena		DW		0	;funcion que cambia los sprites de la escena (según el nº de sprites será distinta)
					DW		mover_cienpies	;(ptr_mover)puntero a subrutina que moverá el enemigo según el tipo de enemigo (se pasa al inicializar)
;se pondrán 8 sprites: 4 por si hay enemigos de hasta 4 sprites y por 2 por usar 2 escenas... si se usan 3 habría que ampliar
					DB		7 	;(sprite_1a)
					DB		0 	;(sprite_2a)
					DB		0 	;(sprite_3a)
					DB		0 	;(sprite_4a)
					DB		8 	;(sprite_1b)
					DB		0 	;(sprite_2b)
					DB		0 	;(sprite_3b)
					DB		0 	;(sprite_4b)
					DB		0 	;(sprite_1c)
					DB		0 	;(sprite_2c)
					DB		0 	;(sprite_3c)
					DB		0 	;(sprite_4c)
					DB		0 	;(sprite_1d)
					DB		0 	;(sprite_2d)
					DB		0 	;(sprite_3d)
					DB		0 	;(sprite_4d)
					DB		2	;(color1) color sprite 1
					DB		0	;(color2) color sprite 2
					DB		0	;(color3) color sprite 3
					DB		0	;(color4) color sprite 4
					DB		3	;(plano sprite_1)
					DB		0	;(plano sprite_2)
					DB		0	;(plano sprite_3)
					DB		0	;(plano sprite_4)
					


datos_serpiente:
datos_arana:
datos_murcielago:
datos_lobo:
datos_esqueleto:
datos_zombi:
datos_fantasma:
datos_caballerogris:
datos_caballeronegro:
datos_fuego:
datos_magia:
datos_jefelobo:
datos_jefemurcielago:
datos_jefefatasma:
datos_jefezombie:
datos_jefecaballero:
datos_jefebeholder:
datos_manoderecha:
datos_manoizquierda:
datos_conde:

					
;;=====================================================
;;SUBRUTINAS
;;=====================================================
;;=====================================================
;;RESETEA_ENEMIGOS
;;=====================================================	
; función: 	inicializa todos los enemigos a tipo 0 (muerto) ... incluso los que no van a salir porque se verifican todos
; entrada:	-
; salida: 	-
; toca:		-
resetea_enemigos:
		XOR			 A
		LD			IX, enemigo1
		LD			(IX), A
		LD			IX, enemigo2
		LD			(IX), A
		LD			IX, enemigo3
		LD			(IX), A
		LD			IX, enemigo4
		LD			(IX), A
		LD			IX, enemigo5
		LD			(IX), A
		LD			IX, enemigo6
		LD			(IX), A
		LD			IX, enemigo7
		LD			(IX), A
		LD			IX, enemigo8
		LD			(IX), A
		LD			IX, enemigo9
		LD			(IX), A
fin_resetea_enemigos:
		RET


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE1
;;=====================================================	
; función: 	inicializa las variables que serán usadas e el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase0_nivel0:
		CALL		resetea_enemigos
		
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies2
fin_inicializa_enemigos_fase0_nivel0:
		

;;=====================================================
;;ACTUALIZA_VALORES_CIENPIES
;;=====================================================	
; función: 	inicializa valores aleatorios del cienpies: posicion inicial (posx, posy) en la posición de enemigo que se le pase por IX
;	 nota:  la versión 2 lo que hace es cambiar el plano para cuando hay dos cienpies en la misma pantalla
; entrada:	IX que equivaldrá a qué nº de enemigo estamos inicializando (por ejemplo enemigo1)
; salida: 	-
; toca:		-
actualiza_valores_cienpies:
		LD			 A, 3
		LD			(IX + ESTRUCTURA_ENEMIGO.planosprite1), A
		JP			actualiza_valores_aleatorios_cienpies
fin_actualiza_valores_cienpies:
actualiza_valores_cienpies2:
		LD			 A, 3
		LD			(IX + ESTRUCTURA_ENEMIGO.planosprite1), A
		JP			actualiza_valores_aleatorios_cienpies
fin_actualiza_valores_cienpies2:

actualiza_valores_aleatorios_cienpies:
		LD			 A, R
		AND			00000111b
		LD			 B, A
		LD			 D, A
		LD			HL, posiciones_iniciales_cienpies_x
.incrementa_posx:
		INC			HL
		DJNZ		.incrementa_posx
		
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posx), A
		
		LD			 B, D
		LD			HL, posiciones_iniciales_cienpies_y
.incrementa_posy:
		INC			HL
		DJNZ		.incrementa_posy	
		
		LD			 A, (HL)
		LD			(IX + ESTRUCTURA_ENEMIGO.posy), A
fin_actualiza_valores_aleatorios_cienpies:
		RET	


;;=====================================================
;;ANADE_ENEMIGO_CIENPIES
;;=====================================================	
; función: 	mete en memoria la plantilla de datos base del cienpies en el enemigo que se le pase por DE
; entrada:	DE (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
anade_enemigo_cienpies
		LD			HL, datos_cienpies
		LD			BC, ESTRUCTURA_ENEMIGO
		LDIR
fin_anade_enemigo_cienpies:
		RET


;;=====================================================
;;MOVER_CIENPIES
;;=====================================================	
; función: hace todo lo que haga falta de acciones cada vez que le toca al prograa enfocarse en el cienpies: su ataque, su sptrite, etc...
; entrada: E (enemigo en concreto al que poner los datos, por ejemplo, enemigo1)
; salida: 	-
; toca:		-
mover_cienpies:
fin_mover_cienpies:
		RET




inicializa_enemigos_fase0_nivel2:
inicializa_enemigos_fase0_nivel3:
inicializa_enemigos_fase0_nivel4:
inicializa_enemigos_fase0_nivel5:
inicializa_enemigos_fase0_nivel6:
inicializa_enemigos_fase0_nivelboss:

inicializa_enemigos_fase1_nivel1:
inicializa_enemigos_fase1_nivel2:
inicializa_enemigos_fase1_nivel3:
inicializa_enemigos_fase1_nivel4:
inicializa_enemigos_fase1_nivel5:
inicializa_enemigos_fase1_nivel6:
inicializa_enemigos_fase1_nivelboss:

inicializa_enemigos_fase2_nivel1:
inicializa_enemigos_fase2_nivel2:
inicializa_enemigos_fase2_nivel3:
inicializa_enemigos_fase2_nivel4:
inicializa_enemigos_fase2_nivel5:
inicializa_enemigos_fase2_nivel6:
inicializa_enemigos_fase2_nivelboss:

inicializa_enemigos_fase3_nivel1:
inicializa_enemigos_fase3_nivel2:
inicializa_enemigos_fase3_nivel3:
inicializa_enemigos_fase3_nivel4:
inicializa_enemigos_fase3_nivel5:
inicializa_enemigos_fase3_nivel6:
inicializa_enemigos_fase3_nivelboss:

inicializa_enemigos_fase4_nivel1:
inicializa_enemigos_fase4_nivel2:
inicializa_enemigos_fase4_nivel3:
inicializa_enemigos_fase4_nivel4:
inicializa_enemigos_fase4_nivel5:
inicializa_enemigos_fase4_nivel6:
inicializa_enemigos_fase4_nivelboss:

inicializa_enemigos_fase5_nivel1:
inicializa_enemigos_fase5_nivel2:
inicializa_enemigos_fase5_nivel3:
inicializa_enemigos_fase5_nivel4:
inicializa_enemigos_fase5_nivel5:
inicializa_enemigos_fase5_nivel6:
inicializa_enemigos_fase5_nivelboss:

inicializa_enemigos_fase6_nivel1:
inicializa_enemigos_fase6_nivel2:
inicializa_enemigos_fase6_nivel3:
inicializa_enemigos_fase6_nivel4:
inicializa_enemigos_fase6_nivel5:
inicializa_enemigos_fase6_nivel6:
inicializa_enemigos_fase6_nivelboss:
