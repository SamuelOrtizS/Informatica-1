Función colT <- colesterolTotal (valorNum)
	Definir colT Como Cadena
	Si valorNum<200 Entonces
		colT <- 'Optimo'
	SiNo
		Si (valorNum>=200) Y (valorNum<=239) Entonces
			colT <- 'Intermedio Alto'
		SiNo
			colT <- 'Alto'
		FinSi
	FinSi
FinFunción

Función colH <- colesterolHDL (valorNum)
	Definir colH Como Cadena
	Si valorNum<40 Entonces
		colH <- 'Bajo'
	SiNo
		Si (valorNum>=60) Entonces
			colH <- 'Alto'
		SiNo
			colH <- 'Normal'
		FinSi
	FinSi
FinFunción

Función t <- trigliceridos (valorNum)
	Definir t Como Cadena
	Si valorNum<150 Entonces
		t <- 'Normal'
	SiNo
		Si (valorNum>=150) Y (valorNum<=199) Entonces
			t <- 'Intermedio Alto'
		SiNo
			Si (valorNum>=200) Y (valorNum<=499) Entonces
				t <- 'Alto'
			SiNo
				t <- 'Muy Alto'
			FinSi
		FinSi
	FinSi
FinFunción

Algoritmo NivelesColesterol
	Definir nombre, genero Como Cadena
	Definir colTotal, colHDL, tri Como Real
	Escribir 'Ingrese su nombre: '
	Leer nombre
	Escribir 'Indique si es hombre o mujer: '
	Leer genero
	Escribir 'Ingrese el valor numérico del colesterol total: '
	Leer colTotal
	Escribir 'Ingrese el valor numérico del colesterol HDL: '
	Leer colHDL
	Escribir 'Ingrese el valor numérico de los triglicéridos: '
	Leer tri
	Escribir nombre, ' sus niveles de colesterol son: '
	Escribir 'Colesterol total: ', colesterolTotal(colTotal)
	Escribir 'HDL: ', colesterolHDL(colHDL)
	Escribir 'Triglicéridos: ', trigliceridos(tri)
FinAlgoritmo
