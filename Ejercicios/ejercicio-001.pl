sumatoria(0,0).
sumatoria(Valor,Resultado):-
	Antecesor is Valor-1,
	sumatoria(Antecesor,Resultadoantecesor),
	Resultado is Valor+Resultadoantecesor.
