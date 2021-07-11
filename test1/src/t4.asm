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
	
	;carga sprites en memoria (SE HA RETRASADO HASTA PARAMETRIZAR LA CARGA DE PANTALLAS)
;	CALL 	carga_patrones_sprites
	
	;funciones que modificarian el marcador si se produce un evento cuando toque y cuando se pinta la pantalla ya se mira
	;una variable para ver si el array hay que actualizarlo en pantalla o no
	CALL	actualiza_marcador_vidas
	CALL	actualiza_marcador_reliquias
	CALL	pinta_nivel
	CALL	borra_mapa

	CALL	localiza_info_habitacion	;devuelve variable habitacion_actual 	

	LD		 A,1
	CALL	posiciona_en_mapa		;se le pasa A 1 (tile del prota) está el prota y prota.poxx y posy

	
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
	
	CALL	mira_pinta_energia		;actualiza el array de energia siempre pero no pinta eso lo hace pinta_energia
	
	JP		loop_principal
fin_programa_principal:
	RET







;;=====================================================
;;POSICIONA_EN_MAPA
;;=====================================================	
; función: 	en el mapa de marcadores de la derecha/abajo marca un cuadro en gris o con un muñeco
;			según el valor de prota.posición pinta entrá un muñeco y por donde vaya pasando el prota
;			quedará en gris
; entrada: 	A=0 gris 1 - tile 0, A=1 muñeco - tile 19, prota.pos_mapy,prota.pos_mapx)
; salida: 	-
; toca:		todos
posiciona_en_mapa:
	PUSH	AF		;almacenamos el tipo a pintar para cuando terminemos de calcular la coordenada
	
	;#0238 es la posición en mapa de tiles de la esquina superior izquierda del mapa (569 en decimal)
	LD		HL, SC2MAP + POSMAPA;pos inicial
	
	;ahora se le calcula la fila a pintar ya que va de abajo a arriba y no como en el mapa + columna
	
.sumar_fila:
	LD		 A,(prota.pos_mapy)
	CP		 1
	JR		 Z, .fila_1
	LD		 A,(prota.pos_mapy)
	CP		 2
	JR		 Z, .fila_2
	LD		 A,(prota.pos_mapy)
	CP		 3
	JR		 Z, .fila_3
	LD		 A,(prota.pos_mapy)
	CP		 4
	JR		 Z, .fila_4
	LD		 A,(prota.pos_mapy)
	CP		 5
	JR		 Z, .fila_5
	LD		 A,(prota.pos_mapy)
	CP		 6
	JR		 Z, .sumar_columna
	;no consulto la 0 porque si no es ninguna de las anteriores es 0 y por tanto sería un jr fila_0
	
.fila_0:
	LD		DE, 192
	ADD		HL, DE			;nota: se que repito el ADD pero la otra opción es inicializar DE y ya tarda mucho la funicón (es por velicidad)
	JP		.sumar_columna
.fila_1:
	LD		DE, 160
	ADD		HL, DE
	JP		.sumar_columna
.fila_2:
	LD		DE, 128
	ADD		HL, DE
	JP		.sumar_columna
.fila_3:
	LD		DE, 96
	ADD		HL, DE
	JP		.sumar_columna
.fila_4:
	LD		DE, 64
	ADD		HL, DE
	JP		.sumar_columna
.fila_5:
	LD		DE, 32
	ADD		HL, DE
	JP		.sumar_columna
.fila_6:
	;pongo fila_6 por poner ya que si es la fila 6 equiv. a primera fila del mapa y por tanto no suma fila
	
	
.sumar_columna:
	LD 		 A, (prota.pos_mapx) ;POS X
	LD		 D, 0
	LD		 E, A
	ADD		HL, DE
	
	;resultado en BC para usar en la función pinta_tile_suelto
	LD		 B, H
	LD		 C, L
	
	;	LD		BC,SC2MAP + POSNIVEL + 7;posición en el mapa de tiles del tile de nivel
	
	;terminado de fijar la coordenada recuperamos a para ver el tipo
	POP		 AF
	OR		 A
	JP		 Z, pinta_pos_mapa_vacio
	LD		 D, TILEMAPPROT
	JP		fin_pinta_pos_mapa
pinta_pos_mapa_vacio:
	LD		 D, TILEMAPVACI				;********************* se puede hacer mejor o está bien usar push y pop ¿?¿?¿?

fin_pinta_pos_mapa:
	CALL	pinta_tile_suelto
fin_posiciona_en_mapa:
	RET






;;*******************************************************************
; sólo para hacer pruebas y pintar la parte de las vidas y demás
inicializa_variables_pruebas:
	LD		 A, 4
	LD		(prota.vidas),A

	LD		 A, SI	
	LD		(actualiza_vidas_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A, 5
	LD		(prota.reliquias), A
	
	LD		 A, SI	
	LD		(actualiza_reliquias_sn), A	;actualizo la variable para que pinte vidas 1 sí / 0 no

	LD		 A, 100
	LD		(prota.energia), A

	LD		 A, 1
	LD		(prota.nivel), A		;nivel empieza en 0 para usar las posiciones ascii
	
	;ubico al prota dentro del nivel para obtener luego las habitaciones y enemigos que aparecerán
	;será igual la posición inicial en todos los niveles
	LD		 A, 2
	LD		(prota.pos_mapy), A	;pos y dentro del nivel (se empieza en 0)
	LD		 A, 6				;en realidad es la posición 4 pero se empieza a numerar en 0
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
