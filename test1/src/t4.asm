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
	
	;inicializa los niveles por partida
	CALL	inicializa_niveles			;no es necesario parametrizarlo según el nivel del usuario ya que se cargan todos
	
	;pinta la pantalla (la primera o algunas especiales se pintan completamente)
	CALL	pinta_pantalla_completa 
	
;	;carga sprites en memoria (SE HA RETRASADO HASTA PARAMETRIZAR LA CARGA DE PANTALLAS)
;	CALL 	carga_patrones_sprites
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	;una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	actualiza_marcador_vidas
	CALL	actualiza_marcador_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa
	

;	CALL	posiciona_en_mapa (ha cambiado ahroa usa variable porsiciona mapa depurar) *************************** funcion a actualizar 	
	
loop_principal:
	HALT							;espera VBLANK y sincroniza
	CALL	pinta_energia			;pinta la energia en pantalla

mira_pinta_puertas:
	LD		 A,(actualiza_puertas_sn)
	OR		 A
	JR		 Z,fin_mira_pinta_puertas
	
	;primero preparo la pantalla como si no hubiera puertas
	CALL 	pinta_parte_superior_pantalla
	
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
fin_programa_principal:
	RET
	

;;*******************************************************************

; sólo para hacer pruebas y pinter la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 3
	LD		(prota.vidas),A

	LD		 A, SI	
	LD		(actualiza_vidas_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A, 2
	LD		(prota.reliquias), A
	
	LD		 A, SI	
	LD		(actualiza_reliquias_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A, 8
	LD		(prota.energia), A

	LD		 A, 0
	LD		(prota.nivel), A		;nivel empieza en 0 para usar las posiciones ascii
	
	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles
	LD		 A, 6
	LD		(prota.pos_mapy), A	;pos y dentro del nivel (se empieza en 0)
	LD		 A, 3				;en realidad es la posición 4 pero se empieza a numerar en 0
	LD		(prota.pos_mapx), A	;pos y dentro del nivel (se empieza en 0)

	
	;************************************************
	;importante : revisar pintado de mapa

	LD			 A, 1 
	LD			(actualiza_puertas_sn), A;(1 actualiza y 0 no actualiza puertas)
fin_inicializa_variables_pruebas:
	RET
;;************************************************************************









;;=====================================================
;;DEFINICIÓN DE SUBRUTINAS
;;=====================================================
	include "subrutinas.asm"
	
	include "subr_pintapantalla.asm"
	

;Este include lleva la rutina de descompresión de ROM/RAM a VRAM de pletter
;Está adaptada de la original a sjasm
;	HL = RAM/ROM source	; DE = VRAM destination
depack_VRAM:
	include "PL_VRAM_Depack_SJASM.asm"


	
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
