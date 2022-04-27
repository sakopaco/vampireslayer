;;=====================================================
;; FICHERO cabecera.asm
;;=====================================================

	ORG #4000
	
;;CABECERA FICHERO ROM
	DB "AB" ;#41,#42 Identificador de rom
	DW START,0,0,0,0,0,0  ;Inicio codigo. Puede ser qualquier dirección

	
