# Programa para calcular la nota definitiva de estudiantes
# Según la facultad (Ingeniería, Administración, Humanidades)

# Porcentajes por facultad
pesos = {
    "ingenieria": {"parcial1": 0.40, "parcial2": 0.40, "laboratorio": 0.20},
    "administracion": {"parcial1": 0.30, "parcial2": 0.30, "laboratorio": 0.40},
    "humanidades": {"parcial1": 0.25, "parcial2": 0.35, "laboratorio": 0.40}
}

# Solicitar número de estudiantes
n = int(input("Ingrese el número de estudiantes: "))
contador = 0

# Usar while para procesar cada estudiante
while contador < n:
    print(f"\n--- Estudiante {contador + 1} ---")
    
    # Obtener datos del estudiante
    nombre = input("Nombre del estudiante: ")
    
    # Solicitar facultad
    print("Seleccione la facultad:")
    print("1. Ingeniería")
    print("2. Administración")
    print("3. Humanidades")
    opcion = int(input("Opción: "))
    
    # Asignar facultad según la opción
    if opcion == 1:
        facultad = "ingenieria"
    elif opcion == 2:
        facultad = "administracion"
    elif opcion == 3:
        facultad = "humanidades"
    else:
        print("Opción inválida. Por favor, ingrese 1, 2 o 3.")
        continue
    
    # Obtener calificaciones
    parcial1 = float(input("Nota Parcial 1: "))
    parcial2 = float(input("Nota Parcial 2: "))
    laboratorio = float(input("Nota Laboratorio: "))
    
    # Calcular nota definitiva según los pesos de la facultad
    nota_definitiva = (parcial1 * pesos[facultad]["parcial1"] + 
                       parcial2 * pesos[facultad]["parcial2"] + 
                       laboratorio * pesos[facultad]["laboratorio"])
    
    # Mostrar resultados
    print(f"\nResultados para {nombre}:")
    print(f"Facultad: {facultad.capitalize()}")
    print(f"Parcial 1: {parcial1} ({pesos[facultad]['parcial1']*100}%)")
    print(f"Parcial 2: {parcial2} ({pesos[facultad]['parcial2']*100}%)")
    print(f"Laboratorio: {laboratorio} ({pesos[facultad]['laboratorio']*100}%)")
    print(f"Nota Definitiva: {nota_definitiva:.2f}")
    
    # Incrementar el contador
    contador += 1

print("\n--- Proceso completado ---")