;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	

sprites_pantantalla:

;; PARTE 1: SPRITES COMUNES

sprites_comunes:
sprite_punto_mira_1:	;color 8
	DB #00,#06,#18,#21,#20,#40,#40,#11
	DB #11,#40,#40,#20,#21,#18,#06,#00
	DB #00,#60,#18,#84,#04,#02,#02,#88
	DB #88,#02,#02,#04,#84,#18,#60,#00 
	
sprite_punto_mira_2: 	;color 15
	DB #00,#00,#00,#00,#03,#04,#08,#08
	DB #08,#08,#04,#03,#00,#00,#00,#00
	DB #00,#00,#00,#00,#C0,#20,#10,#10
	DB #10,#10,#20,#C0,#00,#00,#00,#00
	
sprite_punto_mira_1_mejorado:	;color 8
	DB #00,#06,#19,#21,#20,#41,#41,#36
	DB #36,#41,#41,#20,#21,#19,#06,#00
	DB #00,#60,#98,#84,#04,#82,#82,#6C
	DB #6C,#82,#82,#04,#84,#98,#60,#00 

sprite_punto_mira_2_mejorado:	;color 15
	DB #00,#41,#00,#00,#03,#04,#08,#49
	DB #49,#08,#04,#03,#00,#00,#41,#00
	DB #00,#82,#00,#00,#C0,#20,#10,#92
	DB #92,#10,#20,#C0,#00,#00,#82,#00 
	
sprite_explosion:				;color 8
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
fin_sprites_comunes:

;; PARTE 2: SPRITES NO COMUNES

;; CIENPIÉS 2
sprite_cienpies_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_cienpies_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; SERPIENTE 2 + 2
sprite_serpiente1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_serpiente1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_serpiente2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_serpiente2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

;; ARAÑA 2
sprite_arana_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_arana_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

;; MURCIELAGO 2
sprite_murcielago_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_murcielago_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

;; LOBO 4 + 4 (dos escenas derecha y dos esceas izquierda)
sprite_lobo1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_lobo2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_lobo2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; ESQUELETO 4 + 4 (dos escenas derecha y dos escenas izquierda)
sprite_esqueleto1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_esqueleto2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_esqueleto2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; ZOMBI 4 + 4
sprite_zombi1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; FANTASMA 5: 2 en horizotal con 2 escenas
sprite_fantasma_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF


;; CABALLERO 4 + 4: es el mismo sprite... cambia el color
sprite_caballero1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; FUEGO 4 (2 escenas 2 sprites vert)
sprite_fuego_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_fuego_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_fuego_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_fuego_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; MAGIA 4 (2 escenas 2 sprites hort)
sprite_magia_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_magia_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_magia_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_magia_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; JEFE LOBO (4 sprites 2 escenas 2 direcciones)
sprite_jefelobo1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo1_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_jefelobo2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefelobo2_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; JEFE MURCIËLAGO (4 sprites 2 escenas)
sprite_jefemurcielago_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefemurcielago_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; JEFE FANTASMA (4 sprites 2 escenas)
sprite_jefefantasma_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefefantasma_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; JEFE ZOMBI (4 sprites 2 escenas 2 direcciones)
sprite_jefezombi1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi1_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_jefezombi2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefezombi2_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; JEFE CABALLERO (4 sprites 2 escenas 2 direcciones)
sprite_jefecaballero1_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero1_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_jefecaballero2_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefecaballero2_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF		
	
;; JEFE BEHOLDER (4 sprites 2 escenas)
sprite_jefebeholder_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_5:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_6:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_7:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_jefebeholder_8:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

;; MANOIZQ 4 (2 escenas 2 sprites vert)
sprite_manoizquierda_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoizquierda_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoizquierda_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoizquierda_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; MANODER 4 (2 escenas 2 sprites vert)
sprite_manoderecha_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoderecha_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoderecha_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoderecha_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; CONDE 4 (2 escenas 2 sprites vert)
sprite_conde_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_conde_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_conde_3:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_conde_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
