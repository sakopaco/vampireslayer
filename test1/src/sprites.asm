;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	
sprites_pantantalla:

sprite_punto_mira:
	db  #00,#01,#0F,#11,#20,#24,#20,#71
	db  #71,#20,#24,#20,#11,#0F,#01,#00
	db  #00,#80,#F0,#88,#04,#24,#04,#8E
	db  #8E,#04,#24,#04,#88,#F0,#80,#00
	
sprite_punto_mira_disp:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	
serpiente_paso1:
	DB #00,#00,#00,#00,#00,#00,#00,#10
	DB #30,#20,#60,#70,#38,#1C,#1F,#0F
	DB #00,#38,#7C,#76,#7E,#7C,#FA,#C1
	DB #E0,#60,#70,#78,#3C,#1C,#F8,#F8

serpiente_paso2:
	DB #00,#00,#00,#00,#00,#00,#01,#05
	DB #1C,#30,#30,#30,#38,#1C,#1F,#0F
	DB #00,#70,#F8,#EC,#FC,#F8,#F5,#C2
	DB #E0,#60,#70,#38,#18,#1C,#F8,#F0
