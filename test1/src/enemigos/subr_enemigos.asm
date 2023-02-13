;;=====================================================
;;ARRAY COMÚN DE ENEMIGOS
;;=====================================================	
;de cuántos sprites está formado el eneigo de tipo nº=posición en array... las posiciones 0 y 1 (desaparece y muerto) no cuentan
;spritesxenemigo:	DB	0,0,1,1,1,1,2,2,2,2,2,2,2,2,4,4,4,4,4,4,2,2,2
spritesxenemigo:	DB	0,0,1,1,1,1,0,0,0,0,0,0,0,0,2,2,2,2,2,2,1,1,0
;es más rápido si le resto a los de 2 sprites que son la mayoría le pongo el valor 0 a los de 1 los dejo con 1 y a los de 4 con 2 para realizar un if más rápido



;;=====================================================
;;SUBRUTINAS MANEJO DE ENEMIGOS
;;=====================================================	


;;=====================================================
;;INCLUDES AGRUPACION DATOS+SUBRUTINAS ENEMIGOS
;;=====================================================
include "subr_enemigo_cienpies.asm"
include "subr_enemigo_arana.asm"
include "subr_enemigo_murcielago.asm"
include "subr_enemigo_serpiente.asm"
include "subr_enemigo_lobo.asm"
include "subr_enemigo_jefelobo.asm"
include "subr_enemigo_esqueleto.asm"
include "subr_enemigo_zombi.asm"
include "subr_enemigo_jefemurcielago.asm"
include "subr_enemigo_fantasma.asm"
include "subr_enemigo_jefefantasma.asm"
include "subr_enemigo_caballerogris.asm"
include "subr_enemigo_jefezombi.asm"
include "subr_enemigo_fuego.asm"
include "subr_enemigo_jefecaballero.asm"
include "subr_enemigo_magia.asm"
include "subr_enemigo_jefebeholder.asm"
include "subr_enemigo_dracula.asm"
include "subr_enemigo_manod.asm"
include "subr_enemigo_manoi.asm"
		
		
;;=====================================================
;;SUBRUTINAS
;;=====================================================


;;=====================================================
;;RESETEA_ENEMIGOS
;;=====================================================	
; función: 	inicializa todos los enemigos a tipo 0 (muerto) ... incluso los que no van a salir porque se verifican todos
;			también los oculta sacándolos de pantalla (y = 208)
; entrada:	-
; salida: 	-
; toca:		-
resetea_enemigos:
;resetea tipo (no activo)
		XOR			 A	; 0 es inactivo
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

;ocultar sprites		
		LD			 B, 127
		LD			HL, array_sprites
.loop:
		LD			(HL), A
		INC			HL
		DJNZ		.loop
		
;actualiza vector de sprites
		CALL		render_sprites
fin_resetea_enemigos:
		RET


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 0
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase0:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase0_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase0_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase0_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase0_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase0_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase0_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase0_niveljefe
fin_inicializa_enemigos_fase0:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 1
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase1:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase1_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase1_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase1_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase1_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase1_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase1_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase1_niveljefe
fin_inicializa_enemigos_fase1:
		

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 2
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase2:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase2_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase2_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase2_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase2_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase2_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase2_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase2_niveljefe
fin_inicializa_enemigos_fase2:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 3
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase3:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase3_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase3_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase3_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase3_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase3_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase3_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase3_niveljefe
fin_inicializa_enemigos_fase3:

		
;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 4
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase4:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase4_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase4_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase4_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase4_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase4_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase4_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase4_niveljefe
fin_inicializa_enemigos_fase4:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 5
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase5:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase5_nivel0
		RET
.nivel1:
		DEC			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase5_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase5_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase5_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase5_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase5_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase5_niveljefe
