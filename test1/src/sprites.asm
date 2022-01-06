;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	


;; NOTA:
;~ sprite_reliquia_oracion: on/off
;~ sprite_reliquia_cruz: on/off
;~ sprite_reliquia_agua: on/off
;~ sprite_peto: on/off
;~ sprite_planta: on/off
;~ sprite_vida_extra: on/off
;~ sprite_ballesta_mejorada: on/off

;~ iban a ser sprites pero por falta de recursos serán tiles


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
	
sprite_punto_mira_1_mejorado:
	DB #00,#06,#19,#21,#20,#41,#41,#36
	DB #36,#41,#41,#20,#21,#19,#06,#00
	DB #00,#60,#98,#84,#04,#82,#82,#6C
	DB #6C,#82,#82,#04,#84,#98,#60,#00 

sprite_punto_mira_2_mejorado:
	DB #00,#41,#00,#00,#03,#04,#08,#49
	DB #49,#08,#04,#03,#00,#00,#41,#00
	DB #00,#82,#00,#00,#C0,#20,#10,#92
	DB #92,#10,#20,#C0,#00,#00,#82,#00 
	
sprite_explosion_1:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

sprite_explosion_2:
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

;; LOBO 4 + 4
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
	
;; FANTASMA 5: (forma triángulo invertido) sólo mueve los dos de arriba el de abajo es constante
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
	
sprite_fantasma_5:
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
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF;; ARAÑA 2
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
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; FUEGO 4
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
	
;; MAGIA 4
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
	
