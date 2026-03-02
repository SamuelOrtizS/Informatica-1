trigliceridos = int(input("Ingrese el valor de los trigliceridos: "))
if trigliceridos <= 150:
    print("El nivel de trigliceridos es normal.")
elif trigliceridos > 150 and trigliceridos <= 200:
    print("El nivel de trigliceridos es intermedio alto.")
elif trigliceridos > 200 and trigliceridos <= 500:
    print("El nivel de trigliceridos es alto.")
elif trigliceridos  > 500:
    print("El nivel de trigliceridos es muy alto.")