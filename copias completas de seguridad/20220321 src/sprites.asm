;;=====================================================
;;DEFINICIÓN DE SPRITES
;;=====================================================	

;sprites_pantantalla

;; PARTE 1: SPRITES COMUNES
sprites_comunes:
sprite_punto_mira_1:			;color 8
	DB #00,#06,#18,#21,#20,#40,#40,#11
	DB #11,#40,#40,#20,#21,#18,#06,#00
	DB #00,#60,#18,#84,#04,#02,#02,#88
	DB #88,#02,#02,#04,#84,#18,#60,#00 
	
sprite_punto_mira_2: 			;color 15
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
	DB  #00,#00,#00,#00,#00,#00,#00,#00
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#FF,#FF
	DB  #00,#00,#00,#00,#00,#00,#00,#00	
fin_sprites_comunes:

;; PARTE 2: SPRITES NO COMUNES
;; CIENPIÉS 2
sprite_cienpies:
sprite_cienpies_1:
	DB #82,#44,#24,#9F,#BF,#74,#62,#75
	DB #E8,#E0,#F8,#65,#32,#3F,#4F,#83
	DB #00,#3C,#D2,#F2,#F0,#52,#3C,#00
	DB #00,#00,#00,#44,#08,#FC,#FE,#F8
	
sprite_cienpies_2:
	DB #21,#22,#24,#9F,#7F,#74,#63,#F0
	DB #EC,#60,#39,#61,#32,#BF,#4F,#13
	DB #04,#3A,#D0,#F0,#F0,#50,#3A,#04
	DB #00,#00,#28,#44,#24,#FC,#FE,#F8
fin_sprite_cienpies:


;; SERPIENTE 2 + 2
sprite_serpiente:
sprite_serpiente1_1:
	DB #00,#00,#00,#00,#40,#20,#30,#10
	DB #10,#30,#60,#60,#70,#78,#3F,#1F
	DB #00,#0E,#1B,#3B,#7E,#38,#3C,#1E
	DB #0F,#07,#07,#0F,#3E,#FE,#F8,#F0
	
sprite_serpiente1_2:
	DB #00,#01,#03,#33,#41,#20,#40,#60
	DB #60,#E0,#C0,#C0,#E0,#F1,#7F,#3F
	DB #00,#C0,#6A,#75,#C0,#E0,#78,#3C
	DB #1C,#1E,#1E,#1C,#7C,#FC,#F0,#E0
	
sprite_serpiente2_1:
	DB #00,#70,#D8,#DC,#7E,#1C,#3C,#78
	DB #F0,#E0,#E0,#F0,#7C,#7F,#1F,#0F
	DB #00,#00,#00,#00,#02,#04,#0C,#08
	DB #08,#0C,#06,#06,#0E,#1E,#FC,#F8
	
sprite_serpiente2_2:
	DB #00,#03,#56,#AE,#03,#07,#1E,#3C
	DB #38,#78,#78,#38,#3E,#3F,#0F,#07
	DB #00,#80,#C0,#CC,#82,#04,#02,#06
	DB #06,#07,#03,#03,#07,#8F,#FE,#FC
fin_sprite_serpiente:



;; ARAÑA 2
sprite_arana:
sprite_arana_1:
	DB #00,#01,#03,#05,#07,#75,#8F,#04
	DB #1D,#27,#4B,#91,#20,#10,#00,#00
	DB #00,#80,#C0,#A0,#E0,#AE,#F1,#20
	DB #B8,#E4,#D2,#89,#04,#08,#00,#00
	
sprite_arana_2:
	DB #00,#01,#03,#05,#77,#8D,#07,#1C
	DB #25,#C7,#0B,#31,#40,#00,#00,#00
	DB #00,#80,#C0,#A0,#EE,#B1,#E0,#38
	DB #A4,#E3,#D0,#8C,#02,#00,#00,#00
fin_sprite_arana:


;; MURCIELAGO 2
sprite_murcielago:
sprite_murcielago_1:
	DB #08,#0E,#02,#05,#0F,#0C,#0D,#07
	DB #1B,#3F,#5F,#FB,#F3,#65,#21,#00
	DB #10,#70,#40,#A0,#F0,#30,#B0,#E0
	DB #D8,#FC,#FA,#DF,#CF,#A6,#84,#00
	
sprite_murcielago_2:
	DB #08,#0E,#02,#05,#0F,#0E,#4D,#E7
	DB #FB,#FF,#7F,#7B,#33,#05,#01,#00
	DB #10,#70,#40,#A0,#F0,#70,#B2,#E7
	DB #DF,#FF,#FE,#DE,#CC,#A0,#80,#00
fin_sprite_murcielago:


;; LOBO 4 + 4 (dos escenas derecha y dos esceas izquierda)
sprite_lobo:
sprite_lobo1_1:
	DB #00,#00,#01,#07,#0F,#1F,#1F,#3F
	DB #77,#E7,#EF,#0E,#1C,#18,#0C,#0E
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#79,#70,#E0,#60,#30,#18

sprite_lobo1_2:
	DB #01,#01,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FE,#F6,#E7,#C3,#C1,#40,#60
	DB #00,#C0,#E0,#F0,#D8,#FE,#FE,#E0
	DB #80,#00,#00,#00,#00,#80,#C0,#C0

sprite_lobo1_3:
	DB #00,#00,#01,#07,#0F,#1F,#3F,#7F
	DB #F7,#C7,#83,#06,#07,#03,#03,#01
	DB #00,#00,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FF,#39,#30,#60,#60,#30,#B8

sprite_lobo1_4:
	DB #06,#03,#FF,#FF,#FF,#FF,#FF,#FF
	DB #FF,#FE,#76,#66,#EE,#EE,#66,#77
	DB #00,#C0,#E0,#F0,#D8,#FE,#FE,#E0
	DB #80,#00,#00,#00,#00,#00,#00,#00
	
sprite_lobo2_1:
	DB  #3F,#1F,#1F,#0F,#07,#01,#00,#00
	DB  #0E,#0C,#18,#1C,#0E,#EF,#E7,#77
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#00,#00
	DB  #18,#30,#60,#E0,#70,#79,#FF,#FF

sprite_lobo2_2:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#01,#01
	DB  #60,#40,#C1,#C3,#E7,#F6,#FE,#FF
	DB  #E0,#FE,#FE,#D8,#F0,#E0,#C0,#00
	DB  #C0,#C0,#80,#00,#00,#00,#00,#80

sprite_lobo2_3:
	DB  #7F,#3F,#1F,#0F,#07,#01,#00,#00
	DB  #01,#03,#03,#07,#06,#83,#C7,#F7
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#00,#00
	DB  #B8,#30,#60,#60,#30,#39,#FF,#FF

sprite_lobo2_4:
	DB  #FF,#FF,#FF,#FF,#FF,#FF,#03,#06
	DB  #77,#66,#EE,#EE,#66,#76,#FE,#FF
	DB  #E0,#FE,#FE,#D8,#F0,#E0,#C0,#00
	DB  #00,#00,#00,#00,#00,#00,#00,#80
fin_sprite_lobo:
	
;; ESQUELETO 4 + 4 (dos escenas derecha y dos escenas izquierda)
sprite_esqueleto:
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
fin_sprite_esqueleto:
	
;; ZOMBI 4 + 4
sprite_zombi:
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
fin_sprite_zombi:
	
;; FANTASMA 5: 2 en horizotal con 2 escenas
sprite_fantasma:
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
fin_sprite_fantasma:


;; CABALLERO 4 + 4: es el mismo sprite... cambia el color
sprite_caballero:
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
fin_sprite_caballero:
	
;; FUEGO 4 (2 escenas 2 sprites vert)
sprite_fuego:
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
fin_sprite_fuego:
	
