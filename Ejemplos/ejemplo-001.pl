progenitor(clara,pedro).
progenitor(pedro,josé).
progenitor(ana,clara).
progenitor(josé,clara).

abuelo(X,Y) :- progenitor(X,Z) , progenitor(Z,Y).

bisabuelo(X,Y) :- abuelo(X,Z) , progenitor(Z,Y).
