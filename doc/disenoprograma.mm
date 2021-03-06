<map version="1.1.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1622145402544" ID="ID_704344221" MODIFIED="1622145411431" TEXT="programa ASM">
<node CREATED="1622145444971" ID="ID_1942422980" MODIFIED="1622145488820" POSITION="left" TEXT="Constantes BIOS"/>
<node CREATED="1622145466473" ID="ID_665166448" MODIFIED="1622145480153" POSITION="left" TEXT="Constantes archivo bin"/>
<node CREATED="1622145503371" ID="ID_4534354" MODIFIED="1622912299287" POSITION="left" TEXT="Constantes programa">
<node CREATED="1622145534230" ID="ID_1453297853" MODIFIED="1622145540589" TEXT="Limites"/>
<node CREATED="1622145550604" ID="ID_1178178824" MODIFIED="1622145558656" TEXT="Sprites"/>
</node>
<node CREATED="1622145520900" ID="ID_367554799" MODIFIED="1622145530277" POSITION="left" TEXT="Estructuras">
<node CREATED="1622283276642" ID="ID_1662225890" MODIFIED="1622283285530" TEXT="punto_mira">
<node CREATED="1622488180299" HGAP="29" ID="ID_1508061501" MODIFIED="1623688154681" TEXT="nivel" VSHIFT="13">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      empieza en 0 para usar las posiciones del mapa
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1622145751512" ID="ID_1911242454" MODIFIED="1622145755171" TEXT="energia"/>
<node CREATED="1622145746998" ID="ID_537221061" MODIFIED="1623434939166" TEXT="n_vidas">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      si hace falta se pueden unir las variables
    </p>
    <p>
      n_vidas y n_reliquias en un byte
    </p>
    <p>
      1111 (vidas 0-8) y 0000 reliquas (0-8)
    </p>
    <p>
      
    </p>
    <p>
      importante: las vidas van de 0 a 7 =&gt; 8 vidas (y se pinta en pantalla la vida 0)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1622145631148" ID="ID_810795369" MODIFIED="1623434891691" TEXT="n_reliquias">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      si hace falta se pueden unir las variables
    </p>
    <p>
      n_vidas y n_reliquias en un byte
    </p>
    <p>
      1111 (vidas 0-8) y 0000 reliquas (0-8)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1622283302264" ID="ID_1754584915" MODIFIED="1622283305694" TEXT="enemigo"/>
