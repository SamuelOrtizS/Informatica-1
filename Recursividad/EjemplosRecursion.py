def Sumatoria(n):
    if n == 0:
        return 0
    else:
        print(f"Sumatoria({n}) = {n} + Sumatoria({n - 1})")
        return n + Sumatoria(n - 1)

print(Sumatoria(5))  # Output: 15