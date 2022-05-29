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
		JP			NZ, .nivel2
		CALL		inicializa_enemigos_fase6_nivel1
		RET
.nivel2:
		DEC			 A
		JP			NZ, .nivel3
		CALL		inicializa_enemigos_fase6_nivel2
		RET
.nivel3:
		DEC			 A
		JP			NZ, .nivel4
		CALL		inicializa_enemigos_fase6_nivel3
		RET
.nivel4:
		DEC			 A
		JP			NZ, .nivel5
		CALL		inicializa_enemigos_fase6_nivel4
		RET
.nivel5:
		DEC			 A
		JP			NZ, .nivel6
		CALL		inicializa_enemigos_fase6_nivel5
		RET
.nivel6:
		JP			inicializa_enemigos_fase6_niveljefe
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
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo		
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase0_nivel5:

inicializa_enemigos_fase0_niveljefe:	
		LD			DE, enemigo6
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo6
		JP			actualiza_valores_lobo	;se reutiliza la inicialización de valores iniciales de lobo para jefelobo
		RET
fin_inicializa_enemigos_fase0_niveljefe:
	

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE1_NIVELX
;;=====================================================	
inicializa_enemigos_fase1_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase1_nivel0:

inicializa_enemigos_fase1_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		JP			actualiza_valores_arana
fin_inicializa_enemigos_fase1_nivel1:

inicializa_enemigos_fase1_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase1_nivel2:

inicializa_enemigos_fase1_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase1_nivel3:

inicializa_enemigos_fase1_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		CALL		actualiza_valores_lobo		
		
		LD			DE, enemigo5
		CALL		anade_enemigo_esqueleto
		LD			IX, enemigo5
		JP			actualiza_valores_esqueleto
fin_inicializa_enemigos_fase1_nivel4:

inicializa_enemigos_fase1_nivel5: 						
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_arana
		LD			IX, enemigo2
		CALL		actualiza_valores_arana
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		CALL		actualiza_valores_lobo		
		
		LD			DE, enemigo5
		CALL		anade_enemigo_esqueleto
		LD			IX, enemigo5
		CALL		actualiza_valores_esqueleto
		
		LD			DE, enemigo6
		CALL		anade_enemigo_zombi
		LD			IX, enemigo6
		JP			actualiza_valores_zombi
fin_inicializa_enemigos_fase1_nivel5:

inicializa_enemigos_fase1_niveljefe:	
		LD			DE, enemigo7
		CALL		anade_enemigo_jefemurcielago
		LD			IX, enemigo7
		JP			actualiza_valores_jefemurcielago	
fin_inicializa_enemigos_fase1_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE2_NIVELX
;;=====================================================	
inicializa_enemigos_fase2_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase2_nivel0:

inicializa_enemigos_fase2_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo2
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase2_nivel1:

inicializa_enemigos_fase2_nivel2:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo2
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase2_nivel2:

inicializa_enemigos_fase2_nivel3:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo2
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase2_nivel3:

inicializa_enemigos_fase2_nivel4:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo2
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		CALL		actualiza_valores_lobo		
		
		LD			DE, enemigo5
		CALL		anade_enemigo_esqueleto
		LD			IX, enemigo5
		JP			actualiza_valores_esqueleto
fin_inicializa_enemigos_fase2_nivel4:

inicializa_enemigos_fase2_nivel5: 						
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo2
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo3
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo3
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo4
		CALL		anade_enemigo_lobo
		LD			IX, enemigo4
		CALL		actualiza_valores_lobo		
		
		LD			DE, enemigo5
		CALL		anade_enemigo_esqueleto
		LD			IX, enemigo5
		CALL		actualiza_valores_esqueleto
		
		LD			DE, enemigo6
		CALL		anade_enemigo_zombi
		LD			IX, enemigo6
		JP			actualiza_valores_zombi
fin_inicializa_enemigos_fase2_nivel5:

inicializa_enemigos_fase2_niveljefe:	
		LD			DE, enemigo7
		CALL		anade_enemigo_jefemurcielago
		LD			IX, enemigo7
		JP			actualiza_valores_jefemurcielago	
fin_inicializa_enemigos_fase2_niveljefe:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE3_NIVELX
;;=====================================================	
inicializa_enemigos_fase3_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase3_nivel0:

inicializa_enemigos_fase3_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo2
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase3_nivel1:

inicializa_enemigos_fase3_nivel2:
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
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase3_nivel2:

inicializa_enemigos_fase3_nivel3:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase3_nivel3:

inicializa_enemigos_fase3_nivel4:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo
fin_inicializa_enemigos_fase3_nivel4:

inicializa_enemigos_fase3_nivel5:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase3_nivel5:

;; no hay nivel 6 porque el 5 se repite

inicializa_enemigos_fase3_niveljefe:
		LD			DE, enemigo6
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo6
		JP			actualiza_valores_lobo	;se reutiliza la inicialización de valores iniciales de lobo para jefelobo
fin_inicializa_enemigos_fase3_nivel6:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE4_NIVELX
;;=====================================================	
inicializa_enemigos_fase4_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase4_nivel0:

inicializa_enemigos_fase4_nivel1:
				LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo2
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase4_nivel1:

inicializa_enemigos_fase4_nivel2:
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
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase4_nivel2:

inicializa_enemigos_fase4_nivel3:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase4_nivel3:

inicializa_enemigos_fase4_nivel4:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo
fin_inicializa_enemigos_fase4_nivel4:

inicializa_enemigos_fase4_nivel5:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase4_nivel5:

;; no hay nivel 6 porque el 5 se repite

inicializa_enemigos_fase4_niveljefe:
		LD			DE, enemigo6
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo6
		JP			actualiza_valores_lobo	;se reutiliza la inicialización de valores iniciales de lobo para jefelobo
fin_inicializa_enemigos_fase4_nivel6:


;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE5_NIVELX
;;=====================================================	
inicializa_enemigos_fase5_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase5_nivel0:

inicializa_enemigos_fase5_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo2
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase5_nivel1:

inicializa_enemigos_fase5_nivel2:
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
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase5_nivel2:

inicializa_enemigos_fase5_nivel3:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase5_nivel3:

inicializa_enemigos_fase5_nivel4:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo
fin_inicializa_enemigos_fase5_nivel4:

inicializa_enemigos_fase5_nivel5:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase5_nivel5:

;; no hay nivel 6 porque el 5 se repite

inicializa_enemigos_fase5_niveljefe:
		LD			DE, enemigo6
		CALL		anade_enemigo_jefelobo
		LD			IX, enemigo6
		JP			actualiza_valores_lobo	;se reutiliza la inicialización de valores iniciales de lobo para jefelobo
fin_inicializa_enemigos_fase5_nivel6:
		RET

;;=====================================================
;;INICIALIZA_ENEMIGOS_FASE6_NIVELX
;;=====================================================	
inicializa_enemigos_fase6_nivel0:
		LD			DE, enemigo1
		CALL		anade_enemigo_cienpies
		LD			IX, enemigo1
		JP			actualiza_valores_cienpies
fin_inicializa_enemigos_fase6_nivel0:

inicializa_enemigos_fase6_nivel1:
		LD			DE, enemigo1
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo1
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo2
		CALL		anade_enemigo_serpiente
		LD			IX, enemigo2
		JP			actualiza_valores_serpiente
fin_inicializa_enemigos_fase6_nivel1:

inicializa_enemigos_fase6_nivel2:
fin_inicializa_enemigos_fase6_nivel2:

inicializa_enemigos_fase6_nivel3:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		JP			actualiza_valores_murcielago
fin_inicializa_enemigos_fase6_nivel3:

