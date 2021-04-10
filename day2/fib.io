phi := (5 sqrt + 1) / 2
fib_formula := method(n, ((phi ** n - (1 - phi) ** n) / (5 sqrt)) round)

fib_recursion := method(n, n switch(1, 1, 2, 1, fib_recursion(n - 1) + fib_recursion(n - 2)))

for(i, 1, 10, list(fib_formula(i), fib_recursion(i)) println)