</node>
<node CREATED="1622145577653" ID="ID_1585760040" MODIFIED="1622488333258" POSITION="left" TEXT="Variables">
<node CREATED="1622145585575" ID="ID_735791965" MODIFIED="1623351225264" TEXT="punto_mira (prota)"/>
<node CREATED="1622145696235" ID="ID_342082184" MODIFIED="1623351261471" TEXT="n_enemigos_vivos"/>
<node CREATED="1622145737681" ID="ID_571800224" MODIFIED="1622145743260" TEXT="posicion_matriz">
<node CREATED="1622488208608" ID="ID_52790538" MODIFIED="1622488235459" TEXT="un byte (0-7, 0-7)"/>
</node>
<node CREATED="1622488318931" ID="ID_320421743" MODIFIED="1622488322194" TEXT="arrays">
<node CREATED="1622146240680" ID="ID_1431594522" MODIFIED="1622146256903" TEXT="array_sprites_pantalla"/>
<node CREATED="1622488340578" ID="ID_1554144761" MODIFIED="1622911933283" TEXT="array_enemigos_pantalla"/>
<node CREATED="1622911805264" ID="ID_1421647868" MODIFIED="1624301363956" TEXT="array_niveles">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Tipo DW
    </p>
    <p>
      0 - lleno o vac&#237;o (si ya se ha pasado)
    </p>
    <p>
      0000 - n&#186; puertas 1 arriba 1 derecha 1 abajo 1 izquierda
    </p>
    <p>
      1 - es pantalla final? (implica que pintar&#225; unas escaleras en la puerta superior)
    </p>
    <p>
      1 - hay reliquia?
    </p>
    <p>
      1 - hay vida extra?
    </p>
    <p>
      1 - hay arma extra (durar&#225; 6 pantallas - sonido distinto)
    </p>
    <p>
      1 - hay energ&#237;a? (sobran bits ... se puede usar otro como carga energ&#237;a +)
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1622911829423" ID="ID_1886966464" MODIFIED="1622911842112" TEXT="array_nivel1"/>
<node CREATED="1622911844095" ID="ID_364906659" MODIFIED="1622911846760" TEXT="array_nivel2"/>
<node CREATED="1622911847673" ID="ID_1975537452" MODIFIED="1622911850650" TEXT="array_nivel3"/>
<node CREATED="1622911856041" ID="ID_1480259804" MODIFIED="1622911858446" TEXT="array_nivel4"/>
<node CREATED="1622911859748" ID="ID_721093526" MODIFIED="1622911862049" TEXT="array_nivel5"/>
<node CREATED="1622911863125" ID="ID_340504692" MODIFIED="1622911865337" TEXT="array_nivel6"/>
<node CREATED="1622911866969" ID="ID_1348790684" MODIFIED="1622911876514" TEXT="array_nivel7"/>
</node>
</node>
<node CREATED="1622912759422" ID="ID_294820484" MODIFIED="1622912864429" TEXT="tiempo_salir">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      En caso de conseguir matar al jefe hay que salir en un tiempo
    </p>
  </body>
</html></richcontent>
<node CREATED="1622912768584" ID="ID_428752042" MODIFIED="1622912771963" TEXT="minutos"/>
<node CREATED="1622912773210" ID="ID_31313294" MODIFIED="1622912776821" TEXT="segundos"/>
</node>
</node>
<node CREATED="1622145781074" HGAP="19" ID="ID_359756947" MODIFIED="1622487985197" POSITION="right" TEXT="inicializa_pantalla" VSHIFT="-28">
<node CREATED="1622146803620" ID="ID_608256326" MODIFIED="1622146810549" TEXT="limpia_pantalla"/>
<node CREATED="1622145918561" ID="ID_318152453" MODIFIED="1622145923392" TEXT="colores"/>
<node CREATED="1622145910407" ID="ID_961971324" MODIFIED="1623262168059" TEXT="screen2,2"/>
</node>
<node CREATED="1622488445657" ID="ID_1010346842" MODIFIED="1622488458646" POSITION="right" TEXT="inicializa variables para pruebas">
<node CREATED="1622488461050" ID="ID_82185990" MODIFIED="1622488464402" TEXT="nivel"/>
<node CREATED="1622488503000" ID="ID_497153981" MODIFIED="1623351282188" TEXT="posicion"/>
<node CREATED="1622488465545" ID="ID_1596569817" MODIFIED="1622488467700" TEXT="vidas"/>
<node CREATED="1622488480605" ID="ID_1196920272" MODIFIED="1622488493011" TEXT="reliquias"/>
</node>
<node CREATED="1622487953600" ID="ID_1233622934" MODIFIED="1622488150982" POSITION="right" TEXT="inicializa_entorno">
<node CREATED="1622488151981" ID="ID_693055000" MODIFIED="1622488169845" TEXT="examina_nivel">
<node CREATED="1622146216352" FOLDED="true" ID="ID_1306361445" MODIFIED="1622147240291" TEXT="carga_sprites">
<node CREATED="1622146304008" ID="ID_1445489689" MODIFIED="1622146310740" TEXT="carga_patrones"/>
<node CREATED="1622146312648" ID="ID_1079164248" MODIFIED="1622146317112" TEXT="carga_colores"/>
<node CREATED="1622146318672" ID="ID_833408459" MODIFIED="1622146323742" TEXT="carga_mapa"/>
</node>
</node>
<node CREATED="1622488375255" ID="ID_618587182" MODIFIED="1622488418724" TEXT="examina_matriz_fase_posicion">
<node CREATED="1622145924766" ID="ID_1593287003" MODIFIED="1622912976735" TEXT="carga_fondo">
<node CREATED="1623262087949" ID="ID_1655529083" MODIFIED="1623262096223" TEXT="desactiva_pantalla"/>
<node CREATED="1622146176211" ID="ID_940567344" MODIFIED="1622146198112" TEXT="carga_patrones"/>
<node CREATED="1622146184890" ID="ID_1057578605" MODIFIED="1622146190423" TEXT="carga_colores"/>
<node CREATED="1622146201158" ID="ID_811163035" MODIFIED="1622146209176" TEXT="carga_mapa"/>
<node CREATED="1623262077962" ID="ID_626178406" MODIFIED="1623262084674" TEXT="activa_pantalla"/>
</node>
</node>
</node>
<node CREATED="1622145801739" HGAP="26" ID="ID_1541655476" MODIFIED="1622487934983" POSITION="right" TEXT="loop_principal" VSHIFT="-32">
<node CREATED="1622146353450" ID="ID_1162395150" MODIFIED="1622146356677" TEXT="HALT"/>
<node CREATED="1622146358699" ID="ID_524988188" MODIFIED="1622146380688" TEXT="vuelca_atributos_sprites_VRAM"/>
<node CREATED="1622146388711" FOLDED="true" ID="ID_1153214515" MODIFIED="1622487941660" TEXT="actualiza_posiciones">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      hay que ver d&#243;nde van las reliquias, vida, etc...
    </p>
  </body>
</html></richcontent>
<node CREATED="1622146405465" FOLDED="true" ID="ID_1500933088" MODIFIED="1622147246633" TEXT="mira_teclado_joystick">
<node CREATED="1622146871854" ID="ID_1165765776" MODIFIED="1622146879453" TEXT="mira_posicion">
<node CREATED="1622147111361" ID="ID_104666824" MODIFIED="1622147116486" TEXT="pos_arriba">
<node CREATED="1622147124332" ID="ID_913225807" MODIFIED="1622147131040" TEXT="limite_arriba"/>
</node>
<node CREATED="1622147136024" ID="ID_1691444804" MODIFIED="1622147139911" TEXT="............">
<node CREATED="1622147175070" ID="ID_1362713315" MODIFIED="1622147177744" TEXT="..............."/>
</node>
<node CREATED="1622147141957" ID="ID_397081729" MODIFIED="1622147163341" TEXT="pos_izquierda_arriba">
<node CREATED="1622147163352" ID="ID_1155785528" MODIFIED="1622147171818" TEXT="limite_izquierda_arriba"/>
</node>
</node>
<node CREATED="1622146882745" ID="ID_1403080211" MODIFIED="1622146889598" TEXT="mira_disparo">
<node CREATED="1622147090731" ID="ID_994003838" MODIFIED="1622147102065" TEXT="disparo_boton_1"/>
<node CREATED="1622147103660" ID="ID_1182528211" MODIFIED="1622147108785" TEXT="disparo_boton_2"/>
</node>
</node>
<node CREATED="1622146426616" ID="ID_1428433987" MODIFIED="1622146435257" TEXT="mira_punto_mira"/>
<node CREATED="1622146437278" ID="ID_467899767" MODIFIED="1622146465725" TEXT="mira_enemigos"/>
</node>
<node CREATED="1622146543820" FOLDED="true" ID="ID_634030605" MODIFIED="1622147247909" TEXT="actualiza_elementos_array_elementos">
<node CREATED="1622146564164" ID="ID_796068742" MODIFIED="1622146568968" TEXT="punto_mira"/>
<node CREATED="1622146572195" ID="ID_382171756" MODIFIED="1622146575205" TEXT="enemigos"/>
<node CREATED="1622146590778" ID="ID_1050636519" MODIFIED="1622147210143" TEXT="las vidas y energ&#xed;a se actualizan aqu&#xed; o cuando toque?????"/>
</node>
</node>
<node CREATED="1622145835192" ID="ID_361642530" MODIFIED="1622912888746" POSITION="right" TEXT="otras_funciones">
<node CREATED="1622145846435" ID="ID_1252974278" MODIFIED="1622145852729" TEXT="actualiza_vidas">
<node CREATED="1622146097852" ID="ID_1406574668" MODIFIED="1622146105700" TEXT="pinta_vidas"/>
</node>
<node CREATED="1622145857625" ID="ID_1534702338" MODIFIED="1622145864405" TEXT="actualiza_energia">
<node CREATED="1622146091435" ID="ID_1923291901" MODIFIED="1622146096019" TEXT="pinta_energia"/>
</node>
<node CREATED="1622145866644" ID="ID_818867562" MODIFIED="1622145877690" TEXT="actualiza_reliquias">
<node CREATED="1622146085546" ID="ID_598180178" MODIFIED="1622146089796" TEXT="pinta_reliquias"/>
</node>
<node CREATED="1622146052261" ID="ID_397022851" MODIFIED="1622146062944" TEXT="actualiza_pos_matriz">
<node CREATED="1622146078004" ID="ID_58067013" MODIFIED="1622146083834" TEXT="pinta_matriz"/>
</node>
<node CREATED="1622146111129" ID="ID_1463186063" MODIFIED="1622146118600" TEXT="actualiza_tiempo">
<node CREATED="1622146123233" ID="ID_490653239" MODIFIED="1622146127968" TEXT="pinta_tiempo"/>
</node>
</node>
</node>
</map>
