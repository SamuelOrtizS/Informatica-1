Funcion nota_definitiva <- calcular_nota_definitiva ( facultad, parcial1, parcial2, laboratorio )
	Si facultad == "ingenieria" Entonces
		nota_definitiva <- (parcial1 * 0.4) + (parcial2 * 0.4) + (laboratorio * 0.2)
	SiNo
		Si facultad == "administracion" Entonces
			nota_definitiva <- (parcial1 * 0.3) + (parcial2 * 0.3) + (laboratorio * 0.4)
		SiNo
			Si facultad == "humanidades" Entonces
				nota_definitiva <- (parcial1 * 0.25) + (parcial2 * 0.35) + (laboratorio * 0.4)
			SiNo
				nota_definitiva <- 0
			Fin Si
		Fin Si
	Fin Si
Fin Funcion

Algoritmo NotasDefinitivas
	Definir cantidad_estudiantes, contador, contadorIngenieria, contadorAdministracion, contadorHumanidades Como Entero
	Definir acumuladorIngenieria, acumuladorAdministracion, acumuladorHumanidades Como Real
	Mostrar "Ingrese la cantidad de estudiantes: "
	Leer cantidad_estudiantes
	Mientras contador < cantidad_estudiantes Hacer
		Definir nombre, facultad Como Caracter
		Definir parcial1, parcial2, laboratorio, nota_definitiva Como Real
		Mostrar "Ingrese el nombre del estudiante: "
		Leer nombre
		Mostrar "Ingrese la facultad (ingenieria, administracion, humanidades): "
		Leer facultad
		Mostrar "Ingrese la nota del primer parcial: "
		Leer parcial1
		Mostrar "Ingrese la nota del segundo parcial: "
		Leer parcial2
		Mostrar "Ingrese la nota del laboratorio: "
		Leer laboratorio
		nota_definitiva <- calcular_nota_definitiva(facultad, parcial1, parcial2, laboratorio)
		Mostrar "La nota definitiva de ", nombre, " es: ", nota_definitiva
		Si nota_definitiva < 3 Entonces
			Mostrar  "El estudiante ", nombre, " perdio la asignatura"
		SiNo
		Fin Si
		Si facultad == "ingenieria" Entonces
			acumuladorIngenieria <- acumuladorIngenieria + nota_definitiva
			contadorIngenieria <- contadorIngenieria + 1
		SiNo
			Si facultad == "administracion" Entonces
				acumuladorAdministracion <- acumuladorAdministracion + nota_definitiva
				contadorAdministracion <- contadorAdministracion + 1
			SiNo
				Si facultad == "humanidades" Entonces
					acumuladorHumanidades <- acumuladorHumanidades + nota_definitiva
					contadorHumanidades <- contadorHumanidades + 1
				SiNo
				Fin Si
			Fin Si
		Fin Si
	Fin Mientras
	Mostrar "El promedio de notas  de Ingenieria es: ", acumuladorIngenieria/contadorIngenieria
	Mostrar "El promedio de notas  de Administracion es: ", acumuladorAdministracion/contadorAdministracion
	Mostrar "El promedio de notas  de Humanidades es: ", acumuladorHumanidades/contadorHumanidades
FinAlgoritmo
	