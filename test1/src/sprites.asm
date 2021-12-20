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
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

sprite_explosion_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
fin_sprites_comunes:

;; PARTE 2: SPRITES NO COMUNES

;; ARAÑA
	
sprite_arana1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_arana1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

;; MURCIELAGO
	
sprite_murcielago1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_murcielago1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

;; SERPIENTE

sprite_serpiente1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
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

;; ZOMBI

sprite_zombi1_1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi1_2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi1_3_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi1_4_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi1_1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi1_2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi1_3_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi1_4_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi2_2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_3_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_4_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_zombi2_2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_3_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_zombi2_4_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; CABALLERO

sprite_caballero1_1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero1_2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero1_3_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero1_4_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero1_1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero1_2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero1_3_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero1_4_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero2_2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_3_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_4_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_caballero2_2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_3_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_caballero2_4_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; LLAMA

sprite_llama1_1:	
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_llama2_1:	
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_llama1_2:	
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_llama2_2:	
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF			
	
;; FANTASMA

sprite_fantasma1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_fantasma2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; MAGIA

sprite_magia1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_magia2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_magia1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_magia2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
	
;; BEHOLDER

sprite_beholder1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder3_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder4_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_beholder1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder3_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_beholder4_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF		
	
;; VAMPIRO

sprite_vampiro1_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_vampiro2_1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_vampiro1_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_vampiro2_2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
;; MANOIZQ

sprite_manoizq1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoizq2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoizq3:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
;; MANODER

sprite_manoder1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoder2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_manoder3:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
