;;=====================================================
;; FICHERO constantesenemigos.asm
;;=====================================================

;;GENERAL
INACTIVA			equ		0
ACTIVA				equ		1
OCULTA				equ		209
DIRABAJO			equ		0
DIRDERECHA			equ		0
DIRARRIBA			equ		1
DIRIZQUIERDA		equ		1
LIMITEPANTALLASUP	equ		0
LIMITEPANTALLAINF	equ		112
LIMITEPANTALLAIZQ	equ		0
LIMITEPANTALLADER	equ		240

;;ETIQUETAS/CONSTANTES CIENPIES
CIENPIES_COLOR		equ		#000C	;12 - VERDE OSCURO
CIENPIES_SPRITE1A	equ		#0018	;24
CIENPIES_SPRITE2A	equ		#001c	;28

;;ETIQUETAS/CONSTANTES ARANA
ARANA_COLOR			equ		#0005	;5 - CYAN
ARANA_SPRITE1A		equ		#0030	;48
ARANA_SPRITE2A		equ		#0034	;52


;;ETIQUETAS/CONSTANTES SERPIENTE
SERPIENTE_COLOR		equ		#000C	;12 - VERDE OSCURO
SERPIENTE_SPRITE1A	equ		#0020	;32
SERPIENTE_SPRITE2A	equ		#0024	;36
SERPIENTE_SPRITE1B	equ		#0028	;40
SERPIENTE_SPRITE2B	equ		#002C	;44
SERPIENTE_POSY		equ		#0048	;72
SERPIENTE_LIMIZQ	equ		#0028	;40
SERPIENTE_LIMDER	equ		#00C8	;200

;;ETIQUETAS/CONSTANTES MURCIELAGO
MURCIELAGO_COLOR	equ		#0001	;1 - NEGRO
MURCIELAGO_SPRITE1A	equ		#0038	;56
MURCIELAGO_SPRITE2A	equ		#003C	;60
MURCIELAGO_LIMIZQ	equ		#0020	;16
MURCIELAGO_LIMDER	equ		#00DE	;232
MURCIELAGO_HORIZON	equ		#0018	;24
MURCIELAGO_PASOS  	equ		192

;;ETIQUETAS/CONSTANTES LOBO
TIPOLOBO			equ		6
LOBO_COLOR			equ		#01		;1 - NEGRO
LOBO_SPRITE1A		equ		64
LOBO_SPRITE2A		equ		68
LOBO_SPRITE3A		equ		72
LOBO_SPRITE4A		equ		76
LOBO_SPRITE1B		equ		80
LOBO_SPRITE2B		equ		84
LOBO_SPRITE3B		equ		88
LOBO_SPRITE4B		equ		92
LOBO_LIMIZQ			equ		8
LOBO_LIMDER			equ		216
LOBO_POSY			equ		95

;;ETIQUETAS/CONSTANTES JEFELOBO
TIPOJEFELOBO		equ		14
JEFELOBO_COLOR		equ		#01		;1 - NEGRO
JEFELOBO_LIMIZQ1	equ		0
JEFELOBO_LIMIZQ2	equ		32
JEFELOBO_LIMDER		equ		216
JEFELOBO_POSY		equ		96
JEFELOBO_SPRITE1A	equ		192
JEFELOBO_SPRITE2A	equ		196
JEFELOBO_SPRITE3A	equ		200
JEFELOBO_SPRITE4A	equ		204
JEFELOBO_SPRITE1B	equ		208
JEFELOBO_SPRITE2B	equ		212
JEFELOBO_SPRITE3B	equ		216
JEFELOBO_SPRITE4B	equ		220
JEFELOBO_SPRITE1C	equ		224
JEFELOBO_SPRITE2C	equ		228
JEFELOBO_SPRITE3C	equ		232
JEFELOBO_SPRITE4C	equ		236
JEFELOBO_SPRITE1D	equ		240
JEFELOBO_SPRITE2D	equ		244
JEFELOBO_SPRITE3D	equ		248
JEFELOBO_SPRITE4D	equ		252


;;ETIQUETAS/CONSTANTES ESQUELETO
TIPOESQUELETO		equ		7
ESQUELETO_COLOR		equ		15		;15 - BLANCO
ESQUELETO_SPRITE1A	equ		96
ESQUELETO_SPRITE2A	equ		100
ESQUELETO_SPRITE3A	equ		104
ESQUELETO_SPRITE4A	equ		108
ESQUELETO_SPRITE1B	equ		112
ESQUELETO_SPRITE2B	equ		116
ESQUELETO_SPRITE3B	equ		120
ESQUELETO_SPRITE4B	equ		124
ESQUELETO_POSX		equ		0
ESQUELETO_POSY		equ		96


