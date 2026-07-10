# Sistema de reserva de cine
# Este programa permite reservar y cancelar sillas en dos salas de cine,
# mostrar el estado de cada sala y consultar el total recaudado por reservas.

# Constantes externas
FILAS = 7                  # Número de filas disponibles en cada sala.
COLUMNAS = 4               # Número de columnas disponibles en cada sala.
PRECIO_GENERAL = 10000     # Precio de una silla general.
PRECIO_PREFERENCIAL = 20000  # Precio de una silla preferencial.

# Variables externas
sala1 = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]
# Matriz que representa el estado de la sala 1; 0 = libre y 1 = reservada.

sala2 = [[0 for _ in range(COLUMNAS)] for _ in range(FILAS)]
# Matriz que representa el estado de la sala 2; 0 = libre y 1 = reservada.

salas = [sala1, sala2]
# Lista que almacena las dos salas del sistema para facilitar su manejo.


def obtener_tipo_silla(fila):
    """
    Entrada:
        fila (int): Número de fila de la silla.
    Salida:
        str: Devuelve "General" si la fila pertenece a la zona general,
        o "Preferencial" si pertenece a la zona preferencial.
    Descripción:
        Determina el tipo de silla según la fila ingresada.
    Variables internas:
        - No utiliza variables internas adicionales.
    """
    if fila <= 3:
        return "General"
    else:
        return "Preferencial"


def obtener_precio_silla(fila):
    """
    Entrada:
        fila (int): Número de fila de la silla.
    Salida:
        int: Precio de la silla según su tipo.
    Descripción:
        Retorna el precio de la silla dependiendo de si la fila es general o preferencial.
    Variables internas:
        - No utiliza variables internas adicionales.
    """
    if fila <= 3:
        return PRECIO_GENERAL
    else:
        return PRECIO_PREFERENCIAL


def leer_entero(prompt, min_val=None, max_val=None):
    """
    Entrada:
        prompt (str): Mensaje que se muestra al usuario para solicitar un dato.
        min_val (int o None): Valor mínimo permitido.
        max_val (int o None): Valor máximo permitido.
    Salida:
        int o None: Devuelve el número ingresado si es válido,
        o None si ocurre un error o si está fuera del rango permitido.
    Descripción:
        Lee un número entero desde consola y valida que esté dentro del rango indicado.
    Variables internas:
        - valor: Almacena el número ingresado convertido a entero.
    """
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
    """
    Entrada:
        No recibe parámetros.
    Salida:
        int o None: Devuelve el índice de la sala seleccionada (0 o 1),
        o None si la opción es inválida.
    Descripción:
        Muestra las salas disponibles y permite elegir una de ellas.
    Variables internas:
        - opcion: Almacena la opción ingresada por el usuario.
    """
    print("\n--- SELECCIONE SALA ---")
    print("1. Sala 1")
    print("2. Sala 2")
    opcion = leer_entero("Seleccione sala (1-2): ", min_val=1, max_val=2)
    if opcion is None:
        print("✗ Opción inválida.")
        return None
    return opcion - 1


def mostrar_sala(sillas, numero_sala):
    """
    Entrada:
        sillas (list): Matriz que representa el estado de una sala.
        numero_sala (int): Número de sala que se desea mostrar.
    Salida:
        No retorna datos, pero imprime el estado de la sala en consola.
    Descripción:
        Muestra la disposición de las sillas de una sala, indicando cuáles están libres o reservadas.
    Variables internas:
        - tipo: Identifica si la fila es general o preferencial.
        - estado: Representa el estado visual de cada silla.
    """
    print("\n" + "=" * 50)
    print(f"        ESTADO DE LA SALA DE CINE - SALA {numero_sala + 1}")
    print("=" * 50)
    print("Leyenda: 0=Libre  |  1=Reservada")
    print("Sillas Generales (filas 0-3): $" + str(PRECIO_GENERAL))
    print("Sillas Preferenciales (filas 4-6): $" + str(PRECIO_PREFERENCIAL))
    print("=" * 50)

    print("\n      Col 0  Col 1  Col 2  Col 3")
    for fila in range(FILAS):
        tipo = "GENERAL" if fila <= 3 else "PREFERENCIAL"
        print(f"Fila {fila} ({tipo:12})", end="")
        for columna in range(COLUMNAS):
            estado = "  [" + str(sillas[fila][columna]) + "]  "
            print(estado, end="")
        print()
    print("=" * 50)


