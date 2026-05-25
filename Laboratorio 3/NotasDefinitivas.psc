Función calcular_nota_definitiva(facultad, parcial1, parcial2, laboratorio)
	Si facultad == "ingenieria" Entonces
		nota_definitiva <- (parcial1 * 0.4) + (parcial2 * 0.4) + (laboratorio * 0.2)
	SiNo Si facultad == "administracion" Entonces
		nota_definitiva <- (parcial1 * 0.3) + (parcial2 * 0.3) + (laboratorio * 0.4)
	SiNo Si facultad == "humanidades" Entonces
		nota_definitiva <- (parcial1 * 0.25) + (parcial2 * 0.35) + (laboratorio * 0.4)
	SiNo
		nota_definitiva <- 0
	FinSi
	Retornar nota_definitiva
FinFunción

Algoritmo NotasDefinitivas
	Escribir "Ingrese la cantidad de estudiantes: "
	Leer cantidad_estudiantes
	
	Dimension estudiantes[cantidad_estudiantes]
	Dimension ingenieria[cantidad_estudiantes]
	Dimension administracion[cantidad_estudiantes]
	Dimension humanidades[cantidad_estudiantes]
	
	i <- 0
	Mientras i < cantidad_estudiantes Hacer
		Escribir "Ingrese el nombre del estudiante: "
		Leer nombre
		Escribir "Ingrese la facultad (ingenieria, administracion, humanidades): "
		Leer facultad
		Escribir "Ingrese la nota del primer parcial: "
		Leer parcial1
		Escribir "Ingrese la nota del segundo parcial: "
		Leer parcial2
		Escribir "Ingrese la nota del laboratorio: "
		Leer laboratorio
		
		nota_definitiva <- calcular_nota_definitiva(facultad, parcial1, parcial2, laboratorio)
		
		estudiantes[i] <- nombre
		facultades[i] <- facultad
		notas_definitivas[i] <- nota_definitiva
		
		i <- i + 1
	FinMientras
	
	contador_ing <- 0
	contador_adm <- 0
	contador_hum <- 0
	suma_ing <- 0
	suma_adm <- 0
	suma_hum <- 0
	
	Escribir ""
	
	Para i <- 0 Hasta cantidad_estudiantes - 1 Hacer
		Escribir "Estudiante: ", estudiantes[i], ", Facultad: ", facultades[i], ", Nota Definitiva: ", ConvertirATexto(notas_definitivas[i])
		
		Si notas_definitivas[i] < 3.0 Entonces
			Escribir estudiantes[i], " perdió la asignatura"
		FinSi
		
		Si facultades[i] == "ingenieria" Entonces
			suma_ing <- suma_ing + notas_definitivas[i]
			contador_ing <- contador_ing + 1
		SiNo Si facultades[i] == "administracion" Entonces
			suma_adm <- suma_adm + notas_definitivas[i]
			contador_adm <- contador_adm + 1
		SiNo Si facultades[i] == "humanidades" Entonces
			suma_hum <- suma_hum + notas_definitivas[i]
			contador_hum <- contador_hum + 1
		FinSi
	FinPara
	
	Escribir ""
	
	Si contador_ing > 0 Entonces
		promedio_ing <- suma_ing / contador_ing
		Escribir "Promedio de notas para ingenieria: ", ConvertirATexto(promedio_ing)
	SiNo
		Escribir "No hay estudiantes en la facultad de ingenieria."
	FinSi
	
	Si contador_adm > 0 Entonces
		promedio_adm <- suma_adm / contador_adm
		Escribir "Promedio de notas para administracion: ", ConvertirATexto(promedio_adm)
	SiNo
		Escribir "No hay estudiantes en la facultad de administracion."
	FinSi
	
	Si contador_hum > 0 Entonces
		promedio_hum <- suma_hum / contador_hum
		Escribir "Promedio de notas para humanidades: ", ConvertirATexto(promedio_hum)
	SiNo
		Escribir "No hay estudiantes en la facultad de humanidades."
	FinSi
	
	Escribir ""
	Escribir "Estudiantes que perdieron la asignatura:"
	
	Para i <- 0 Hasta cantidad_estudiantes - 1 Hacer
		Si notas_definitivas[i] < 3.0 Entonces
			Escribir estudiantes[i]
		FinSi
	FinPara
	
FinAlgoritmo
