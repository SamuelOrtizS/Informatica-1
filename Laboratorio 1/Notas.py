nPrF=float(input("Ingrese la nota del proyecto: "))
nE=float(input("Ingrese la nota de la exposicion: "))
nT=float(input("Ingrese la nota de talleres: "))
nP=float(input("Ingrese la nota de parcial: "))
nF=nPrF*0.3+nE*0.2+nT*0.3+nP*0.2
print("La nota final es: ", nF)