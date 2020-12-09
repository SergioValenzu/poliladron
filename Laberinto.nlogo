breed [ladrones ladron]
breed [policias policia]; especies 

to setup
    clear-turtles
    clear-all
    draw-walls
    create-ladrones 1
    ask ladron 0 [
    set color red
    set shape "person"
    set size 2
    setxy 16 -13
    set heading (90 * random 4);A: Mueve a 0 , 90 , 180 ó 270.
   ]

   create-policias 5
    ask policias [
    set shape "person police"
    set size 3
    set color blue
    setxy (int random-xcor) (int random-ycor) ;A: coordenadas enteras
    set heading (90 * random 4);A: Mueve a 0 , 90 , 180 ó 270.
    ;Ojo... Las coordenadas enteras y los angulos rectos son necesarios para saber si el policia esta en la misma fila o columna  que el ladron   
    ]

end

to paso-simulacion
    ask ladron 0 [
    avanzar
    ]
    ask policias [ 
    mirar-hacia-ladron-si-lo-ve
    avanzar
    ]
end

 
to mirar-hacia-ladron-si-lo-ve 
  ;Ojo... Las coordenadas enteras y los angulos rectos son necesarios para saber si el policia esta en la misma fila o columna  que el ladron
  print xcor 
  if xcor = [ xcor ] of ladron 0 ;A: misma columna
  [
    set color yellow
    face ladron 0
  ]
  if ycor = [ ycor ] of ladron 0 ;A: misma fila
  [
    set color orange
    face ladron 0
  ]
end

to avanzar
 ; colocar una condicion que si llega el limite regresar
 show heading 
 let color-delante [ pcolor ] of patch-ahead 1
    ifelse color-delante = pink [
    ifelse  (random 2 = 1) [right 90][left 90]
    avanzar
  ]
  [ forward 1 ]
end

