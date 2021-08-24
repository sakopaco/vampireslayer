;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	
sprites_pantantalla:

sprite_punto_mira_1:	;color 8
	db #FF,#FF,#C0,#C0,#C0,#C0,#C0,#C0
	db #C0,#C0,#C0,#C0,#C0,#C0,#FF,#FF
	db #FF,#FF,#03,#03,#03,#03,#03,#03
	db #03,#03,#03,#03,#03,#03,#FF,#FF
	
sprite_punto_mira_2: 	;color 15
	db #00,#00,#00,#00,#0F,#0F,#0C,#0C
	db #0C,#0C,#0F,#0F,#00,#00,#00,#00
	db #00,#00,#00,#00,#F0,#F0,#30,#30
	db #30,#30,#F0,#F0,#00,#00,#00,#00
	
sprite_punto_mira_1_mejorado:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF

sprite_punto_mira_2_mejorado:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_reliquia:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_vida_extra:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_planta:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_ballesta_mejorada:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	
	
sprite_ciempies1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_ciempies2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_arana1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_arana2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_serpiente1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_serpiente2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_murcielago1:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
sprite_murcielago2:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF	

sprite_explosion:
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	db  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
	
	