fin_inicializa_enemigos_fase5:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE 6
;;=====================================================	
; función: 	inicializa las variables que serán usadas en el array en la fase
; entrada:	-
; salida: 	-
; toca:		-
inicializa_enemigos_fase6:	;; para no poner más complejo se hace uno por fase que se actualiza al pasar por escaleras o puerta inferior
		LD			 A, (prota_pos_mapy)
		OR			 A
.nivel0:
		JP			NZ, .nivel1
		CALL		inicializa_enemigos_fase6_nivel0
		RET
.nivel1:
		DEC			 A
		OR			 A
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase6_nivel1
		RET
.nivel2:
		DEC			 A
		OR			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase6_nivel2
		RET
.nivel3:
		DEC			 A
		OR			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase6_nivel3
		RET
.nivel4:
		DEC			 A
		OR			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase6_nivel4
		RET
.nivel5:
		DEC			 A
		OR			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase6_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase6_nivel6
fin_inicializa_enemigos_fase6:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE0_NIVELX
;;=====================================================	
inicializa_enemigos_fase0_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase0_nivel0:

inicializa_enemigos_fase0_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		JP			actualiza_valores_arana
fin_inicializa_enemigos_fase0_nivel1:

inicializa_enemigos_fase0_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana

		LD			DE, enemigo3
		JP			anade_enemigo_serpiente
fin_inicializa_enemigos_fase0_nivel2:

inicializa_enemigos_fase0_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo4
		JP			anade_enemigo_murcielago
fin_inicializa_enemigos_fase0_nivel3:

inicializa_enemigos_fase0_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo5
		JP			anade_enemigo_lobo
fin_inicializa_enemigos_fase0_nivel4:

inicializa_enemigos_fase0_nivel5:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		CALL		actualiza_valores_cienpies
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo5
		JP			anade_enemigo_lobo
fin_inicializa_enemigos_fase0_nivel5:

inicializa_enemigos_fase0_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on

		LD			DE, enemigo1
		JP			anade_enemigo_jefelobo
fin_inicializa_enemigos_fase0_niveljefe:
	

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE1_NIVELX
;;=====================================================	
inicializa_enemigos_fase1_nivel0:
		LD			DE, enemigo1
		JP			anade_enemigo_serpiente
fin_inicializa_enemigos_fase1_nivel0:

inicializa_enemigos_fase1_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		JP			actualiza_valores_arana		
fin_inicializa_enemigos_fase1_nivel1:

inicializa_enemigos_fase1_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		JP			anade_enemigo_murcielago
fin_inicializa_enemigos_fase1_nivel2:

inicializa_enemigos_fase1_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo4
		JP			anade_enemigo_lobo
fin_inicializa_enemigos_fase1_nivel3:

inicializa_enemigos_fase1_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		
		LD			DE, enemigo5
		JP			anade_enemigo_esqueleto
fin_inicializa_enemigos_fase1_nivel4:

inicializa_enemigos_fase1_nivel5: 						
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		
		LD			DE, enemigo5
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo6
		JP			anade_enemigo_zombi
fin_inicializa_enemigos_fase1_nivel5:

inicializa_enemigos_fase1_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on

		LD			DE, enemigo1
		CALL		anade_enemigo_jefemurcielago
		LD			IX, enemigo1
		JP			actualiza_valores_jefemurcielago
fin_inicializa_enemigos_fase1_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE2_NIVELX
;;=====================================================	
inicializa_enemigos_fase2_nivel0:
		LD			DE, enemigo1
		JP			anade_enemigo_serpiente
fin_inicializa_enemigos_fase2_nivel0:

inicializa_enemigos_fase2_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		JP			anade_enemigo_murcielago
fin_inicializa_enemigos_fase2_nivel1:

inicializa_enemigos_fase2_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo3
		JP			anade_enemigo_lobo
fin_inicializa_enemigos_fase2_nivel2:

inicializa_enemigos_fase2_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_lobo
		
		LD			DE, enemigo4
		JP			anade_enemigo_esqueleto
