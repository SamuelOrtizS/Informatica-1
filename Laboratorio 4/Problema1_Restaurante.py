# Información del restaurante
NOMBRE_RESTAURANTE = "Las delicias de Juan"
DIRECCION = "Avenida 6 con Calle 20"
DIAS_SEMANA = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"]

# Arreglo para almacenar los menús
menu_semana = [""] * 7

def mostrar_menu_principal():
    """Muestra el menú principal de opciones"""
    print("\n" + "="*50)
    print("        SISTEMA DE MENÚ - " + NOMBRE_RESTAURANTE)
    print("="*50)
    print("1. Guardar menú para un día")
    print("2. Consultar menú por número de día")
    print("3. Consultar día por nombre de menú")
    print("4. Mostrar información del restaurante")
    print("5. Mostrar todos los menús de la semana")
    print("6. Salir")
    print("="*50)

def guardar_menu():
    """Guarda el nombre del menú para un día específico"""
    print("\nDías de la semana:")
    for i in range(7):
        print(f"{i}: {DIAS_SEMANA[i]}")

        dia = int(input("Ingrese el número del día (0-6): "))
        if 0 <= dia <= 6:
            menu = input(f"Ingrese el nombre del menú para {DIAS_SEMANA[dia]}: ")
            menu_semana[dia] = menu
            print(f"✓ Menú guardado correctamente para {DIAS_SEMANA[dia]}")
        else:
            print("✗ Número de día inválido. Intente nuevamente.")

def consultar_por_dia():
    """Consulta qué menú se prepara en un día específico"""
    print("\nDías de la semana:")
    for i in range(7):
        print(f"{i}: {DIAS_SEMANA[i]}")
    
        dia = int(input("Ingrese el número del día (0-6): "))
        if 0 <= dia <= 6:
            if menu_semana[dia]:
                print(f"\nEl {DIAS_SEMANA[dia]} se prepara: {menu_semana[dia]}")
            else:                
                print(f"✗ No hay menú registrado para {DIAS_SEMANA[dia]}")
        else:
            print("✗ Número de día inválido.")

def consultar_por_menu():
    """Consulta en qué día se prepara un menú específico"""
    menu_buscado = input("Ingrese el nombre del menú a buscar: ").lower()
    
    encontrado = False
    for i in range(7):
        if menu_semana[i].lower() == menu_buscado:
            print(f"\n✓ El menú '{menu_semana[i]}' se prepara el {DIAS_SEMANA[i]}")
            encontrado = True
            break
    
    if not encontrado:
        print(f"✗ El menú '{menu_buscado}' no está registrado en la semana.")

def mostrar_informacion():
    """Muestra la información básica del restaurante"""
    print("\n" + "="*50)
    print("       INFORMACIÓN DEL RESTAURANTE")
    print("="*50)
    print(f"Nombre: {NOMBRE_RESTAURANTE}")
    print(f"Dirección: {DIRECCION}")
    print("="*50)

def mostrar_semana_completa():
    """Muestra todos los menús de la semana"""
    print("\n" + "="*50)
    print("       MENÚ DE LA SEMANA")
    print("="*50)
    
    hay_menus = False
    for i in range(7):
        if menu_semana[i]:
            print(f"{DIAS_SEMANA[i]}: {menu_semana[i]}")
            hay_menus = True
        else:
            print(f"{DIAS_SEMANA[i]}: Sin menú registrado")
    
    print("="*50)

while True:
    mostrar_menu_principal()
    opcion = input("Seleccione una opción (1-6): ")
        
    if opcion == "1":
        guardar_menu()
    elif opcion == "2":
        consultar_por_dia()
    elif opcion == "3":
        consultar_por_menu()
    elif opcion == "4":
        mostrar_informacion()
    elif opcion == "5":
        mostrar_semana_completa()
    elif opcion == "6":
        print("\n¡Gracias por usar el sistema! Hasta luego.")
        break
    else:
        print("✗ Opción inválida. Intente nuevamente.")