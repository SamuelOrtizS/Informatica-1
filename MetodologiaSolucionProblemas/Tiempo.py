from math import trunc as trunc


s=int(input("Ingrese el tiempo en segundos "))
h=trunc(s/3600)
m=trunc((s%3600)/60)
s=s%60
print("El tiempo es: ", h, "h ", m, "m ", s, "s")