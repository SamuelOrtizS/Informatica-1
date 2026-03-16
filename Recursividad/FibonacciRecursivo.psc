Función resultado <- fibonacci(n)
	Si n<=0 Entonces
		resultado <- 0
	SiNo
		Si n=1 Entonces
			resultado <- 1
		SiNo
			resultado <- fibonacci(n-1)+fibonacci(n-2)
		FinSi
	FinSi
FinFunción

Algoritmo principal
	Definir num Como Entero
	Escribir 'Ingrese un número para calcular su Fibonacci: '
	Leer num
	Escribir fibonacci(num)
FinAlgoritmo
