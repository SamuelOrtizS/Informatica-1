vT = int(input("Ingrese el valor numerico de los trigliceridos: "))
if vT < 150:
    print("El nivel de trigliceridos es normal")
elif vT >= 150 and vT <= 199:
    print("El nivel de trigliceridos es intermedio alto")
elif vT >= 200 and vT <= 499:
    print("El nivel de trigliceridos es alto")
elif vT  >= 500:
    print("El nivel de trigliceridos es muy alto")