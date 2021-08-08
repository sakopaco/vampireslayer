efecto_imagen_tira_reliquia:
	LD		 A, (contdor_efecto_reliquia)
	DEC		 A
	LD		(contdor_efecto_reliquia), A
	
	CP		 7
	JP		NC, .intercambia_color_fondo
	LD		 A, RETARDOREL
	LD		(contdor_efecto_reliquia), A
	;toca A y direcciones #F3E9/#F3EA/#F3EB, poner en HL array con 3 valores
	LD		HL, color_base
	JP		color_pantalla
	;CALL/RET	
	
.intercambia_color_fondo:
	BIT		 2, A
	JP		 Z, .otro_fondo
	LD		HL, color_bomba1
	JP		color_pantalla
.otro_fondo:
	LD		HL, color_bomba2
	JP		color_pantalla
fin_efecto_imagen_tira_reliquia:
	;CALL/RET
