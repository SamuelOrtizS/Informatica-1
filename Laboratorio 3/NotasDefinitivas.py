def calcular_nota_definitiva(facultad, parcial1, parcial2, laboratorio):
  if facultad == "ingenieria":
      nota_definitiva = (parcial1 * 0.4) + (parcial2 * 0.4) + (laboratorio * 0.2)
  elif facultad == "administracion":
      nota_definitiva = (parcial1 * 0.3) + (parcial2 * 0.3) + (laboratorio * 0.4)
  elif facultad == "humanidades":
      nota_definitiva = (parcial1 * 0.25) + (parcial2 * 0.35) + (laboratorio * 0.4)
  else:
      nota_definitiva = 0
  return nota_definitiva
  
cantidad_estudiantes = int(input("Ingrese la cantidad de estudiantes: "))
estudiantes = []

while len(estudiantes) < cantidad_estudiantes:
  nombre = input("Ingrese el nombre del estudiante: ")
  facultad = input("Ingrese la facultad (ingenieria, administracion, humanidades): ").lower()
  parcial1 = float(input("Ingrese la nota del primer parcial: "))
  parcial2 = float(input("Ingrese la nota del segundo parcial: "))
  laboratorio = float(input("Ingrese la nota del laboratorio: "))
  
  nota_definitiva = calcular_nota_definitiva(facultad, parcial1, parcial2, laboratorio)
  
  estudiantes.append({
    "nombre": nombre,
    "facultad": facultad,
    "nota_definitiva": nota_definitiva
  })


promedios = {"ingenieria": [], "administracion": [], "humanidades": []}

estudiantes_perdidos = []

while estudiantes:
  estudiante = estudiantes.pop(0)
  promedios[estudiante["facultad"]].append(estudiante["nota_definitiva"])
  if estudiante["nota_definitiva"] < 3.0: 
    estudiantes_perdidos.append(estudiante["nombre"])
  print(f"Estudiante: {estudiante['nombre']}, Facultad: {estudiante['facultad']}, Nota Definitiva: {estudiante['nota_definitiva']:.2f}")
        
while promedios:
  facultad, notas = promedios.popitem()
  if notas:
    promedio = sum(notas) / len(notas)
    print(f"Promedio de notas para {facultad}: {promedio:.2f}")
  else:
    print(f"No hay estudiantes en la facultad de {facultad}.")

print("Estudiantes que perdieron la asignatura:")

while estudiantes_perdidos:
  nombre = estudiantes_perdidos.pop(0)
  print(nombre)