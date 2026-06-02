# Constantes
FILAS = 7
COLUMNAS = 4
PRECIO_GENERAL = 10000      # Filas 0-3
PRECIO_PREFERENCIAL = 20000  # Filas 4-6

# Matriz para almacenar estado de las sillas (0=libre, 1=reservada)
sillas = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]

# Variable para almacenar el total recaudado
total_recaudado = 0

def obtener_tipo_silla(fila):
    if fila <= 3:
        return "General"
    else:
        return "Preferencial"

def obtener_precio_silla(fila):
    if fila <= 3:
        return PRECIO_GENERAL
    else:
        return PRECIO_PREFERENCIAL

def mostrar_sala():
    print("\n" + "="*50)
    print("        ESTADO DE LA SALA DE CINE")
    print("="*50)
    print("Leyenda: 0=Libre  |  1=Reservada")
    print("Sillas Generales (filas 0-3): $" + str(PRECIO_GENERAL))
    print("Sillas Preferenciales (filas 4-6): $" + str(PRECIO_PREFERENCIAL))
    print("="*50)
    
    print("\n      Col 0  Col 1  Col 2  Col 3")
    for fila in range(FILAS):
        tipo = "GENERAL" if fila <= 3 else "PREFERENCIAL"
        print(f"Fila {fila} ({tipo:12})", end="")
        for columna in range(COLUMNAS):
            estado = "  [" + str(sillas[fila][columna]) + "]  "
            print(estado, end="")
        print()
    print("="*50)

def hacer_reserva():
    global total_recaudado
    
    print("\n--- HACER RESERVA ---")
    mostrar_sala()
    
    try:
        num_sillas = int(input("¿Cuántas sillas desea reservar? "))
        
        if num_sillas <= 0:
            print("✗ Ingrese una cantidad válida.")
            return
        
        total_reserva = 0
        sillas_reservadas = []
        
        for i in range(num_sillas):
            print(f"\nSilla {i + 1}:")
            fila = int(input("  Ingrese número de fila (0-6): "))
            columna = int(input("  Ingrese número de columna (0-3): "))
            
            # Validar índices
            if not (0 <= fila < FILAS and 0 <= columna < COLUMNAS):
                print("✗ Fila o columna fuera de rango.")
                return
            
            # Validar disponibilidad
            if sillas[fila][columna] == 1:
                print("✗ Esta silla ya está reservada.")
                return
            
            # Realizar la reserva
            sillas[fila][columna] = 1
            precio = obtener_precio_silla(fila)
            total_reserva += precio
            tipo = obtener_tipo_silla(fila)
            sillas_reservadas.append((fila, columna, tipo, precio))
            print(f"✓ Silla reservada - Fila {fila}, Columna {columna} - {tipo} (${precio})")
        
        # Mostrar resumen
        print("\n" + "="*50)
        print("           RESUMEN DE RESERVA")
        print("="*50)
        for fila, columna, tipo, precio in sillas_reservadas:
            print(f"Fila {fila}, Columna {columna} - {tipo}: ${precio}")
        print("-"*50)
        print(f"TOTAL A PAGAR: ${total_reserva}")
        print("="*50)
        
        total_recaudado += total_reserva
        
    except ValueError:
        print("✗ Entrada inválida. Ingrese números enteros.")

def cancelar_reserva():
    global total_recaudado
    
    print("\n--- CANCELAR RESERVA ---")
    mostrar_sala()
    
    fila = int(input("Ingrese número de fila de la silla (0-6): "))
    columna = int(input("Ingrese número de columna de la silla (0-3): "))
        
    # Validar índices
    if not (0 <= fila < FILAS and 0 <= columna < COLUMNAS):
        print("✗ Fila o columna fuera de rango.")
        return
        
    # Validar que la silla esté reservada
    if sillas[fila][columna] == 0:
        print("✗ Esta silla no está reservada.")
        return
        
    # Realizar la cancelación
    sillas[fila][columna] = 0
    tipo = obtener_tipo_silla(fila)
    precio = obtener_precio_silla(fila)
        
    # Restar del total recaudado
    total_recaudado -= precio
        
    print(f"✓ Reserva cancelada - Fila {fila}, Columna {columna} - {tipo}")
    print(f"  Reembolso: ${precio}")
        

def mostrar_total_recaudado():
    print("\n" + "="*50)
    print("    TOTAL RECAUDADO POR RESERVAS")
    print("="*50)
    
    # Calcular total sin descontar cancelaciones
    total_real = 0
    for fila in range(FILAS):
        for columna in range(COLUMNAS):
            if sillas[fila][columna] == 1:
                total_real += obtener_precio_silla(fila)
    
    print(f"Total recaudado actual: ${total_real}")
    print("="*50)

def mostrar_menu_principal():
    print("\n" + "="*50)
    print("    SISTEMA DE RESERVA DE CINE")
    print("="*50)
    print("1. Ver estado de la sala")
    print("2. Hacer reserva")
    print("3. Cancelar reserva")
    print("4. Ver total recaudado")
    print("5. Salir")
    print("="*50)

while True:
    mostrar_menu_principal()
    opcion = input("Seleccione una opción (1-5): ")
        
    if opcion == "1":
        mostrar_sala()
    elif opcion == "2":
        hacer_reserva()
    elif opcion == "3":
        cancelar_reserva()
    elif opcion == "4":
        mostrar_total_recaudado()
    elif opcion == "5":
        print("\n¡Gracias por usar el sistema! Hasta luego.")
        break
    else:    
        print("✗ Opción inválida. Intente nuevamente.")
