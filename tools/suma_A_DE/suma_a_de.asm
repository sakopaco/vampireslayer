	output	"suma.bin"
	

;;CABECERA FICHERO BIN
	DB	#FE
	DW	START
	DW	END
	DW	START
;;INICIO CÓDIGO PROGRAMA	
	ORG	#8200
	
START:
	
	LD		 E, 200	;11001111
	LD		 D, 0	;00000011
	;LD		DE, 200
	
	LD		 A, 200	;11000000
	
	;se supone que el resultado en DE es 1167 0000 0100   1000 1111
	
	ADD		 E
	LD		 E, A
	ADC		 D
	SUB		 E
	LD		 D, A
	
	
	
	nop
	nop
	nop
	nop
	
END:
