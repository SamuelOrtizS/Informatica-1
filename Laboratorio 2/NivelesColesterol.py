def colesterolTotal():
    if colTotal< 200:
        return "Optimo"
    elif colTotal >= 200 and colTotal <= 239:
        return "Intermedio Alto"
    else:
        return "Alto"
    
def colesterolHDL():
    if colHDL < 40:
        return "Bajo"
    elif colHDL >= 60:
        return "Alto"
    else:
        return "Normal"

def trigliceridos():
    if tri < 150:
        return "Normal"
    elif tri >= 150 and tri <= 199:
        return "Intermedio Alto"
    elif tri >= 200 and tri <= 499:
        return "Alto"
    else:
        return "Muy Alto"
    
nombre=input("Ingrese su nombre: ")
genero=input("Indique si es hombre o mujer: ")
colTotal=float(input("Ingrese el valor numérico del colesterol total: "))
colHDL=float(input("Ingrese el valor numérico del colesterol HDL: "))
tri=float(input("Ingrese el valor numérico de los triglicéridos: "))

print(nombre, " sus niveles de colesterol son: ")
print("Colesterol total: ", colesterolTotal())
print("HDL: ", colesterolHDL())
print("Triglicéridos: ", trigliceridos())
