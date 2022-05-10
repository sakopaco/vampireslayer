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
MURCIELAGO_LIMIZQ	equ		#0020	;32
MURCIELAGO_LIMDER	equ		#00DE	;207
MURCIELAGO_HORIZON	equ		#0018	;24

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
LOBO_POSY			equ		96

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
ZOMBI_POSX			equ		0
ZOMBI_POSY			equ		96