inicializa_enemigos_fase6_nivel4:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo
fin_inicializa_enemigos_fase6_nivel4:

inicializa_enemigos_fase6_nivel5:
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
		LD			IX, enemigo3
		CALL		actualiza_valores_serpiente
		
		LD			DE, enemigo4
		CALL		anade_enemigo_murcielago
		LD			IX, enemigo4
		CALL		actualiza_valores_murcielago
		
		LD			DE, enemigo5
		CALL		anade_enemigo_lobo
		LD			IX, enemigo5
		JP			actualiza_valores_lobo	
fin_inicializa_enemigos_fase6_nivel5:

;; no hay nivel 6 porque el 5 se repite

inicializa_enemigos_fase6_niveljefe:
;las manos y el dracula son enemigos distintos (3) y hasta que no ueran las anos no muere drácula
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
		LD			IX, enemigo3
		JP			actualiza_valores_serpiente
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
.mira_nivel4:
.mira_nivel5:
.mira_nivel6:
fin_check_enemigos:
		RET


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
		CALL		mover_cienpies

		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		CALL		mover_arana

		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8
		CALL		mover_serpiente

		;acciones enemigos

.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 12
		CALL		mover_murcielago

		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 16

		CALL		mover_lobo

		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 24
		CALL		mover_jefelobo

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
		CALL		mover_serpiente

		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		CALL		mover_arana

		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8
		CALL		mover_murcielago

		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 16
		CALL		mover_lobo

		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 24
		CALL		mover_esqueleto

		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 32
		CALL		mover_zombi 														

		;acciones enemigos		
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		CALL		mover_jefemurcielago

		;acciones enemigos
fin_check_enemigos_fase1:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE2
;;=====================================================	
check_enemigos_fase2: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:
		LD			IX, enemigo1
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo2
		
		LD			IY, array_sprites_enem
		CALL		mover_serpiente

		;acciones enemigos
.check_enemigo2:
		LD			IX, enemigo2
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo3
		
		LD			IY, array_sprites_enem + 4
		CALL		mover_murcielago

		;acciones enemigos
.check_enemigo3:
		LD			IX, enemigo3
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo4
		
		LD			IY, array_sprites_enem + 8
		CALL		mover_murcielago

		;acciones enemigos
.check_enemigo4:
		LD			IX, enemigo4
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo5
		
		LD			IY, array_sprites_enem + 16
		CALL		mover_lobo

		;acciones enemigos
.check_enemigo5:
		LD			IX, enemigo5
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo6
		
		LD			IY, array_sprites_enem + 24
		CALL		mover_esqueleto

		;acciones enemigos
.check_enemigo6:
		LD			IX, enemigo6   														
		LD			 A, (IX)
		OR			 A
		JP			 Z, .check_enemigo7
		
		LD			IY, array_sprites_enem + 32
		CALL		mover_zombi 														

		;acciones enemigos		
.check_enemigo7:
		LD			IX, enemigo7
		LD			 A, (IX)
		OR			 A
		RET			 Z
		
		LD			IY, array_sprites_enem + 4
		CALL		mover_jefemurcielago

		;acciones enemigos
fin_check_enemigos_fase2:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE3
;;=====================================================	
check_enemigos_fase3: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar

fin_check_enemigos_fase3:
		RET	


;;=====================================================
;;CHECK_ENEMIGOS_FASE4
;;=====================================================	
check_enemigos_fase4: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar

fin_check_enemigos_fase4:
		RET	
		

;;=====================================================
;;CHECK_ENEMIGOS_FASE5
;;=====================================================	
check_enemigos_fase5: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar

fin_check_enemigos_fase5:
		RET	
		

;;=====================================================
;;CHECK_ENEMIGOS_FASE6
;;=====================================================	
check_enemigos_fase6: ;; aquí se ponen los valores de enemigos (si están activos) en el array de sprites para renderizar
.check_enemigo1:

fin_check_enemigos_fase6:
		RET	
