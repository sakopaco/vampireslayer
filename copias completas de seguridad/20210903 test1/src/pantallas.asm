;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		

; bancos 1 y 2 y de pantalla 1 (en realidad es una pantalla de pruebas)
; se usa un banco común (en este caso el banco 1)
; el mapa afecta al banco 1 y 2
tiles_patrones_nivel0:	incbin "pantallas/nivel0.bank1.til.bin.chr.plet5"
tiles_color_nivel0:		incbin "pantallas/nivel0.bank1.til.bin.clr.plet5"
tiles_mapa_nivel0:		incbin "pantallas/nivel0.bank01.map.bin.plet5"

; 3º banco que es la parte de puntos, vidas, mapas, etc... es común
tiles_patrones_marcador:	incbin "pantallas/marcador.til.bin.chr.plet5"
tiles_color_marcador:		incbin "pantallas/marcador.til.bin.clr.plet5"
tiles_mapa_marcador:		incbin "pantallas/marcador.map.bin.plet5"

;NOTA: FALTARÍAN PANTALLAS ESPECIALES (POR DEFINIR)