fin_inicializa_enemigos_fase2_nivel3:

inicializa_enemigos_fase2_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_lobo
		
		LD			DE, enemigo4
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo5
		JP			anade_enemigo_zombi
fin_inicializa_enemigos_fase2_nivel4:

inicializa_enemigos_fase2_nivel5: 							
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		CALL		anade_enemigo_lobo
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		JP			anade_enemigo_fantasma
fin_inicializa_enemigos_fase2_nivel5:

inicializa_enemigos_fase2_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on

		LD			DE, enemigo1
		JP			anade_enemigo_jefefantasma
fin_inicializa_enemigos_fase2_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE3_NIVELX
;;=====================================================	
inicializa_enemigos_fase3_nivel0:
		LD			DE, enemigo1
		JP			anade_enemigo_serpiente
fin_inicializa_enemigos_fase3_nivel0:

inicializa_enemigos_fase3_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		JP			actualiza_valores_arana
fin_inicializa_enemigos_fase3_nivel1:

inicializa_enemigos_fase3_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		JP			anade_enemigo_caballero
fin_inicializa_enemigos_fase3_nivel2:

inicializa_enemigos_fase3_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo4
		JP			anade_enemigo_esqueleto
fin_inicializa_enemigos_fase3_nivel3:

inicializa_enemigos_fase3_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo4
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo5
		JP			anade_enemigo_zombi
fin_inicializa_enemigos_fase3_nivel4:

inicializa_enemigos_fase3_nivel5: 							
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		JP			anade_enemigo_fantasma
fin_inicializa_enemigos_fase3_nivel5:

inicializa_enemigos_fase3_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on
		
		LD			DE, enemigo1
		JP			anade_enemigo_jefezombi
fin_inicializa_enemigos_fase3_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE4_NIVELX
;;=====================================================	
inicializa_enemigos_fase4_nivel0:
		LD			DE, enemigo1
		JP			anade_enemigo_murcielago
fin_inicializa_enemigos_fase4_nivel0:

inicializa_enemigos_fase4_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		JP			anade_enemigo_caballero
fin_inicializa_enemigos_fase4_nivel1:

inicializa_enemigos_fase4_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		JP			anade_enemigo_esqueleto
fin_inicializa_enemigos_fase4_nivel2:

inicializa_enemigos_fase4_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		JP			anade_enemigo_zombi
fin_inicializa_enemigos_fase4_nivel3:

inicializa_enemigos_fase4_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		JP			anade_enemigo_fantasma
fin_inicializa_enemigos_fase4_nivel4:

inicializa_enemigos_fase4_nivel5: 							
		LD			DE, enemigo1
		CALL		anade_enemigo_murcielago
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		CALL		anade_enemigo_fantasma
		
		LD			DE, enemigo6
		JP			anade_enemigo_fuego
fin_inicializa_enemigos_fase4_nivel5:

inicializa_enemigos_fase4_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefecaballero
		LD			IX, enemigo1
		JP			actualiza_valores_jefecaballero
fin_inicializa_enemigos_fase4_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE5_NIVELX
;;=====================================================	
inicializa_enemigos_fase5_nivel0:
		LD			DE, enemigo1
		JP			anade_enemigo_magia
fin_inicializa_enemigos_fase5_nivel0:

inicializa_enemigos_fase5_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_magia
		
		LD			DE, enemigo2
		JP			anade_enemigo_caballero
fin_inicializa_enemigos_fase5_nivel1:

inicializa_enemigos_fase5_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_magia
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		JP			anade_enemigo_esqueleto
fin_inicializa_enemigos_fase5_nivel2:

inicializa_enemigos_fase5_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_magia
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		JP			anade_enemigo_zombi
fin_inicializa_enemigos_fase5_nivel3:

inicializa_enemigos_fase5_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_magia
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		JP			anade_enemigo_fantasma
fin_inicializa_enemigos_fase5_nivel4:

inicializa_enemigos_fase5_nivel5: 							
		LD			DE, enemigo1
		CALL		anade_enemigo_magia
		
		LD			DE, enemigo2
		CALL		anade_enemigo_caballero
		
		LD			DE, enemigo3
		CALL		anade_enemigo_esqueleto
		
		LD			DE, enemigo4
		CALL		anade_enemigo_zombi
		
		LD			DE, enemigo5
		CALL		anade_enemigo_fantasma
		
		LD			DE, enemigo6
		JP			anade_enemigo_fuego
fin_inicializa_enemigos_fase5_nivel5:

inicializa_enemigos_fase5_niveljefe:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on
			
		LD			DE, enemigo1
		JP			anade_enemigo_jefebeholder
fin_inicializa_enemigos_fase5_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE6_NIVELX
;;=====================================================	
inicializa_enemigos_fase6_nivel0:
		CALL		carga_patrones_sprites_nivel6_nivel0
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo1
		JP			actualiza_valores_jefelobo_BR
fin_inicializa_enemigos_fase6_nivel0:


inicializa_enemigos_fase6_nivel1:
		CALL		carga_patrones_sprites_nivel6_nivel1
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefemurcielago
		LD			IX, enemigo1
		JP			actualiza_valores_jefemurcielago
fin_inicializa_enemigos_fase6_nivel1:

inicializa_enemigos_fase6_nivel2:
		CALL		carga_patrones_sprites_nivel6_nivel2
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefefantasma
		LD			IX, enemigo1
		JP			actualiza_valores_jefefantasma_BR
fin_inicializa_enemigos_fase6_nivel2:

inicializa_enemigos_fase6_nivel3:
		CALL		carga_patrones_sprites_nivel6_nivel3
		LD			DE, enemigo1
		CALL		anade_enemigo_jefezombi
		LD			IX, enemigo1
		JP			actualiza_valores_jefezombi_BR
fin_inicializa_enemigos_fase6_nivel3:

inicializa_enemigos_fase6_nivel4:
		CALL		carga_patrones_sprites_nivel6_nivel4
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefecaballero
		LD			IX, enemigo1
		JP			actualiza_valores_jefecaballero
fin_inicializa_enemigos_fase6_nivel4:

inicializa_enemigos_fase6_nivel5: 						
		CALL		carga_patrones_sprites_nivel6_nivel5
		
		LD			DE, enemigo1
		CALL		anade_enemigo_jefebeholder
		LD			IX, enemigo1
		JP			actualiza_valores_jefebeholder_BR
fin_inicializa_enemigos_fase6_nivel5:

inicializa_enemigos_fase6_nivel6:
		;primero pone música de jefe fin de fase
		LD			 A, 1 ;A=1 musica jefe
		CALL		musica_on
		
		;está muerto drácula
		LD			 A, (dracula_muerto)
		OR			 A
			RET			NZ	;SI

dracula_NO_esta_muerto:	
			CALL		carga_patrones_sprites_nivel6_nivel6
		
			LD			DE, enemigo1
			CALL		anade_enemigo_dracula
		
			LD			DE, enemigo2
			CALL		anade_enemigo_manoi
		
			LD			DE, enemigo3
			JP			anade_enemigo_manod
fin_inicializa_enemigos_fase6_nivel6:


;;=====================================================
;;CHECK_ENEMIGOS
;;=====================================================	
check_enemigos:
		LD			 A, (prota_nivel)
.mira_nivel0		
		OR			 A
		JP			NZ, .mira_nivel1
		CALL		check_enemigos_fase0
		RET
.mira_nivel1:
		DEC			 A
		JP			NZ, .mira_nivel2
		CALL		check_enemigos_fase1
		RET		
.mira_nivel2:
		DEC			 A
		JP			NZ, .mira_nivel3
		CALL		check_enemigos_fase2
		RET	
.mira_nivel3:
		DEC			 A
		JP			NZ, .mira_nivel4
		CALL		check_enemigos_fase3
		RET	
.mira_nivel4:
		DEC			 A
		JP			NZ, .mira_nivel5
		CALL		check_enemigos_fase4
		RET	
.mira_nivel5:
		DEC			 A
		JP			NZ, .mira_nivel6
		CALL		check_enemigos_fase5
		RET	
.mira_nivel6:
		JP		check_enemigos_fase6
fin_check_enemigos:



;;=====================================================
;;CHECK_ENEMIGOS_FASE0
;;=====================================================	
check_enemigos_fase0: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 16

		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 20

		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 24
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase0:
		RET			


;;=====================================================
;;CHECK_ENEMIGOS_FASE1
;;=====================================================	
check_enemigos_fase1: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 16
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 24
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 32
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase1:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE2
;;=====================================================	
check_enemigos_fase2: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:;SERPIENTE
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:;ARAÑA
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:;CABALLERO
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 12
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 20
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 36
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 52
		
		CALL 		mueve_enemigo
		;acciones enemigos	
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase2:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE3
;;=====================================================	
check_enemigos_fase3: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 12
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 20
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 36
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 52
		
		CALL 		mueve_enemigo
		;acciones enemigos	
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase3:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE4
;;=====================================================	
check_enemigos_fase4: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:	;MURCIELAGO
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:	;CABALLERO
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:	;ESQUELETO
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 12
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:	;ZOMBI
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 20
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:	;FANTASMA
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 28
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo6:	;FUEGO
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 36
		
		CALL 		mueve_enemigo
		;acciones enemigos	
.check_enemigo7:	;JEFECABALLERO
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase4:
		RET	
		

;;=====================================================
;;CHECK_ENEMIGOS_FASE5
;;=====================================================	
check_enemigos_fase5: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:	;MAGIA
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:	;CABALLERO
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 8
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:	;ESQUELETO
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 16
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo4:	;ZOMBI
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 24
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo5:	;FANTASMA
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 32
		
		CALL 		mueve_enemigo
		
		;acciones enemigos
.check_enemigo6:	;FUEGO
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 40
		
		CALL 		mueve_enemigo		
		;acciones enemigos	
.check_enemigo7:	;JEFEBEHOLDER
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase5:
		RET	
		

;;=====================================================
;;CHECK_ENEMIGOS_FASE6
;;=====================================================	
check_enemigos_fase6: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:	;DRACULA
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo2:	
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 8
		
		CALL 		mueve_enemigo
		;acciones enemigos
.check_enemigo3:	
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 16
		
		CALL 		mueve_enemigo
		;acciones enemigos
fin_check_enemigos_fase6:
		RET	


;;=====================================================
;;MUEVE_ENEMIGO
;;=====================================================	
mueve_enemigo:
		LD			 L, (IX + ESTRUCTURA_ENEMIGO.ptr_mover)
		LD			 H, (IX + ESTRUCTURA_ENEMIGO.ptr_mover + 1)
		JP		    (HL)
fin_mueve_enemigo:
		RET


;;=====================================================
;;ENEMIGO_HACE_DANO
;;=====================================================	
; función: resta al prota el daño que tega configurado que haga el enemigo
; recibe: B - daño de un enemigo a restar a la energía del prota
enemigo_hace_dano:
		LD			 A, (prota_energia_bytebajo)
		ADD			 B
		LD			(prota_energia_bytebajo), A
		RET			NC
		XOR			 A
		LD			(prota_energia_bytebajo), A
		LD			 A, (prota_energia)
		SUB			DANOESTANDARENEMIGOS
		LD			(prota_energia), A
		
		;vida menos?
		;	NO -> SALIR
				RET			NC			;IF VIDA MUERTA
		;	SI
				LD			 A, (prota_vidas)
				DEC			 A
				;restovidas
				LD			(prota_vidas), A
				;pinto mensaje de una vida menos
				CALL		una_vida_menos
				;pinto_vidas_actuales
				CALL		pinta_vidas
				;pongo energía al máximo
				LD			 A, MAXENERGIA
				LD			(prota_energia), A
				;SALIR
				RET
		;	FINSI
