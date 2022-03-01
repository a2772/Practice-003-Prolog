/* Base de conocimiento para identificar animales con Prolog
Para ejecutar el programa escribir "inicio" seguido de un punto: ?- inicio.     */
inicio :- animalSupuesto(Animal),
      write('Dadas las respuestas a las preguntas formuladas, se llega a la conclusión de que el resultado es: '),
      write(Animal),
      nl,
      undo.

/* Animales posibles con los que probaremos */
animalSupuesto(leopardo)   :- r4_leopardo, !.
animalSupuesto(tigre)      :- r5_tigre, !.
animalSupuesto(pingüino)   :- r6_pinguino, !.
animalSupuesto(albatros)   :- r7_albatros, !.
animalSupuesto(caracteristicas_de_animal_desconocido).             /* No es una especie de la base de conocimiento */

/* Reglas para cada animal */
r1_mamifero          :- preguntar(tiene_pelaje);
                        preguntar(da_leche).
r2_ave               :- preguntar(tiene_plumaje);
                        preguntar(vuela),
                        preguntar(pone_huevos).
r3_carnivoro         :- r1_mamifero,
                        (preguntar(come_carne);
                         preguntar(tiene_dientes_puntiagudos),
                         preguntar(tiene_garras),
                         preguntar(tiene_ojos_orientados_frontalmente)
                        ).
/* Reglas para animales específicos */
r4_leopardo          :- r3_carnivoro,
                        preguntar(color_anaranjado),
                        preguntar(tiene_puntos_negros).
r5_tigre             :- r3_carnivoro,
                        preguntar(color_anaranjado),
                        preguntar(tiene_rayas_negras).
r6_pinguino          :- r2_ave,
                        \+ preguntar(vuela),
                        preguntar(sabe_nadar).
r7_albatros          :- r2_ave,
                        preguntar(es_muy_bueno_para_volar).
/* classification rules */


/* Default de la pregunta */
hacepregunta(Preg) :-
    write('¿Tiene el animal la caracteristica siguiente?: '),
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