;; MAGIA 4 (2 escenas 2 sprites hort)
sprite_magia:
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
fin_sprite_magia:
	
;; JEFE LOBO (4 sprites 2 escenas 2 direcciones)
sprite_jefelobo:
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
fin_sprite_jefelobo:
	
;; JEFE MURCIËLAGO (4 sprites 2 escenas)
sprite_jefemurcielago:
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
fin_sprite_jefemurcielago:
	
;; JEFE FANTASMA (4 sprites 2 escenas)
sprite_jefefantasma:
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
fin_sprite_jefefantasma:
	
;; JEFE ZOMBI (4 sprites 2 escenas 2 direcciones)
sprite_jefezombi:
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
fin_sprite_jefezombi:
	
;; JEFE CABALLERO (4 sprites 2 escenas 2 direcciones)
sprite_jefecaballero:
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
fin_sprite_jefecaballero:
	
;; JEFE BEHOLDER (4 sprites 2 escenas)
sprite_jefebeholder:
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
fin_sprite_jefebeholder:

;; MANOIZQ 4 (2 escenas 2 sprites vert)
sprite_manoizquierda:
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
fin_sprite_manoizquierda:
	
;; MANODER 4 (2 escenas 2 sprites vert)
sprite_manoderecha:
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
fin_sprite_manoderecha:
	
;; CONDE 4 (2 escenas 2 sprites vert)
sprite_conde:
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
fin_sprite_conde:



;;=====================================================
;;CARGA PATRONES SPRITES
;;=====================================================	

carga_patrones_cienpies:
		LD			HL, sprite_cienpies
		LD			DE, #38C0
		LD			BC, fin_sprite_cienpies - sprite_cienpies
		JP			LDIRMV
fin_carga_patrones_cienpies:

carga_patrones_serpiente:
		LD			HL, sprite_serpiente
		LD			DE, #3900
		LD			BC, fin_sprite_serpiente - sprite_serpiente
		JP			LDIRMV
fin_carga_patrones_serpiete:

carga_patrones_arana:
		LD			HL, sprite_arana
		LD			DE, #3980
		LD			BC, fin_sprite_arana - sprite_arana
		JP			LDIRMV
fin_carga_patrones_arana:

carga_patrones_murcielago:
		LD			HL, sprite_murcielago
		LD			DE, #39C0
		LD			BC, fin_sprite_murcielago - sprite_murcielago
		JP			LDIRMV
fin_carga_patrones_murcielago:

carga_patrones_lobo:
		LD			HL, sprite_lobo
		LD			DE, #3A00
		LD			BC, fin_sprite_lobo - sprite_lobo
		JP			LDIRMV
fin_carga_patrones_lobo:

carga_patrones_lobo_fase5:
		LD			HL, sprite_lobo
		LD			DE, #3B00
		LD			BC, fin_sprite_lobo - sprite_lobo
		JP			LDIRMV
fin_carga_patrones_lobo_fase5:

carga_patrones_esqueleto:
		LD			HL, sprite_esqueleto
		LD			DE, #3B00
		LD			BC, fin_sprite_esqueleto - sprite_esqueleto
		JP			LDIRMV
fin_carga_patrones_esqueleto:

carga_patrones_zombi:
		LD			HL, sprite_zombi
		LD			DE, #3C00
		LD			BC, fin_sprite_zombi - sprite_zombi
		JP			LDIRMV
fin_carga_patrones_zombi:

carga_patrones_fantasma:
		LD			HL, sprite_fantasma
		LD			DE, #3D00
		LD			BC, fin_sprite_fantasma - sprite_fantasma
		JP			LDIRMV
fin_carga_patrones_fantasma:

carga_patrones_caballero:
		LD			HL, sprite_caballero
		LD			DE, #3A00
		LD			BC, fin_sprite_caballero - sprite_caballero
		JP			LDIRMV
