FILAS = 7
COLUMNAS = 4
PRECIO_GENERAL = 10000
PRECIO_PREFERENCIAL = 20000

sala1 = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]
sala2 = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]
salas = [sala1, sala2]

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


def leer_entero(prompt, min_val=None, max_val=None):
    try:
        valor = int(input(prompt))
    except ValueError:
        return None

    if min_val is not None and valor < min_val:
        return None
    if max_val is not None and valor > max_val:
        return None
    return valor


def seleccionar_sala():
    print("\n--- SELECCIONE SALA ---")
    print("1. Sala 1")
    print("2. Sala 2")
    opcion = leer_entero("Seleccione sala (1-2): ", min_val=1, max_val=2)
    if opcion is None:
        print("✗ Opción inválida.")
        return None
    return opcion - 1

def mostrar_sala(sillas, numero_sala):
    print("\n" + "="*50)
    print(f"        ESTADO DE LA SALA DE CINE - SALA {numero_sala + 1}")
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

def hacer_reserva(sillas, numero_sala):
    print(f"\n--- HACER RESERVA EN SALA {numero_sala + 1} ---")
    mostrar_sala(sillas, numero_sala)
    
    num_sillas = leer_entero("¿Cuántas sillas desea reservar? ", min_val=1)
    if num_sillas is None:
        print("✗ Ingrese una cantidad válida.")
        return
        
    total_reserva = 0
    sillas_reservadas = []
        
    for i in range(num_sillas):
        print(f"\nSilla {i + 1}:")
        fila = leer_entero("  Ingrese número de fila (0-6): ", min_val=0, max_val=FILAS - 1)
        columna = leer_entero("  Ingrese número de columna (0-3): ", min_val=0, max_val=COLUMNAS - 1)
            
        if fila is None or columna is None:
            print("✗ Fila o columna fuera de rango.")
            return
        
        if sillas[fila][columna] == 1:
            print("✗ Esta silla ya está reservada.")
            return
            
        sillas[fila][columna] = 1
        precio = obtener_precio_silla(fila)
        total_reserva += precio
        tipo = obtener_tipo_silla(fila)
        sillas_reservadas.append((fila, columna, tipo, precio))
        print(f"✓ Silla reservada - Fila {fila}, Columna {columna} - {tipo} (${precio})")
        
    print("\n" + "="*50)
    print("           RESUMEN DE RESERVA")
    print("="*50)
    for fila, columna, tipo, precio in sillas_reservadas:
        print(f"Fila {fila}, Columna {columna} - {tipo}: ${precio}")
    print("-"*50)
    print(f"TOTAL A PAGAR: ${total_reserva}")
    print("="*50)

def cancelar_reserva(sillas, numero_sala):
    print(f"\n--- CANCELAR RESERVA EN SALA {numero_sala + 1} ---")
    mostrar_sala(sillas, numero_sala)
    
    fila = leer_entero("Ingrese número de fila de la silla (0-6): ", min_val=0, max_val=FILAS - 1)
    columna = leer_entero("Ingrese número de columna de la silla (0-3): ", min_val=0, max_val=COLUMNAS - 1)
        
    if fila is None or columna is None:
        print("✗ Fila o columna fuera de rango.")
        return
        
    if sillas[fila][columna] == 0:
        print("✗ Esta silla no está reservada.")
        return
        
    sillas[fila][columna] = 0
    tipo = obtener_tipo_silla(fila)
    precio = obtener_precio_silla(fila)
        
    print(f"✓ Reserva cancelada - Fila {fila}, Columna {columna} - {tipo}")
    print(f"  Reembolso: ${precio}")
        

def mostrar_total_recaudado(sillas, numero_sala):
    print("\n" + "="*50)
    print(f"    TOTAL RECAUDADO POR RESERVAS - SALA {numero_sala + 1}")
    print("="*50)
    
    total_recaudado = 0
    for fila in range(FILAS):
        for columna in range(COLUMNAS):
            if sillas[fila][columna] == 1:
                total_recaudado += obtener_precio_silla(fila)
    
    print(f"Total recaudado actual: ${total_recaudado}")
    print("="*50)

def mostrar_menu_principal(sala_actual):
    print("\n" + "="*50)
    print("    SISTEMA DE RESERVA DE CINE")
    print("="*50)
    print(f"Sala actual: {sala_actual + 1}")
    print("1. Ver estado de la sala")
    print("2. Hacer reserva")
    print("3. Cancelar reserva")
    print("4. Ver total recaudado")
    print("5. Cambiar sala")
    print("6. Salir")
    print("="*50)

sala_actual = 0

while True:
    mostrar_menu_principal(sala_actual)
    opcion = input("Seleccione una opción (1-6): ")
        
    if opcion == "1":
        mostrar_sala(salas[sala_actual], sala_actual)
    elif opcion == "2":
        hacer_reserva(salas[sala_actual], sala_actual)
    elif opcion == "3":
        cancelar_reserva(salas[sala_actual], sala_actual)
    elif opcion == "4":
        mostrar_total_recaudado(salas[sala_actual], sala_actual)
    elif opcion == "5":
        nueva_sala = seleccionar_sala()
        if nueva_sala is not None:
            sala_actual = nueva_sala
    elif opcion == "6":
        print("\n¡Gracias por usar el sistema! Hasta luego.")
        break
    else:    
        print("✗ Opción inválida. Intente nuevamente.")