to draw-walls ; las paredes
  ; draw left and right walls
  ask patches with [abs pxcor = max-pxcor]
                   [ set pcolor pink]

     ask patch -16  15  [set pcolor black];entrada
     ask patch -16  14  [set pcolor black]
     ask patch  16 -13  [set pcolor black]
     ask patch  16 -12  [set pcolor black]; salida


  ; draw top and bottom walls
  ask patches with [abs pycor = max-pycor]
                   [ set pcolor pink ]
 

   let ycord 15
  repeat 13 [ ;con este for repeat se repite las veces que quiero la cordenada de y
  ; aqui es la separacion de ancho el espacio que hay ente la pared
  ask patch 8 ycord [set pcolor pink]; red
  ask patch 13 ycord [set pcolor pink]
  ask patch -13 ycord [set pcolor pink]
  set ycord ycord  - 1
]

   let xcord 9
  repeat 2 [
  ask patch  xcord 13 [set pcolor pink];rosa
  set xcord xcord  + 1
  ]

 let xcord1 9
  repeat 5 [
  ask patch  xcord -5 [set pcolor pink];rosa
  set xcord xcord  + 1
  ]
  let xcord2 0
  repeat 15 [
  ask patch  xcord -1 [set pcolor pink];rosa
  set xcord xcord  + 1
  ]

  let x 0
  repeat 6[
  ask patch -11 3  [set pcolor pink];rosa
  ask patch -12 3  [set pcolor pink];rosa
  ask patch -10 3  [set pcolor pink];rosa
  ask patch  -9 3  [set pcolor pink];rosa
  ask patch  -8 3  [set pcolor pink];rosa
  ask patch  -7 3  [set pcolor pink];rosa

  ask patch  -6 12  [set pcolor pink];rosa
  ask patch  -5 12  [set pcolor pink];rosa
  ask patch  -4 12  [set pcolor pink];rosa
  ask patch  -3 12  [set pcolor pink];rosa
    
  ask patch  -3 8  [set pcolor pink];rosa
  ask patch   -2 8  [set pcolor pink];rosa
  ask patch   -1 8  [set pcolor pink];rosa
  ask patch  -0  8  [set pcolor pink];rosa
  ask patch  1  8  [set pcolor pink];rosa

  ask patch  -0 -6  [set pcolor pink];rosa
  ask patch  -1 -6  [set pcolor pink];rosa
  ask patch  -2 -6  [set pcolor pink];rosa
  ask patch  -3 -6  [set pcolor pink];rosa
  ask patch  -4 -6  [set pcolor pink];rosa
  ask patch  -5 -6  [set pcolor pink];rosa
  ask patch  -6 -6  [set pcolor pink];rosa
  ask patch  -7 -6  [set pcolor pink];rosa
  ask patch  -8 -6  [set pcolor pink];rosa
  ask patch  -9 -6  [set pcolor pink];rosa
  ask patch -10 -6  [set pcolor pink];rosa
  ask patch -11 -6  [set pcolor pink];rosa


       ask patch -2  12  [set pcolor pink];rosa
       ask patch -1  12  [set pcolor pink];rosa
       ask patch  0  12  [set pcolor pink];rosa
       ask patch  1  12  [set pcolor pink];rosa
       ask patch  2  12  [set pcolor pink];rosa
       ask patch  3  12  [set pcolor pink];rosa
       ask patch  4  12  [set pcolor pink];rosa
       ask patch  5  12  [set pcolor pink];rosa

       ask patch  4 -9   [set pcolor pink];rosa
       ask patch  3 -9   [set pcolor pink];rosa
       ask patch  2 -9   [set pcolor pink];rosa
       ask patch  1 -9   [set pcolor pink];rosa
       ask patch  0 -9   [set pcolor pink];rosa
       ask patch -1 -9   [set pcolor pink];rosa
       ask patch -2 -9   [set pcolor pink];rosa
       ask patch -3 -9   [set pcolor pink];rosa
       ask patch -4 -9   [set pcolor pink];rosa
       ask patch -5 -9   [set pcolor pink];rosa
       ask patch -6 -9   [set pcolor pink];rosa
       ask patch -7 -9   [set pcolor pink];rosa

       ask patch -6 -11    [set pcolor pink];rosa
       ask patch -5 -11    [set pcolor pink];rosa
       ask patch -4 -11    [set pcolor pink];rosa
       ask patch -3 -11    [set pcolor pink];rosa
       ask patch -2 -11    [set pcolor pink];rosa
       ask patch -1 -11    [set pcolor pink];rosa
       ask patch  0 -11    [set pcolor pink];rosa
       ask patch  1 -11    [set pcolor pink];rosa
       ask patch  2 -11    [set pcolor pink];rosa
       ask patch  3 -11    [set pcolor pink];rosa
       ask patch  4 -11    [set pcolor pink];rosa
       ask patch  5 -11    [set pcolor pink];rosa
       ask patch  6 -11    [set pcolor pink];rosa
       ask patch  7 -11    [set pcolor pink];rosa
       ask patch  8 -11    [set pcolor pink];rosa
       ask patch  9 -11    [set pcolor pink];rosa
       ask patch  10 -11   [set pcolor pink];rosa
       ask patch  11 -11   [set pcolor pink];rosa
       ask patch  12 -11   [set pcolor pink];rosa
       ask patch  13 -11   [set pcolor pink];rosa
       ask patch  14 -11   [set pcolor pink];rosa
       ask patch  15 -11   [set pcolor pink];rosa



       ask patch  -10 -14  [set pcolor pink];rosa
       ask patch -9 -14    [set pcolor pink];rosa
       ask patch  -8 -14   [set pcolor pink];rosa
       ask patch  -7 -14   [set pcolor pink];rosa
       ask patch  -6 -14   [set pcolor pink];rosa
       ask patch  -5 -14   [set pcolor pink];rosa
       ask patch -4 -14    [set pcolor pink];rosa
       ask patch  -3 -14   [set pcolor pink];rosa
       ask patch  -2 -14   [set pcolor pink];rosa
       ask patch  -1 -14   [set pcolor pink];rosa
       ask patch  0 -14    [set pcolor pink];rosa
 
       ask patch 1 -14    [set pcolor pink];rosa
       ask patch  2 -14   [set pcolor pink];rosa
       ask patch  3 -14   [set pcolor pink];rosa
       ask patch  4 -14   [set pcolor pink];rosa
       ask patch  5 -14   [set pcolor pink];rosa
       ask patch 6 -14    [set pcolor pink];rosa
       ask patch  7 -14   [set pcolor pink];rosa
       ask patch  8 -14   [set pcolor pink];rosa
       ask patch  9 -14   [set pcolor pink];rosa
       ask patch  10 -14   [set pcolor pink];rosa

       ask patch  11 -14   [set pcolor pink];rosa
       ask patch  12 -14   [set pcolor pink];rosa
       ask patch  13 -14   [set pcolor pink];rosa
       ask patch  14 -14   [set pcolor pink];rosa
       ask patch  15 -14   [set pcolor pink];rosa




  ]

    let  y -7
     repeat 56 [
     ask patch  y 4 [set pcolor pink];rosa
     ask patch y 5  [set pcolor pink];rosa
     ask patch  y 6 [set pcolor pink];rosa
     ask patch  y 7 [set pcolor pink];rosa
     ask patch y 8  [set pcolor pink];rosa
     ask patch  y 9 [set pcolor pink];rosa

     ask patch  y 10 [set pcolor pink];rosa
     ask patch y 11  [set pcolor pink];rosa
     ask patch  y 12 [set pcolor pink];rosa
  ]

  let y1 0
   repeat 4 [
    ask patch  -3 0 [set pcolor pink]
    ask patch  -3 1 [set pcolor pink]
    ask patch  -3 2 [set pcolor pink]
    ask patch  -3 3 [set pcolor pink]
    ask patch  -3 4 [set pcolor pink]
    ask patch  -3 5 [set pcolor pink]
    ask patch  -3 6 [set pcolor pink]
    ask patch  -3 7 [set pcolor pink]
    ask patch  -3 8 [set pcolor pink]

    ask patch  1 8  [set pcolor pink]
    ask patch  1 7  [set pcolor pink]
    ask patch  1 6  [set pcolor pink]
    ask patch  1 5  [set pcolor pink]
    ask patch  1 4  [set pcolor pink]
    ask patch  1 3  [set pcolor pink]
    ask patch  1 2  [set pcolor pink]
    ask patch  1 1  [set pcolor pink]
    ask patch  1 0  [set pcolor pink]
    ask patch  1 -1 [set pcolor pink]
    ask patch  1 -2 [set pcolor pink]
    ask patch  1 -3 [set pcolor pink]
    ask patch  1 -4 [set pcolor pink]
    ask patch  1 -5 [set pcolor pink]
    ask patch  1 -6 [set pcolor pink]

    ask patch  -3 13 [set pcolor pink]
    ask patch -3 14  [set pcolor pink]
    ask patch  -3 15 [set pcolor pink]
    ask patch  1 -5  [set pcolor pink]
    ask patch  1 -6  [set pcolor pink]


    ask patch  5 11  [set pcolor pink]
    ask patch  5 10  [set pcolor pink]
    ask patch  5 9   [set pcolor pink]
    ask patch  5 8   [set pcolor pink]
    ask patch  5 7   [set pcolor pink]
    ask patch  5 6   [set pcolor pink]
    ask patch  5 5   [set pcolor pink]
    ask patch  5 4   [set pcolor pink]
    ask patch  5 3   [set pcolor pink]
    ask patch  5 2   [set pcolor pink]
    ask patch  5 1   [set pcolor pink]
    ask patch  5 0   [set pcolor pink]
    ask patch  5 -1  [set pcolor pink]
    ask patch  5 -2  [set pcolor pink]
    ask patch  5 -3  [set pcolor pink]
    ask patch  5 -4  [set pcolor pink]
    ask patch  5 -5  [set pcolor pink]
    ask patch  5 -6  [set pcolor pink]
    ask patch  5 -7  [set pcolor pink]
    ask patch  5 -8  [set pcolor pink]
    ask patch  5 -9  [set pcolor pink]

    ask patch  -11 -6  [set pcolor pink]
    ask patch  -11 -7  [set pcolor pink]
    ask patch  -11 -8  [set pcolor pink]
    ask patch  -11 -9  [set pcolor pink]
    ask patch  -11 -10 [set pcolor pink]
    ask patch  -11 -11 [set pcolor pink]
    ask patch  -11 -12 [set pcolor pink]
    ask patch  -7 -10  [set pcolor pink]
    ask patch  -7 -11  [set pcolor pink]
    ask patch  -11 -13 [set pcolor pink]
    ask patch  -11 -14 [set pcolor pink]
  ]
end
