
Proceso Leche
	Definir numero_recipientes, i Como Entero
	Definir tipo Como Cadena
	Definir l, b, h, hl, r Como Real
	Definir volumen_total, volumen_leche, total_leche Como Real
	Definir recipientes_volumen_leche[100] Como Real
	Definir recipientes_volumen_total[100] Como Real
	Definir recipientes_tipo[100] Como Cadena

	Escribir "Ingrese el número de recipientes: "
	Leer numero_recipientes

	Para i <- 1 Hasta numero_recipientes
		Escribir "Ingrese el tipo de recipiente (prisma o cilindro): "
		Leer tipo
		tipo <- Minusculas(tipo)
		Si tipo = "prisma" Entonces
			Escribir "Ingrese la longitud del prisma (cm): "
			Leer l
			Escribir "Ingrese el ancho del prisma (cm): "
			Leer b
			Escribir "Ingrese la altura total del prisma (cm): "
			Leer h
			Escribir "Ingrese la altura hasta donde se llenó el prisma (m): "
			Leer hl
			volumen_total <- l * b * h
			volumen_leche <- l * b * (hl * 100)
		Sino
			Si tipo = "cilindro" Entonces
				Escribir "Ingrese el radio del cilindro (cm): "
				Leer r
				Escribir "Ingrese la altura total del cilindro (cm): "
				Leer h
				Escribir "Ingrese la altura hasta donde se llenó el cilindro (m): "
				Leer hl
				volumen_total <- 3.1416 * r * r * h
				volumen_leche <- 3.1416 * r * r * (hl * 100)
			Sino
				Escribir "Tipo de recipiente no válido. Intente nuevamente."
				i <- i - 1
				Continuar
			FinSi
		FinSi
		recipientes_tipo[i] <- tipo
		recipientes_volumen_total[i] <- volumen_total
		recipientes_volumen_leche[i] <- volumen_leche
	FinPara

	total_leche <- 0
	Para i <- 1 Hasta numero_recipientes
		Escribir "Recipiente tipo: ", recipientes_tipo[i]
		Escribir "Volumen total del recipiente: ", Redon(recipes_volumen_total[i],2), " cm³"
		Escribir "Volumen de leche almacenada: ", Redon(recipientes_volumen_leche[i],2), " cm³"
		total_leche <- total_leche + recipientes_volumen_leche[i]
	FinPara
	Escribir "Total de leche almacenada: ", Redon(total_leche,2), " cm³"
FinProceso
