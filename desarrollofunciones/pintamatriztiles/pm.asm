	output "pm.bin"
	
	
CHGET	equ		#009F
CHPUT	equ		#00A2
POSIT	equ		#00C6
INLIN   equ		#00B1
GTTRIG	equ		#00D8

RDVDP	equ		#013E
WRTVDP	equ		#0047
LDIRVM	equ		#005C
LDIRMV	equ		#0059
CHGMOD	equ		#005F

RG0SAV	equ		#F3DF
RG1SAV	equ		#F3E0
RG2SAV	equ		#F3E1
RG3SAV	equ		#F3E2
RG4SAV	equ		#F3E3
RG5SAV	equ		#F3E4
RG6SAV	equ		#F3E5
RG7SAV	equ		#F3E6
STATFL	equ		#F3E7

REGEST		equ		#0099	;registro de estado para escribir directamente en VRAM
REGESCVDP	equ		#0098	;registro donde escribir valor para VRAM

SC2MAP  equ		#1800


	db	#FE
	dw	START
	dw	END
	dw	START
	
	
	ORG	#8200
	
	
START:
	;ponemos screen 2
	LD	 	A,2
	CALL 	CHGMOD
	
	;cargando los tiles (voy a cargar el vacio y el lleno)
	;tercio 1
	LD		HL,tilevacio
	LD		DE,#0000
	LD		BC,2 * 8
	CALL	LDIRVM
	;tercio 2
	LD		HL,tilevacio
	LD		DE,#0800
	LD		BC,2 * 8
	CALL	LDIRVM
	;tercio 3
	LD		HL,tilevacio
	LD		DE,#1000
	LD		BC,2 * 8
	CALL	LDIRVM
	
	
	;cargando los colores de los tiles
	;tercio 1
	LD		HL,coltilevacio
	LD		DE,#2000
	LD		BC,2 * 8
	CALL	LDIRVM
	
	;tercio 2
	LD		HL,coltilevacio
	LD		DE,#2800
	LD		BC,2 * 8
	CALL	LDIRVM
	
	;tercio 3
	LD		HL,coltilevacio
	LD		DE,#3000
	LD		BC,2 * 8
	CALL	LDIRVM
	
	
	;cargando los posiciones de los patrones de los tiles
	;tercio 1
	LD		HL,pattiles
	LD		DE,#1800
	LD		BC,2
	CALL	LDIRVM
	
	
	
	
	LD		HL,SC2MAP + 256
	LD		(wordaux1),HL
	LD		B,H
	LD		C,L
	LD		D,2
	LD		E,4
	CALL	pinta_array

	
	;esperamos que se pulse tecla
	CALL	CHGET
	
	RET
	
;;***************************************************
;;subrutina pinta array
;;***************************************************
;;funcion:  se le pasa un array con posiciones de tiles y coordenadas x e y y los pinta en screen 2
;;entrada:	array_tiles HL, BC (posición en tilemap) , D filas y E columnas
;;salida:	-
;;guardar BC
pinta_array:
	;contamos con que la posición "global" en el tilemap está ya en BC
	
	;inicializa
	IN		 A,(REGEST)		;leer registro de estado (recomendado)
	
	;coloca puntero para pintar tile según BC
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR		1000000b		;+64
	OUT		(REGEST),A

	
	LD		HL,array_tiles
.pa_pinta_fila:
	LD		 B,E
.pa_pinta_columnas: ;finta la fila (pintando las columnas)
	LD		 A,(HL)
	OUT		(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
	INC		HL
	DJNZ	.pa_pinta_columnas
	
	;no es una solución elegante lo de repetir código pero queda claro
	;por si hay otra fila
	PUSH	HL
	LD		HL,(wordaux1)
	LD		BC,32
	ADD		HL,BC
	LD		(wordaux1),HL
	LD		B,H
	LD		C,L
	POP		HL
	
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR		1000000b		;+64
	OUT		(REGEST),A
	
	;si hay otra fila repite
	DEC		 D
	LD		 A,D		;¿hay otra fila?
	OR		 A
	JP		NZ,.pa_pinta_fila
	
	
fin_pinta_array:
	RET

byteaux1:
	DB	0
byteaux2:
	DB	0
wordaux1:
	DW	0
wordaux2:
	DW	0

tilevacio:
	DB	0,0,0,0,0,0,0,0

tilelleno:
	DB	#FF,#FE,#FF,#FE,#FF,#FE,#FF,#FE
	
coltilevacio:
	DB	0,0,0,0,0,0,0,0

coltilelleno:
	DB	#FE,#FF,#FE,#FF,#FE,#FF,#FE,#FF

pattiles:
	DB	#0000,#0001,#0002
	
array_tiles:
	DB	1,0,1,1,1,1,1,1

END:
	
	
	;~ ;opciones que barajo
	;~ ;a) pintar por filas
	;~ LD		HL,array_aux_vidas
	;~ LD		DE,SC2MAP + POSVIDAS 	;inicio posición en el mapa de tiles de las vidas
	;~ LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	;~ CALL	LDIRVM
	
	
	;~ ;b) pintar cada tile individualmente
	;~ IN		 A,(REGEST)		;leer registro de estado (recomendado)
	;~ LD		 A,C			;primero byte bajo	
	;~ OUT		(REGEST),A
	;~ LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	;~ OR		1000000b		;+64
	;~ OUT		(REGEST),A
	
	;~ LD		A,D
	;~ OUT		(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
	
	
	
	
	
	
	
	
	
