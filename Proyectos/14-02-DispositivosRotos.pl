/* Declarando el inicio */
inicio :- !,nl,nl,nl,write('--->Averiguaremos dónde está la falla, según el caso<---'),nl,
          write('Sabemos que, la luz1, luz2 y calentador están conectados a fusible1'),nl,
	  write('Además, luz3 y luz4 están conectadas a fusible2'),nl,
          write('Selecciona el dispositivo que quieres analizar:'),nl,
          write('0. Salir'),nl,
          write('1. Analizar luz1'),nl,
          write('2. Analizar luz2'),nl,
          write('3. Analizar luz3'),nl,
          write('4. Analizar luz4'),nl,
          write('5. Analizar calentador'),nl,
          read(Opcion),
	  ejecutar(Opcion).

ejecutar(Opcion) :- 	Opcion == 1, anDispositivo(luz1), inicio;
			Opcion == 2, anDispositivo(luz2), inicio;
			Opcion == 3, anDispositivo(luz3), inicio;
			Opcion == 4, anDispositivo(luz4), inicio;
			Opcion == 5, anDispositivo(calentador), inicio;
			Opcion == 0, true.


/* En caso de que quiera visualizar sin el menu cuales son dispositivos */
diferente(X,Y) :- \+ (X=Y).
dispositivo(calentador).
dispositivo(luz1).
dispositivo(luz2).
dispositivo(luz4).
dispositivo(luz4).
conectado(luz1,fusible1).
conectado(luz2,fusible1).
conectado(calentador,fusible1).
conectado(luz3,fusible2).
conectado(luz4,fusible2).

anDispositivo(Dispositivo) :-   
			      interruptorOn,
		              fusibleOk(Dispositivo),
		 	      \+ roto(Dispositivo),
	   		      nl,write('El dispositivo funciona correctamente'),!.

interruptorOn :- preguntar(el_interruptor_esta_encendido), !;
		 write('Por favor encienda el interruptor'),nl,inicio.			     

fusibleOk(X) :- conectado(X,F),nl,nl,
		write('Nota: El dispositivo '),
		write(X),
		write(' está conectado al fusible '),
		write(F),nl,
		preguntar(ese_fusible_esta_intacto), !;
                write('Por favor reemplace el fusible '),inicio.

roto(Dispositivo) :-
			nl,preguntar(ve_el_dispositivo_funcionar_en_este_momento),nl,
			write('El dispositivo '),
			write(Dispositivo),
			write(' funciona correctamente'),!;
			write('El problema es el dispositivo '),
			write(Dispositivo),
			write('. Debe repararlo o reemplazarlo'),inicio.

/* Default de la pregunta */
hacepregunta(Preg) :-
    write('Responda como si su vida dependiera de ello (si/no): ¿'),
    write(Preg),
    write('? '),
    read(Input),
    nl,
    (
     (Input == yes ; Input == y ; Input == si ; Input == s)
      ->
       assert(si(Preg));
      assert(no(Preg)),
     fail
    ).

:- dynamic si/1, no/1.

/* Estructura de las preguntas */
preguntar(P) :- (
                 si(P)
                 ->
                 true ;
                 (
                  no(P)
                  ->
                  fail;
                   hacepregunta(P)
                 )
                ).
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
