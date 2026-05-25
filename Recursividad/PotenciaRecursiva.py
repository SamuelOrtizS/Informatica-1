def potencia(base: float,exponente: int)-> float:
    if exponente == 0:
        return 1
    else:
        return base * potencia(base, exponente - 1)
    
numBase = float(input("Ingrese la base: "))
numExponente = int(input("Ingrese el exponente: "))
resultado = potencia(numBase, numExponente)
print(f"{numBase} elevado a la {numExponente} es: {resultado}")
