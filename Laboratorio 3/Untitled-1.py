def calcular_imc(peso, estatura):
    imc = peso / (estatura ** 2)
    if imc < 18.5:
        estado = "Peso inferior"
    elif imc <= 24.9:
        estado = "Peso normal"
    elif imc <= 29.9:
        estado = "Sobrepeso"
    elif imc <= 34.9:
        estado = "Obesidad moderada"
    else:
        estado = "Obesidad severa"
    return imc, estado

# Ejemplo de uso
peso = float(input("Ingrese el peso en kg: "))
estatura = float(input("Ingrese la estatura en metros: "))
imc, estado = calcular_imc(peso, estatura)
print(f"IMC: {imc:.2f} - Estado: {estado}")
