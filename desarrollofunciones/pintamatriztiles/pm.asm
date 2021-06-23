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
	
	;esperamos que se pulse tecla
	CALL	CHGET
	
	RET
	
;;***************************************************
;;subrutina pinta array
;;***************************************************
;;funcion:  se le pasa un array con posiciones de tiles y coordenadas x e y y los pinta en screen 2
;;entrada:	array_posiciones HL, posy B, posx C, filas D, columnas E
;;salida:	-
pinta_array:
	
	;opciones que barajo
	;a) pintar por filas
	LD		HL,array_aux_vidas
	LD		DE,SC2MAP + POSVIDAS 	;inicio posición en el mapa de tiles de las vidas
	LD		BC,NMAXVIDREL			;hay 8 posiciones para vidas/reliquias o espacios en negro si no tiene 8 vidas/reliquias
	CALL	LDIRVM
	
	
	;b) pintar cada tile individualmente
	IN		 A,(REGEST)		;leer registro de estado (recomendado)
	LD		 A,C			;primero byte bajo	
	OUT		(REGEST),A
	LD		 A,B			;después byte alto  ********************** preguntar a Fernando cómo que byte bajo es B
	OR		1000000b		;+64
	OUT		(REGEST),A
	
	LD		A,D
	OUT		(REGESCVDP),A	;escribe A en VRAM en la posición indicada por los dos OUT anteriores
	
fin_pinta_array:
	RET

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
	
array_posiciones:
	DB	1,1,1,1,1,1,1,1

END:
	
	
	
	
	
	
	
	
	
	
	
	
