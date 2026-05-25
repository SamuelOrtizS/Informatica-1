Función resultado<-potencia(base, exponente)
	Si exponente = 0 Entonces
		resultado <- 1
	Sino
		resultado <- base * potencia(base, exponente - 1)
	FinSi
FinFunción

Algoritmo PotenciaRecursiva
	Definir numBase, resultado Como Real
	Definir numExponente Como Entero
	
	Escribir "Ingrese la base: "
	Leer numBase
	Escribir "Ingrese el exponente: "
	Leer numExponente
	
	resultado <- potencia(numBase, numExponente)
	
	Escribir numBase, " elevado a la ", numExponente, " es: ", resultado
FinAlgoritmo
