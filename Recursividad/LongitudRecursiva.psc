Función long <- longitud_cadena (cade)
	Si cade=='' Entonces
		long <- 0
	SiNo
		long <- 1+longitud_cadena(Subcadena(cade,2,Longitud(cade)))
	FinSi
FinFunción

Algoritmo LongitudRecursiva
	Escribir longitud_cadena('Hola, mundo!')
FinAlgoritmo
