<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1621632125128" ID="ID_1960522832" MODIFIED="1621632266226" TEXT="programa ASM">
<node CREATED="1621632194906" ID="ID_88161920" MODIFIED="1621633551605" POSITION="left" STYLE="bubble" TEXT="Declaraci&#xf3;n etiquetas"/>
<node CREATED="1621632163382" HGAP="21" ID="ID_401289408" MODIFIED="1621633558729" POSITION="left" STYLE="bubble" TEXT="Declaraci&#xf3;n variables" VSHIFT="5"/>
<node CREATED="1621633366093" HGAP="30" ID="ID_429057716" MODIFIED="1621633546626" POSITION="left" STYLE="bubble" TEXT="Definici&#xf3;n estructuras" VSHIFT="-2">
<node CREATED="1621633391789" ID="ID_1281721151" MODIFIED="1621633418213" TEXT="estructura_puntomira"/>
<node CREATED="1621633404130" ID="ID_767721556" MODIFIED="1621633418213" TEXT="estructura_enemigo"/>
</node>
<node CREATED="1621632181351" HGAP="57" ID="ID_215612223" MODIFIED="1621633538845" POSITION="right" STYLE="bubble" TEXT="Prepara entorno" VSHIFT="-24">
<node CREATED="1621632624164" ID="ID_1609925608" MODIFIED="1621632723740" TEXT="Otros">
<node CREATED="1621632727444" ID="ID_788193042" MODIFIED="1621632733321" TEXT="elimina_clic"/>
<node CREATED="1621632735388" ID="ID_1265775556" MODIFIED="1621632744837" TEXT="desactiva_pantalla"/>
<node CREATED="1621632746956" ID="ID_126901739" MODIFIED="1621632753149" TEXT="activa_pantalla"/>
</node>
<node CREATED="1621632667692" ID="ID_1119972228" MODIFIED="1621632681455" TEXT="prepara_pantalla">
<node CREATED="1621632881868" ID="ID_1280220246" MODIFIED="1621632889174" TEXT="limpia_pantalla"/>
<node CREATED="1621632891284" ID="ID_481946165" MODIFIED="1621632904496" TEXT="set_color"/>
<node CREATED="1621632906412" ID="ID_547138702" MODIFIED="1621633578759" STYLE="fork" TEXT="screen2 + sprites 16x16 normales"/>
</node>
<node CREATED="1621632685468" ID="ID_1719586373" MODIFIED="1621632695756" TEXT="carga_patrones_sprites"/>
<node CREATED="1621632709244" ID="ID_1186503190" MODIFIED="1621633008387" TEXT="carga_pantalla">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      carga patrones
    </p>
    <p>
      carga mapa pantalla
    </p>
    <p>
      carga colores patrones
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1621632272150" HGAP="69" ID="ID_1272033506" MODIFIED="1621633534776" POSITION="right" STYLE="bubble" TEXT="Bucle principal" VSHIFT="-18">
<node CREATED="1621632764596" ID="ID_754521442" MODIFIED="1621633590927" STYLE="fork" TEXT="HALT"/>
<node CREATED="1621632771133" ID="ID_1359865835" MODIFIED="1621633187398" TEXT="volcado_atributos_sprites_a_VRAM">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      atributos_sprite_pm
    </p>
    <p>
      
    </p>
    <p>
      <font color="#ff0000">falta atributos de la serpiente seg&#250;n posici&#243;n que toque</font>
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621632788732" ID="ID_630656788" MODIFIED="1621633297509" TEXT="mira_teclado_actualiza_posiciones">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      por ahora s&#243;lo mira cursores
    </p>
  </body>
</html></richcontent>
<node CREATED="1621633189850" ID="ID_858048408" MODIFIED="1621633326762" TEXT="mira teclado">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      GTSTCK
    </p>
    <p>
      
    </p>
    <p>
      <font color="#ff0033">hay que hacer que tb mire joystick</font>
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633212565" ID="ID_1856484102" MODIFIED="1621633337747" TEXT="arriba">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633220117" ID="ID_389111669" MODIFIED="1621633339980" TEXT="arribaderecha">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633225261" ID="ID_1530577518" MODIFIED="1621633341633" TEXT="derecha">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633230189" ID="ID_439715835" MODIFIED="1621633343333" TEXT="derechaabajo">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633235245" ID="ID_1427715831" MODIFIED="1621633345313" TEXT="abajo">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633238245" ID="ID_976656183" MODIFIED="1621633347638" TEXT="abajoizquierda">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633245445" ID="ID_1406660337" MODIFIED="1621633349227" TEXT="izquierda">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1621633252389" ID="ID_1408993514" MODIFIED="1621633353111" TEXT="izquierdaarriba">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tb mira l&#237;mites de pantalla
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1621632804740" ID="ID_1828731574" MODIFIED="1621633120128" TEXT="actualiza_atributos_sprite">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      carga atributos sprite punto mira
    </p>
    <p>
      carga datos sprites (2) serpiente
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1621632476794" ID="ID_1711016497" MODIFIED="1621632557244" POSITION="left" STYLE="bubble" TEXT="Definici&#xf3;n constantes"/>
</node>
</map>
