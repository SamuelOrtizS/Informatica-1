Función volumen <- volumenPrisma(ancho,largo,altura)
	volumen <- ancho*largo*altura
FinFunción

Función volumen <- volumenCilindro(radio,altura)
	volumen <- PI*(radio^2)*altura
FinFunción

Función cantidad <- cantidadLechePrisma(volumen,alturaLlenado,alturaPrisma)
	cantidad <- volumen*(alturaLlenado/alturaPrisma)
FinFunción

Función cantidad <- cantidadLecheCilindro(volumen,alturaLlenado,alturaCilindro)
	cantidad <- volumen*(alturaLlenado/alturaCilindro)
FinFunción

Algoritmo ProduccionLeche
	Definir anchoPrisma, largoPrisma, alturaPrisma Como Entero
	Definir alturaLlenadoPrisma Como Entero
	Definir radioCilindro, alturaCilindro Como Entero
	Definir alturaLlenadoCilindro Como Entero
	Escribir 'Ingrese en cm, el ancho de la base del recipiente en forma de prisma (l): '
	Leer anchoPrisma
	Escribir 'Ingrese en cm, el largo de la base del recipiente en forma de prisma (b): '
	Leer largoPrisma
	Escribir 'Ingrese la altura en cm, del prisma (h): '
	Leer alturaPrisma
	Escribir 'Ingrese en cm el radio del recipiente en forma de cilindro: '
	Leer radioCilindro
	Escribir 'Ingrese en cm la altura del recipiente en forma de cilindro: '
	Leer alturaCilindro
	Escribir 'Ingrese hasta que altura se lleno el recipiente en forma de prisma: '
	Leer alturaLlenadoPrisma
	Escribir 'Ingrese hasta que altura se lleno el recipiente en forma de cilindro: '
	Leer alturaLlenadoCilindro
	Escribir 'El volumen del recipiente en forma de prisma es: ', volumenPrisma(anchoPrisma,largoPrisma,alturaPrisma), ' cm cúbicos'
	Escribir 'El volumen del recipiente en forma de cilindro es: ', volumenCilindro(radioCilindro,alturaCilindro), ' cm cúbicos'
	Escribir 'La cantidad de leche recogida en el recipiente en forma de prisma es: ', cantidadLechePrisma(volumenPrisma(anchoPrisma,largoPrisma,alturaPrisma),alturaLlenadoPrisma,alturaPrisma), ' cm cúbicos'
	Escribir 'La cantidad de leche recogida en el recipiente en forma de cilindro es: ', cantidadLecheCilindro(volumenCilindro(radioCilindro,alturaCilindro),alturaLlenadoCilindro,alturaCilindro), ' cm cúbicos'
FinAlgoritmo
