;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		


tiles_patrones_inicio:			incbin "pantallas/inicio.tiles.banco1.chr.plet5"
tiles_color_inicio:				incbin "pantallas/inicio.tiles.banco1.clr.plet5"
tiles_mapa_inicio:				incbin "pantallas/inicio.map.bin.plet5"

tiles_mapa_entrefases:			incbin "pantallas/fondoentrefases.map.bin.plet5"

; bancos 1 y 2 y de pantalla 1 
; se usa un banco común (en este caso el banco 1)
; el mapa afecta al banco 1 y 2
;~ tiles_patrones_nivel0:			incbin "pantallas/nivel0.bank1.til.bin.chr.plet5"
;~ tiles_color_nivel0:				incbin "pantallas/nivel0.bank1.til.bin.clr.plet5"

tiles_patrones_nivel0:			incbin "pantallas/tiles.banco01.bin.chr.plet5"
tiles_color_nivel0:				incbin "pantallas/tiles.banco01.bin.clr.plet5"

tiles_mapa_nivel0:				incbin "pantallas/nivel0.bank01.map.bin.plet5"

; 3º banco que es la parte de puntos, vidas, mapas, etc... es común
tiles_patrones_marcador:		incbin "pantallas/marcador.til.bin.chr.plet5"
tiles_color_marcador:			incbin "pantallas/marcador.til.bin.clr.plet5"
tiles_mapa_marcador:			incbin "pantallas/marcador.map.bin.plet5"

;pantalla de game over 1
tiles_patrones_gameover1_bank1:	incbin "pantallas/gameover1.bank1.til.chr.plet5"
tiles_color_gameover1_bank1:	incbin "pantallas/gameover1.bank1.til.clr.plet5"
tiles_mapa_gameover1_bank01:	incbin "pantallas/gameover1.map.plet5"

;pantalla de final bueno
tiles_patrones_finalbueno_bank1:incbin "pantallas/finbueno.bank1.chr.plet5"
tiles_color_finalbueno_bank1:	incbin "pantallas/finbueno.bank1.clr.plet5"
tiles_mapa_finalbueno_bank01:	incbin "pantallas/finbueno.map.plet5"

;parte superior pantalla vacio y negro
tiles_patrones_vacio:			incbin "pantallas/vacio.chr.plet5"
tiles_color_vacio:				incbin "pantallas/vacio.clr.plet5"
tiles_mapa_vacio:				incbin "pantallas/vacio.map.plet5"

