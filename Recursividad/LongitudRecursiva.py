# Longitud de una cadena de caracteres de forma recursiva
def longitud_cadena(cadena):
    if cadena == "":
        return 0
    else:
        return 1 + longitud_cadena(cadena[1:])

texto=input("Ingrese una cadena de caracteres: ")
print("La longitud de la cadena es: ", longitud_cadena(texto))