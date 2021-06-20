	OUTPUT	"t4.bin"
	
;;=====================================================
;;DEFINICIÓN DE CONSTANTES
;;=====================================================	
	include "constantes.asm"

;;=====================================================
;;DEFINICIÓN DE CABECERA DE ARCHIVO BIN
;;=====================================================		
	include "cabecerabin.asm"
	
START:
	
	;inicializa pantalla y entonrno
	CALL	sub_preparapantalla
	
	;inicializa variables para parametrizar funciones y que lo que se muestre sea variable (nº vidas, mapa, puertas, pantalla, etc...)
	CALL	inicializa_variables_pruebas
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	; una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	actualiza_marcador_vidas
	CALL	actualiza_marcador_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa
	
	LD 		 A,1
	LD		(prota.pos_mapx),A
	LD 		 A,6
	LD		(prota.pos_mapy),A
	LD		 A,1
	CALL	posiciona_en_mapa
	
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
	CALL	pinta_energia			;pinta la energia en pantalla
	
mira_pinta_vidas:
	LD		 A,(actualiza_vidas_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_vidas
	CALL	pinta_vidas
fin_mira_pinta_vidas:	

mira_pinta_reliquias:
	LD		 A,(actualiza_reliquias_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_reliquias
	CALL	pinta_reliquias
fin_mira_pinta_reliquias:
	
	CALL	mira_pinta_energia		;actualiza el array de energia
	
	NOP
		
	JP		loop_principal
	
	RET

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"

; sólo para hacer pruebas y pinter la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A,3
	LD		(prota.vidas),A

	LD		 A,SI	
	LD		(actualiza_vidas_sn),A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A,2
	LD		(prota.reliquias),A
	
	LD		 A,SI	
	LD		(actualiza_reliquias_sn),A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A,8
	LD		(prota.energia),A

	LD		 A,5
	LD		(prota.nivel),A		; nivel empieza en 0 para usar las posiciones ascii
	
	;~ LD 		 A,3
	;~ LD		(prota.pos_mapx),A
	;~ LD 		 A,3
	;~ LD		(prota.pos_mapy),A
	;~ XOR		 A				;0 => celda por la que se ha pasado / 1 => celda en la que se está (tile de un muñeco)


;	CALL	pinta_pantalla -> CALL pinta_puertas
;	CALL	borra_mapa
	
fin_inicializa_variables_pruebas:
	RET




;;=====================================================
;;POSICIONA_EN_MAPA
;;=====================================================	
; función: 	en el mapa de marcadores de la derecha/abajo marca un cuadro en gris o con un muñeco
;			según el valor de prota.posición pinta entrá un muñeco y por donde vaya pasando el prota
;			quedará en gris
; entrada: 	A (tipo 0 gris 1 - tile 0,muñeco - tile 19) *********** no sé si sería bueno usar PUSH A y aquí POP A
; salida: 	-
; toca:		- A
posiciona_en_mapa:
	PUSH	 AF		;almacenamos el tipo a pintar para cuando terminemos de calcular la coordenada
	
	;#0238 es la posición en mapa de tiles de la esquina superior izquierda del mapa (569 en decimal)
	LD		HL,SC2MAP + POSMAPA ;pos inicial
	;~ ;ahora se le suma la fila * 32 + columna

	;sumar fila
	LD		DE,32	;32 ancho del mapa de tiles de una pantalla
	LD 		 A,(prota.pos_mapy)
	LD		 B,A
prod_coloca_fila:	
	ADD		HL,DE
	DJNZ	prod_coloca_fila
	
	;suma columna
	LD		DE,#0003
	ADD		HL,DE
	
	;resultado en BC
	LD		 B,H
	LD		 C,L
	
	;terminado de fijar la coordenada recuperamos a para ver el tipo
	POP		 AF
	OR		 A
	JP		 Z,pinta_pos_mapa_vacio
	LD		 D,TILEMAPPROT
	JP		fin_pinta_pos_mapa
pinta_pos_mapa_vacio:
	LD		 D,TILEMAPVACI

fin_pinta_pos_mapa:
	CALL	pinta_tile_suelto
fin_posiciona_en_mapa:
	RET


	
;;=====================================================
;;DEFINICIÓN DE ESTRUCTURAS
;;=====================================================		
	include "estructuras.asm"
	
;;=====================================================
;;DEFINICIÓN DE VARIABLES
;;=====================================================		
	include "sprites.asm"
	
	include "habitaciones.asm"
	
	include "variables.asm"
	
;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	
END:
