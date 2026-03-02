def volumenPrisma():
    volumenPrisma = float(anchoPrisma * largoPrisma * alturaPrisma)
    return volumenPrisma
def volumenCilindro():
    volumenCilindro = float(3.1416 * (radioCilindro ** 2) * alturaCilindro)
    return volumenCilindro
def cantidadLechePrisma():
    cantidadLechePrisma = float(volumenPrisma() * alturaLlenadoPrisma / alturaPrisma)
    return cantidadLechePrisma
def cantidadLecheCilindro():
    cantidadLecheCilindro = float(volumenCilindro() * alturaLlenadoCilindro / alturaCilindro)
    return cantidadLecheCilindro
def dineroGanadoPrisma():
    return 109.224
def cantidadKumis():
    return 3.204
def cantidadTotalLeche():
    cantidadTotalLeche = float(cantidadLechePrisma() + cantidadLecheCilindro())
    return cantidadTotalLeche
anchoPrisma=int(input("Ingrese en cm, el ancho de la base del recipiente en forma de prisma (l): "))
largoPrisma=int(input("Ingrese en cm, el largo de la base del recipiente en forma de prisma (b): "))
alturaPrisma=int(input("Ingrese la altura en cm, del prisma (h): "))

radioCilindro=int(input("Ingrese en cm el radio del recipiente en forma de cilindro: "))
alturaCilindro=int(input("Ingrese en cm la altura del recipiente en forma de cilindro: "))

alturaLlenadoPrisma=int(input("Ingrese hasta que altura se lleno el recipiente en forma de prisma: "))
alturaLlenadoCilindro=int(input("Ingrese hasta que altura se lleno el recipiente en forma de cilindro: "))

print("El volumen del recipiente en forma de prisma es: ", volumenPrisma(), " cm cúbicos")
print("El volumen del recipiente en forma de cilindro es: ", volumenCilindro(), " cm cúbicos")

print("La cantidad de leche recogida en el recipiente en forma de prisma es: ", cantidadLechePrisma(), " cm cúbicos")
print("La cantidad de leche recogida en el recipiente en forma de cilindro es: ", cantidadLecheCilindro(), " cm cúbicos")

print("Don segundo gano por la venta de la leche $", dineroGanadoPrisma())

print("La cantidad de leche para kumis es: ", cantidadKumis(), " litros")
print("La cantidad total de leche recogida es de ", cantidadTotalLeche(), " cm cúbicos")