fin_enemigo_hace_dano:


;;=====================================================
;;CHECK_COLISION_ENEMIGO
;;=====================================================	
; función: 	revisa la distancia con enemigo activo para ver si se disparó y se le dió
; entrada: 	IX con el puntero al enemigo que se examina
; salida: 	A (0 no hay colisión con enemigo / 1 sí la hay)
; toca:		HL,BC, DE
check_colision_enemigo:
.deteccioncolision_paso1:
	LD		IY, puntomira	;IY punto de mira / IX puerta
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posx)
	ADD		 8			;8-es fijo, offset del punto de mira ya que se mueve según la esquina superior izquierda y el centro del punto de mira está en el centro del sprite
	
	;ya tengo en A la coordenada X del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_ENEMIGO.posx)	;le resto el punto x en la puerta
	
	JP		NC, .deteccioncolision_paso2	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)
	
.deteccioncolision_paso2:
	CP		(IX + ESTRUCTURA_ENEMIGO.radiox)	;comparo con el radio X de la puerta
	
	JP		 C, .deteccioncolision_paso3	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A y ya no hay que seguir coprobando
	RET
	
.deteccioncolision_paso3:					;la distancia X es válida, comprobamos la distancia Y
	LD		 A, (IY + ESTRUCTURA_PUNTOMIRA.posy)
	ADD		 8								;le sumo el offset del punto de mira (8 es fijo)

	;ya tengo en A la coordenada Y del centro del punto de mira					
	SUB		(IX + ESTRUCTURA_ENEMIGO.posy)	;le resto el punto y en la puerta
	
	JP		NC, .deteccioncolision_paso4	;si no es negativo comparo con el radio

	NEG										;si es negativo lo niego (valor absoluto)

.deteccioncolision_paso4:
	CP		(IX + ESTRUCTURA_ENEMIGO.radioy)	;comparo con el radio Y de la puerta

	JP		 C, .deteccioncolision_paso5	;SI NC la distancia es >= por lo que sale y no es necesario verificar nada más
	
	XOR		 A								;el resultado es falso y se guarda en A un 0 y al ser la 2º comprobación salimos
	RET

.deteccioncolision_paso5:
	LD		 A, SI
fin_check_colision_enemigo:
	RET


;;=====================================================
;;CHECK_COLISIONES_ENEMIGOS
;;=====================================================	
; función: 	revisa enemigo por enemigo y si existe y no está muriendo mira si se le ha dado
check_colisiones_enemigos:
examina_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		AND			11111110b				; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo2
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo2	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .restaenergia1			
				CALL		mata_enemigo
				JP			examina_enemigo2
.restaenergia1:	
			;hay una excepción... hay que matar las manos del conde drácula antes de matar a drácula
			LD			 B, A	;copia daño (si es que al final se hace)
			
			;primer filtro que el nivel no sea el último
			LD			 A, (prota_nivel)
			CP			 6
			JP			NZ, .resta_energia_no_excepcion
			
			;nota: aquí debería haber otro filtro (ya que drácula está en la últia fila)
			;pero no es necesario comprobar ya que en todo el nivel 6 excepto drácula sólo hay un enemigo por habitación
			
			;filtro de mano derecha
			LD			 A, (enemigo2)
			OR			 A
			JP			NZ, examina_enemigo2
			
			;filtro de mano derecha
			LD			 A, (enemigo3)
			OR			 A
			JP			NZ, examina_enemigo2
			
.resta_energia_no_excepcion:
			;esta es la resta de energía normal pero no se aplica si: drácula y siguen vivas sus manos
			LD			 A, B
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se resta la energía que 
				
examina_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		AND			11111110b				; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo3
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo3	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia2
				CALL		mata_enemigo
				JP			examina_enemigo3
.asignaenergia2:
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta
			
examina_enemigo3:		
		LD			IX, enemigo3
		LD			 A, (IX)
		AND			11111110b				; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo4
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo4	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia3
				CALL		mata_enemigo
				JP			examina_enemigo4
.asignaenergia3:	
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta
		
examina_enemigo4:	
		LD			IX, enemigo4
		LD			 A, (IX)
		AND			11111110b		; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo5
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo5	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia4
				CALL		mata_enemigo
				JP			examina_enemigo5
.asignaenergia4:
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta
		
examina_enemigo5:	
		LD			IX, enemigo5
		LD			 A, (IX)
		AND			11111110b		; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo6
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo6	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia5
				CALL		mata_enemigo
				JP			examina_enemigo6
.asignaenergia5:
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta
			
examina_enemigo6:			
		LD			IX, enemigo6
		LD			 A, (IX)
		AND			11111110b		; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		JP			 Z, examina_enemigo7
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo7	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia6
				CALL		mata_enemigo
				JP			examina_enemigo7
.asignaenergia6:
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta

examina_enemigo7:	
		LD			IX, enemigo7
		LD			 A, (IX)
		AND			11111110b		; si es 0 o 1 lo ignoro ya que está muerto o en descomposición
		RET			 Z
		
		CALL		check_colision_enemigo 	; devuelve A y ya afecta a Z
		JP			 Z, examina_enemigo7	; IF hubo colisión
			LD			 A, (prota_dano_actual)
			LD			 B, A
			LD			 A, (IX + ESTRUCTURA_ENEMIGO.energia)
			SUB			 B
			JP			NC, .asignaenergia7
				CALL		mata_enemigo
				JP			.fin_examina_enemigos
.asignaenergia7:
			LD			(IX + ESTRUCTURA_ENEMIGO.energia), A	;se asigna la energía tras la resta
		
.fin_examina_enemigos:

			;Si NO quedan enemigos pongo habiación como vacía
			;miro si por el nº de enemigos (necesitaré una variable) está terminada la habitación
			;esta función no va aquí sino en check colisiones pero se pone aquí para realizar pruebas
			;CALL		terminada_habitacion_recorrida ;para cuando se maten todos los enemigos de la habitación
fin_check_colisiones_enemigos:
		RET


;;=====================================================
;;MATA_ENEMIGO
;;=====================================================	
; función:  modifica la variable para que el tipo y los sprites sean de enemigo muerto
;			también sustituye la subrutina de acción por la de muerte
;			usa TIEMPO_ESPERA_VISCERA/escena como contador hacia atrás para que desaparezcan las visceras del enemigo
mata_enemigo:
		;examino si se mató al dracula que activaría el final de juego (finales: muerto, derrumbe de castillo o final bueno)
		LD			 A, (IX)
		CP			TIPODRACULA
		JP			 Z, .accion_solo_si_dracula

		LD			 A, (IX);guardo el tipo que me hará falta más tarde
		LD			(IX), 1													;se pone tipo a enemigo muerto
		LD			(IX + ESTRUCTURA_ENEMIGO.escena), TIEMPO_ESPERA_VISCERA	;contador para que desaparezcan las vísceras del enemigo
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_a), SPRI_ENEM_MUERTE1A	;se setean los sprites de las visceras
		
		;esto es necesario para enemigos de más de un sprite
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_b), SPRI_BLANCO	;se setean los sprites de las visceras
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_c), SPRI_BLANCO	;se setean los sprites de las visceras
		LD			(IX + ESTRUCTURA_ENEMIGO.sprite_d), SPRI_BLANCO	;se setean los sprites de las visceras
		

		;sustituyo la función de mover enemigo
		LD			HL, spritesxenemigo
		CALL		suma_A_HL			;aquí es donde hace falta el tipo que se le suma al puntero hl para obtener del array el nº de sprites => función a asignar
		;comienzo con los if
		LD			 A, (HL)
		OR			 A
		JP			 Z, .enemigomuerto2
		AND			00000001b
		JP			NZ, .enemigomuerto1
.enemigomuerto4: ;(a=2)
		LD			HL, accion_enemigo_muerto4
		JP			.fin_if_accion_enemigo_muerto
.enemigomuerto2:		
		LD			HL, accion_enemigo_muerto2
		JP			.fin_if_accion_enemigo_muerto
.enemigomuerto1:
		LD			HL, accion_enemigo_muerto1
.fin_if_accion_enemigo_muerto:
		LD			(IX + ESTRUCTURA_ENEMIGO.ptr_mover), L
		LD			(IX + ESTRUCTURA_ENEMIGO.ptr_mover + 1), H
		
		;sonido muerte enemigo
		LD			 A, 2
		LD			 C, 1
		CALL		ayFX_INIT
		RET
		
.accion_solo_si_dracula:
		CALL		accion_mata_dracula
		JP			oculta_todos_sprites
fin_mata_enemigo:
		

accion_enemigo_muerto1:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		OR			 A
		JP			 Z, .desaparece_enemigo
			;pone sprite de viscera para mostrar
			LD			(IY + 2), 	SPRI_ENEM_MUERTE1A
			;colorea viscera
			LD			(IY + 3), 	COLROJO
			;decreento contador para que desaparezca con el tiempo las visceras
			DEC			(IX + ESTRUCTURA_ENEMIGO.escena)
		RET
		
.desaparece_enemigo:
			;situo las visceras fuera de pantalla
			LD			(IY), 	 	BORRASPRITE
			
.elimino_enemigo:
			;marco enemigo como muerto para saltarlo incluso al examinar
			LD			(IX), 0
		RET
fin_accion_enemigo_muerto1:

accion_enemigo_muerto2:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		OR			 A
		JP			 Z, .desaparece_enemigo
			;pone sprite de viscera para mostrar
			LD			(IY + 2), 	SPRI_ENEM_MUERTE1A
			LD			(IY + 6), 	SPRI_ENEM_MUERTE1A
			;colorea viscera
			LD			(IY + 3), 	COLROJO
			LD			(IY + 7), 	COLROJO
			;decreento contador para que desaparezca con el tiempo las visceras
			DEC			(IX + ESTRUCTURA_ENEMIGO.escena)
		RET
		
.desaparece_enemigo:
			;situo las visceras fuera de pantalla
			LD			(IY), 	 	BORRASPRITE
			LD			(IY + 4),  	BORRASPRITE
			
.elimino_enemigo:
			;marco enemigo como muerto para saltarlo incluso al examinar
			LD			(IX), 0
		RET
fin_accion_enemigo_muerto2:

accion_enemigo_muerto4:
		LD			 A, (IX + ESTRUCTURA_ENEMIGO.escena)
		OR			 A
		JP			 Z, .desaparece_enemigo
			;pone sprite de viscera para mostrar
			LD			(IY + 2), 	SPRI_ENEM_MUERTE1A
			LD			(IY + 6), 	SPRI_ENEM_MUERTE1A
			LD			(IY + 10), 	SPRI_ENEM_MUERTE1A
			LD			(IY + 14), 	SPRI_ENEM_MUERTE1A
			;colorea viscera
			LD			(IY + 3), 	COLROJO
			LD			(IY + 7), 	COLROJO
			LD			(IY + 11), 	COLROJO
			LD			(IY + 15), 	COLROJO
			;decreento contador para que desaparezca con el tiempo las visceras
			DEC			(IX + ESTRUCTURA_ENEMIGO.escena)
		RET
		
.desaparece_enemigo:
			;situo las visceras fuera de pantalla
			LD			(IY), 	 	BORRASPRITE
			LD			(IY + 4),  	BORRASPRITE
			LD			(IY + 8),  	BORRASPRITE
			LD			(IY + 12), 	BORRASPRITE

.elimino_enemigo:
			;marco enemigo como muerto para saltarlo incluso al examinar
			LD			(IX), 0
		RET
fin_accion_enemigo_muerto4:


