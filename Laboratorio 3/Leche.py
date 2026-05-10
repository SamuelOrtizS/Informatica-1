import math

def volumen_prisma(l, b, h):
  return l * b * h

def volumen_cilindro(r, h):
  return math.pi * r**2 * h

def volumen_leche_prisma(l, b, hl):
  return volumen_prisma(l, b, hl)

def volumen_leche_cilindro(r, hl):
  return volumen_cilindro(r, hl)

numero_recipientes = int(input("Ingrese el número de recipientes: "))
recipientes = []

for i in range(numero_recipientes):
  tipo = input("Ingrese el tipo de recipiente (prisma o cilindro): ").lower()
  if tipo == "prisma":
    l = float(input("Ingrese la longitud del prisma (cm): "))
    b = float(input("Ingrese el ancho del prisma (cm): "))
    h = float(input("Ingrese la altura total del prisma (cm): "))
    hl = float(input("Ingrese la altura hasta donde se llenó el prisma (m): "))
  elif tipo == "cilindro":
    r = float(input("Ingrese el radio del cilindro (cm): "))
    h = float(input("Ingrese la altura total del cilindro (cm): "))
    hl = float(input("Ingrese la altura hasta donde se llenó el cilindro (m): "))
  else:
    print("Tipo de recipiente no válido. Intente nuevamente.")
    continue
    
  recipientes.append({
    "tipo": tipo,
    "l": l if tipo == "prisma" else None,
    "b": b if tipo == "prisma" else None,
    "r": r if tipo == "cilindro" else None,
    "h": h,
    "hl": hl*100,
    "volumen_total": volumen_prisma(l, b, h) if tipo == "prisma" else volumen_cilindro(r, h),
    "volumen_leche": volumen_leche_prisma(l, b, hl*100) if tipo == "prisma" else volumen_leche_cilindro(r, hl*100)
  })

for recipiente in recipientes:
  print(f"Recipiente tipo: {recipiente['tipo']}")
  print(f"Volumen total del recipiente: {recipiente['volumen_total']:.2f} cm³")
  print(f"Volumen de leche almacenada: {recipiente['volumen_leche']:.2f} cm³")

total_leche = sum(recipiente['volumen_leche'] for recipiente in recipientes)
print(f"Total de leche almacenada: {total_leche:.2f} cm³")