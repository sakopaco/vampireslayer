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
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
	
	
	JP		loop_principal
	
	RET

;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
inicializa_variables_pruebas:
	LD		 A,3
	LD		(prota.vidas),A

	LD		 A,SI	
	LD		(actualiza_vidas_sn),A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A,3
	LD		(prota.reliquias),A

	LD		 A,250
	LD		(prota.energia),A

	XOR		 A
	LD		(prota.nivel),A
	
	LD		 A,#04			;fila 0 columna 4
	LD		(prota.pos_nivel),A

;	CALL	pinta_vidas
;	CALL	pinta_reliquias
;	CALL	pinta_energía
;	CALL	pinta_pantalla -> CALL pinta_puertas
	
fin_inicializa_variables_pruebas:
	RET

;;=====================================================
;;ACTUALIZA_MARCADOR_VIDAS
;;=====================================================	
; función: 	pinta la parte inferior del escenario que es común
; entrada: 	prota.vidas
; salida: 	array_aux_vidas
; toca:		A,B,HL
actualiza_marcador_vidas:
	LD		HL,array_aux_vidas
	LD		 A,(prota.vidas)
	LD		 B,A
loop_marcador_caras: ;asignar caras
	LD		(HL),13			;13 posición mapa tiles para cara
	INC		HL
	DJNZ	loop_marcador_caras
fin_loop_marcador_caras:

	LD		 B,A
	SUB		 A,8
	LD		 B,A	
loop_marcador_caras_negro:	;asignar espacios en negro
	LD		(HL),0			;0 posición mapa tiles para nada (es transparente pero el fondo es negro)
	INC		HL
	DJNZ	loop_marcador_caras
fin_loop_marcador_caras_negro:

fin_actualiza_marcador_vidas:
	RET


;;=====================================================
;;PINTA_VIDAS
;;=====================================================	
; función: 	actualiza el mapa de tiles para queen el próximo refresco se pinten y actualiza_vidas_sn a 0
; entrada: 	array_aux_vidas
; salida: 	actualiza_vidas_sn
; toca:		B,HL
pinta_vidas:
	LD		HL,array_aux_vidas
	LD		DE,SC2MAP + #0249;
	LD		BC,8	;hay 8 posiciones para vidas o espacios en negro si no tiene 8 vidas
	CALL	LDIRVM
	
	;una vez quer está pintada ya no se actualizará a menos que perdamos/ganemos una vida
	XOR		 A
	LD		(actualiza_vidas_sn),A
fin_pinta_vidas:
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
; pasar a fichero aparte
;definicion de variable del prota usando la estructura del punto de mira
prota:		ESTRUCTURA_PUNTOMIRA

array_aux_vidas: 		;array para pintar de golpe el marcador de vidas
			DB		#00,#00,#00,#00,#00,#00,#00,#00 ;
fin_array_aux_vidas:
actualiza_vidas_sn:
			DB		0 ;valor que indica si hay que actualizar el marcador de vidas 1 ó no 0
fin_actualiza_vidas_sn:

array_aux_reliquias: 		;array para pintar de golpe el marcador de reliquias
			DB		#00,#00,#00,#00,#00,#00,#00,#00 ;
fin_array_aux_reliquias:
actualiza_reliquias_sn:
			DB		0 ;valor que indica si hay que actualizar el marcador de reliquias 1 ó no 0
fin_actualiza_reliquias_sn:

array_aux_energia:	;array para pintar de golpe el marcador de energía
			DB		#00,#00,#00,#00,#00,#00,#00,#00 ;
fin_array_aux_energia:
;(no sé si es útil) actualiza_vidas_sn:
;			DB		0 ;valor que indica si hay que actualizar el marcador de energía 1 ó no 0
;fin_actualiza_vida_sn:

;;=====================================================
;;DEFINICIÓN DE PANTALLAS
;;=====================================================		
	include "pantallas.asm"
	
END:
