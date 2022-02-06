#1) f (x, y) = e^xy − e^x + 2
# Expression de la formule
f = expression(exp(x*y)-exp(x)+2)

#Dervivé de X
de1 <- D(f, 'x')
de1

de3 <- separate(de1)
A = matrix(de3)
A

#Dervivé de Y
de2 <- D(f, 'y')
de2

#Pour resoudre le systeme on utilise une matrice et un vecteur 
de3 <- deriv(f, 'x')
de4 <- deriv(f, 'x')

A = matrix(de3,de4)
A
b = c(0, 0)
b
r3 <- solve(A,b)

r3

#2) g(x, y, z) = (x+z^2)e^x(y^2+z^2+1)

#3) h(x, y, z) = ln(xyz) − ln(x) ln(y) ln(z)