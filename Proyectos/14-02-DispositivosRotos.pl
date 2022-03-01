/* Declarando el inicio */
inicio :- dispositivos_funcionan(Respuesta),
          write('Se harán unas preguntas para comprobar dónde está la falla. '),
          nl,
          write(Respuesta),
          nl,
          undo.

regla_dispositivo_roto :- (
               encendido(Dispositivo),
               \+ funciona(Dispositivo),
               conectado(Dispositivo,Fusible),
               probado(intacto(Fusible))
              )
              ->
              probado(roto(Dispositivo)).

regla_fusible_correcto :- (
               conectado(Dispositivo,Fusible),
               funciona(Dispositivo)
              )
              ->
              probado(intacto(Fusible)).

regla_fundido :- (
              conectado(Dispositivo1,Fusible),
              encendido(Dispositivo1),
              \+ funciona(Dispositivo1),
              mismo_fusible(Dispositivo1,Dispositivo2),
              encendido(Dispositivo2),
              \+ funciona(Dispositivo2)
             )
             ->
             probado(fundido(Fusible)).

regla_mismo_fusible :- (
             conectado(Dispositivo1,Fusible),
             conectado(Dispositvo2,Fusible),
             diferente(Dispositivo1,Dispositivo2)
            )
            ->
             mismo_fusible(Dispositivo1,Dispositivo2).

diferente(X,Y) :- \+ (X=Y).
dispositivo(heater).
dispositivo(lightl).
dispositivo(light2).
dispositivo(light3).
dispositivo(light4).
conectado(lightl,fusel).
conectado(light2,fusel).
conectado(heater,fusel).
conectado(light3,fuse2).
conectado(light4,fuse2).

askable( encendido(D), encendido( 'Dispositivo') ).
askable( funciona(D), funciona('Dispositivo') ).
.....................
