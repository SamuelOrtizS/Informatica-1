Función long <- longitud_cadena (cade)
	Si cade=='' Entonces
		long <- 0
	SiNo
		long <- 1+longitud_cadena(Subcadena(cade,2,Longitud(cade)))
	FinSi
FinFunción

Algoritmo LongitudRecursiva
	Definir text Como Cadena
	Escribir 'Ingrese una cadena de caracteres: '
	Leer text
	Escribir 'La longitud de la cadena es: ', longitud_cadena(text)
FinAlgoritmo