;;ETIQUETAS/CONSTANTES ZOMBI
TIPOZOMBI			equ		8
ZOMBI_COLOR_A		equ		15		;15 - BLANCO
ZOMBI_COLOR_B		equ		15		;15 - BLANCO
ZOMBI_SPRITE1A		equ		128
ZOMBI_SPRITE2A		equ		132
ZOMBI_SPRITE3A		equ		136
ZOMBI_SPRITE4A		equ		140
ZOMBI_SPRITE1B		equ		144
ZOMBI_SPRITE2B		equ		148
ZOMBI_SPRITE3B		equ		152
ZOMBI_SPRITE4B		equ		156
ZOMBI_LIMX_DER		equ		216
ZOMBI_LIMX_IZQ		equ		32
ZOMBI_POSX			equ		200
ZOMBI_POSY			equ		64


;;ETIQUETAS/CONSTANTES JEFEMURCIELAGO
TIPOJEFEMURCIELAGO		equ		15
JEFEMURCIELAGO_COLOR	equ		#01		;1 - NEGRO
JEFEMURCIELAGO_LIMIARR	equ		0
JEFEMURCIELAGO_LIMIABA	equ		96
JEFEMURCIELAGO_SPRITE1A	equ		224
JEFEMURCIELAGO_SPRITE2A	equ		228
JEFEMURCIELAGO_SPRITE3A	equ		232
JEFEMURCIELAGO_SPRITE4A	equ		236
JEFEMURCIELAGO_SPRITE1B	equ		240
JEFEMURCIELAGO_SPRITE2B	equ		244
JEFEMURCIELAGO_SPRITE3B	equ		248
JEFEMURCIELAGO_SPRITE4B	equ		252


;;ETIQUETAS/CONSTANTES FANTASMA
TIPOFANTASMA		equ		9
FANTASMA_COLOR		equ		1		;15 - BLANCO
FANTASMA_SPRITE1A	equ		160
FANTASMA_SPRITE2A	equ		164
FANTASMA_SPRITE1B	equ		168
FANTASMA_SPRITE2B	equ		172
FANTASMA_LIM_PASOS  equ		100
FANTASMA_X1			equ		64
FANTASMA_Y1			equ		24
FANTASMA_X2			equ		160
FANTASMA_Y2			equ		24
FANTASMA_X3			equ		40
FANTASMA_Y3			equ		64
FANTASMA_X4			equ		184
FANTASMA_Y4			equ		64


;;ETIQUETAS/CONSTANTES JEFEFANTASMA
TIPOJEFEFANTASMA		equ		16
JEFEFANTASMA_COLOR		equ		1		;15 - BLANCO
JEFEFANTASMA_SPRITE1A	equ		224
JEFEFANTASMA_SPRITE2A	equ		228
JEFEFANTASMA_SPRITE3A	equ		232
JEFEFANTASMA_SPRITE4A	equ		236
JEFEFANTASMA_SPRITE1B	equ		240
JEFEFANTASMA_SPRITE2B	equ		244
JEFEFANTASMA_SPRITE3B	equ		248
JEFEFANTASMA_SPRITE4B	equ		252
JEFEFANTASMA_LIM_PASOS  equ		100
JEFEFANTASMA_X1			equ		8
JEFEFANTASMA_Y1			equ		8
JEFEFANTASMA_X2			equ		104
JEFEFANTASMA_Y2			equ		8
JEFEFANTASMA_X3			equ		224
JEFEFANTASMA_Y3			equ		16
JEFEFANTASMA_X4			equ		24
JEFEFANTASMA_Y4			equ		48
JEFEFANTASMA_X5			equ		168
JEFEFANTASMA_Y5			equ		24
JEFEFANTASMA_X6			equ		192
JEFEFANTASMA_Y6			equ		88
JEFEFANTASMA_X7			equ		128
JEFEFANTASMA_Y7			equ		72
JEFEFANTASMA_X8			equ		64
JEFEFANTASMA_Y8			equ		88


;;ETIQUETAS/CONSTANTES CABALLEROG
TIPOCABALLEROGRIS	equ		10
CABALLERO_COLOR		equ		1		;15 - BLANCO
CABALLERO_SPRITE1A	equ		64
CABALLERO_SPRITE2A	equ		68
CABALLERO_SPRITE3A	equ		72
CABALLERO_SPRITE4A	equ		76
CABALLERO_SPRITE1B	equ		80
CABALLERO_SPRITE2B	equ		84
CABALLERO_SPRITE3B	equ		88
CABALLERO_SPRITE4B	equ		92
CABALLERO_POSYINI	equ		48
CABALLERO_POSXINI	equ		192
CABALLERO_PASOS  	equ		20


