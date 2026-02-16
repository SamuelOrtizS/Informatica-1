Algoritmo Tiempo
	Definir h, m, s Como Entero
	Escribir 'Ingrese el valor del tiempo en segundos: '
	Leer s
	h <- TRUNC(s/3600)
	m <- TRUNC((s MOD 3600)/60)
	s <- s MOD 60
	Escribir 'El tiempo es igual a: '
	Escribir h, ' horas'
	Escribir m, ' minutos'
	Escribir s, ' segundos'
FinAlgoritmo
