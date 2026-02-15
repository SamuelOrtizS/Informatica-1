Algoritmo Tiempo
	Definir h, m, s Como Entero
	Escribir 'Ingrese el tiempo en segundos'
	Leer s
	h <- TRUNC(s/3600)
	m <- TRUNC((s MOD 3600)/60)
	s <- s MOD 60
	Escribir 'El tiempo es: ', h, 'h ', m, 'm ', s, 's'
FinAlgoritmo
