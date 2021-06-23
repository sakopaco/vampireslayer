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

mira_pinta_puertas:
	LD		 A,(actualiza_puertas_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_puertas
	
	;aquí se buscaría de la posición del usuario en la matriz de niveles y se saca el valor de A
	;suponermos que pinta (debajo)
	LD		 A,00001110b
	CALL	pinta_puertas
fin_mira_pinta_puertas:
	
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
	
	CALL	mira_pinta_energia		;actualiza el array de energia siempre
	
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

	;LD			 A,1
	;LD			(actualiza_puertas_sn,A (1 actualiza y 0 no actualiza puertas)
	
fin_inicializa_variables_pruebas:
	RET



;;=====================================================
;;PINTA_PUERTAS
;;=====================================================	
; función: 	examina A y mira si tiene que pintar puertas de los lados, arriba o abrajo o las escaleras (o no)
; entrada: 	A (se miran los 5 bits más bajos) 1 escalera 1 puerta arriba 1 pu der 1 pu aba 1 pu izq (si es 0 pinta pared)
; salida: 	-
; toca:		- A
pinta_puertas:

	BIT		0,A
	CALL	z,pinta_puerta_izq

	BIT		1,A
	CALL	z,pinta_puerta_aba

	BIT		2,A
	CALL	z,pinta_puerta_der
	
	BIT		3,A
	CALL	z,pinta_puerta_arr

	;~ LD		 B,A

;~ mira_escalera:
;~ no_pinta_escalera:
;~ fin_mira_escalera:

;~ mira_puerta_1:
;~ no_pinta_puerta_1:
;~ fin_mira_puerta_1:

;~ mira_puerta_2:
;~ no_pinta_puerta_2:
;~ fin_mira_puerta_2:

;~ mira_puerta_3:
	;~ AND		00000010b
	;~ JP		Z,no_pinta_puerta_3
;~ no_pinta_puerta_3:
;~ fin_mira_puerta_4:

;~ mira_puerta_4:
;~ no_pinta_puerta_4:
;~ fin_mira_puerta_4:

	;~ XOR		 A
	;~ LD		actualiza_puertas_sn,A 	;como ya se ha actualizado se pone a 0 (se volverá a poner a 1 al cambiar de pantalla)
fin_pinta_puertas:
	RET


pinta_puerta_arr:
	PUSH	AF
	
	
	
	POP		AF
fin_pinta_puerta_arr:
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
