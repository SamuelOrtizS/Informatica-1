Funcion volumen <- VolumenPrisma ( largo, base, altura )
	volumen <- largo * base * altura
Fin Funcion

Funcion volumen <- VolumenCilindro ( radio, altura )
	volumen <- pi * altura * radio * radio
Fin Funcion

Proceso Leche
	Definir numero_recipientes, i Como Entero
	Definir tipo Como Caracter
	Definir l, b, h, hl, r, totalLeche Como Real
	Para i<-1 Hasta numero_recipientes Con Paso 1 Hacer
		Mostrar "Ingrese el tipo de recipiente (prisma o cilindro): "
		Leer tipo
		Si tipo == "prisma" Entonces
			Mostrar "Ingrese la longitud del prisma (cm): "
			Leer l
			Mostrar "Ingrese el ancho del prisma (cm): "
			Leer b
			Mostrar "Ingrese la altura total del prisma (cm): "
			Leer h
			Mostrar "Ingrese la altura hasta donde se llenó el prisma (m): "
			Leer hl
			Mostrar "El volumen del prisma es: ", VolumenPrisma( l, b, h )
			Mostrar "El volumen de leche almacenado en el prisma es: ", VolumenPrisma( l, b, hl )
			totalLeche <- VolumenPrisma( l, b, hl )
		SiNo
			Si tipo == "cilindro" Entonces
				Mostrar "Ingrese el radio del cilindro (cm): "
				Leer r
				Mostrar "Ingrese la altura total del cilindro (cm): "
				Leer h
				Mostrar "Ingrese la altura hasta donde se llenó el cilindro (m): "
				Leer hl
				Mostrar "El volumen del cilindro es: ", VolumenCilindro( r, h )
				Mostrar "El volumen de leche almacenado en el cilindro es: ", VolumenCilindro( r, hl )
				totalLeche <- VolumenCilindro( r, hl )
			SiNo
				Mostrar "Tipo de recipiente no válido. Intente nuevamente."
			FinSi
		Fin Si
	Fin Para
	Mostrar "El total de leche almacenada es: ", totalLeche
FinProceso