def hacer_reserva(sillas, numero_sala):
    """
    Entrada:
        sillas (list): Matriz de la sala donde se realizará la reserva.
        numero_sala (int): Número de la sala donde se está trabajando.
    Salida:
        No retorna datos, pero modifica la matriz de sillas y muestra el resumen de la reserva.
    Descripción:
        Permite al usuario reservar una o varias sillas en una sala específica.
    Variables internas:
        - num_sillas: Cantidad de sillas que se desean reservar.
        - total_reserva: Suma total del costo de las sillas reservadas.
        - sillas_reservadas: Lista con los datos de las sillas reservadas.
        - fila, columna: Posición elegida por el usuario.
        - precio: Precio de la silla según su tipo.
        - tipo: Tipo de silla (General o Preferencial).
    """
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

    print("\n" + "=" * 50)
    print("           RESUMEN DE RESERVA")
    print("=" * 50)
    for fila, columna, tipo, precio in sillas_reservadas:
        print(f"Fila {fila}, Columna {columna} - {tipo}: ${precio}")
    print("-" * 50)
    print(f"TOTAL A PAGAR: ${total_reserva}")
    print("=" * 50)


def cancelar_reserva(sillas, numero_sala):
    """
    Entrada:
        sillas (list): Matriz de la sala donde se desea cancelar la reserva.
        numero_sala (int): Número de la sala donde se está trabajando.
    Salida:
        No retorna datos, pero modifica la matriz de sillas y muestra el mensaje de cancelación.
    Descripción:
        Permite cancelar una reserva existente en una posición específica.
    Variables internas:
        - fila, columna: Ubicación de la silla a cancelar.
        - tipo: Tipo de silla según la fila.
        - precio: Valor del reembolso de la reserva.
    """
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
    """
    Entrada:
        sillas (list): Matriz de la sala actual (no se usa directamente en esta versión).
        numero_sala (int): Número de la sala actual (no se usa directamente en esta versión).
    Salida:
        No retorna datos, pero imprime en consola el subtotal por sala y el total general.
    Descripción:
        Recorre todas las salas y calcula cuánto se ha recaudado por reservas.
    Variables internas:
        - total_general: Acumula el total recaudado de la sala 1.
        - total_preferencial: Acumula el total recaudado de la sala 2.
        - subtotal_sala: Valor total de una sala específica.
        - sala_index: Índice de cada sala dentro de la lista.
    """
    print("\n" + "=" * 50)
    print("    TOTAL RECAUDADO POR RESERVAS")
    print("=" * 50)

    total_general = 0
    total_preferencial = 0

    for sala_index, sala in enumerate(salas):
        subtotal_sala = 0
        for fila in range(FILAS):
            for columna in range(COLUMNAS):
                if sala[fila][columna] == 1:
                    subtotal_sala += obtener_precio_silla(fila)

        if sala_index == 0:
            total_general = subtotal_sala
        else:
            total_preferencial = subtotal_sala

        print(f"Sala {sala_index + 1}: ${subtotal_sala}")

    total_total = total_general + total_preferencial
    print("-" * 50)
    print(f"Total general: ${total_total}")
    print("=" * 50)


def mostrar_menu_principal(sala_actual):
    """
    Entrada:
        sala_actual (int): Índice de la sala que está activa en el momento.
    Salida:
        No retorna datos, solo muestra el menú en consola.
    Descripción:
        Presenta las opciones del sistema al usuario.
    Variables internas:
        - No utiliza variables internas adicionales.
    """
    print("\n" + "=" * 50)
    print("    SISTEMA DE RESERVA DE CINE")
    print("=" * 50)
    print(f"Sala actual: {sala_actual + 1}")
    print("1. Ver estado de la sala")
    print("2. Hacer reserva")
    print("3. Cancelar reserva")
    print("4. Ver total recaudado")
    print("5. Cambiar sala")
    print("6. Salir")
    print("=" * 50)


# Proceso principal
# Este bucle while mantiene el programa en ejecución hasta que el usuario elige salir.
# Permite mostrar el menú, leer la opción seleccionada y ejecutar la acción correspondiente
# en la sala activa o cambiar de sala según sea necesario.

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