fin_carga_patrones_caballero:

carga_patrones_fuego:
		LD			HL, sprite_fuego
		LD			DE, #3D80
		LD			BC, fin_sprite_fuego - sprite_fuego
		JP			LDIRMV
fin_carga_patrones_fuego:

carga_patrones_magia:
		LD			HL, sprite_magia
		LD			DE, #3900
		LD			BC, fin_sprite_magia - sprite_magia
		JP			LDIRMV
fin_carga_patrones_magia:

carga_patrones_jefelobo:
		LD			HL, sprite_jefelobo
		LD			DE, #3E00
		LD			BC, fin_sprite_jefelobo - sprite_jefelobo
		JP			LDIRMV
fin_carga_patrones_jefelobo:

carga_patrones_jefemurcielago:
		LD			HL, sprite_jefemurcielago
		LD			DE, #3F00
		LD			BC, fin_sprite_jefemurcielago - sprite_jefemurcielago
		JP			LDIRMV
fin_carga_patrones_jefemurcielago:

carga_patrones_jefefantasma:
		LD			HL, sprite_jefefantasma
		LD			DE, #3F00
		LD			BC, fin_sprite_jefefantasma - sprite_jefefantasma
		JP			LDIRMV
fin_carga_patrones_jefefantasma:

carga_patrones_jefezombi:
		LD			HL, sprite_jefezombi
		LD			DE, #3E00
		LD			BC, fin_sprite_jefezombi - sprite_jefezombi
		JP			LDIRMV
fin_carga_patrones_jefezombi:

carga_patrones_jefecaballero:
		LD			HL, sprite_jefecaballero
		LD			DE, #3E00
		LD			BC, fin_sprite_jefecaballero - sprite_jefecaballero
		JP			LDIRMV
fin_carga_patrones_jefecaballero:

carga_patrones_jefebeholder:
		LD			HL, sprite_jefebeholder
		LD			DE, #3F00
		LD			BC, fin_sprite_jefebeholder - sprite_jefebeholder
		JP			LDIRMV
fin_carga_patrones_jefebeholder:

carga_patrones_condecompleto:
		LD			HL, sprite_manoizquierda
		LD			DE, #3F00
		LD			BC, fin_sprite_conde - sprite_manoizquierda
		JP			LDIRMV
fin_carga_patrones_condecompleto

carga_patrones_fase0:
		CALL		carga_patrones_cienpies
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_arana
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		JP			carga_patrones_jefelobo
fin_carga_patrones_fase0:

carga_patrones_fase1:
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_arana
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		JP			carga_patrones_jefemurcielago
fin_carga_patrones_fase1:

carga_patrones_fase2:
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_lobo
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		JP			carga_patrones_jefefantasma
fin_carga_patrones_fase2:

carga_patrones_fase3:
		CALL		carga_patrones_serpiente
		CALL		carga_patrones_arana
		CALL		carga_patrones_caballero
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		JP			carga_patrones_jefezombi
fin_carga_patrones_fase3:

carga_patrones_fase4:
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_caballero 		;(gris)
		CALL		carga_patrones_esqueleto
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		JP			carga_patrones_jefecaballero
fin_carga_patrones_fase4:

carga_patrones_fase5:
		CALL		carga_patrones_magia
		CALL		carga_patrones_caballero 		;(negro)
		CALL		carga_patrones_lobo_fase5
		CALL		carga_patrones_zombi
		CALL		carga_patrones_fantasma
		CALL		carga_patrones_fuego
		JP			carga_patrones_jefebeholder
fin_carga_patrones_fase5:

carga_patrones_fase6:
		CALL		carga_patrones_magia
		CALL		carga_patrones_murcielago
		CALL		carga_patrones_caballero 		;(negro)
		CALL		carga_patrones_fantasma
		CALL		carga_patrones_fuego
		JP			carga_patrones_condecompleto
fin_carga_patrones_fase6:
