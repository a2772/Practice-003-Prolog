conexion(a,b,7).
conexion(d,h,4).
conexion(h,f,9).
conexion(i,f,11).
conexion(f,a,8).
conexion(f,g,10).
conexion(d,i,2).

tieneArista(X) :- conexion(X,_,_).

costoLlegarA(Inicio,Destino,Intermedio,Costo):- 
	conexion(Inicio,Intermedio,Costo1),conexion(Intermedio,Destino,Costo2), Costo 
	is Costo1+Costo2.
