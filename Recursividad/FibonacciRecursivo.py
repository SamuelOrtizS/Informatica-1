def fibonacci(n):
    if n <= 1:
        return 1
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)
numero =int(input("Ingrese un número para calcular su Fibonacci: "))
print(fibonacci(numero))
