#t1 = 10% > 75m
#   = P(X > 75) = 0.1
#   = P(X < 75) = 0.9

#t2 = 25% < 50m
#   = P(X < 50) = 0.25
m1<-75
m2<-50

t1<-0.9
r1<-qnorm(t1,0,1)
r1

t2<-0.25
r2<-qnorm(t2,0,1)
r2

#Resoudre le Systeme
# 75 - µ = 1.28∂
# 50 - µ = -0.67∂
# SOIT
# m1 - 1 = r1∂
# m2 - 1 = r2∂
#On remarque que sigma reste une inconnu, du coup
#on inverse le r avec m pour que sigma puisse être une inconnu.
# DONC
# -r1 - 1 = -m1
# -r2 - 1 = -m2

#Pour resoudre le systeme on utilise une matrice et un vecteur 
A = matrix(c(-r1,-r2,-1,-1),2,2)
A
b = c(-m1,-m2)
b
r3 <- solve(A,b)
r3

ecart_type <- r3[1]
esperance <- r3[2]

#Resultat Finale
#∂
ecart_type
#µ
esperance

#Verification
#doit etre egale environ à 0.9
pnorm(m1, sd=ecart_type, mean=esperance, lower.tail = TRUE)
#doit etre egale environ à 0.25
pnorm(m2, sd=ecart_type, mean=esperance, lower.tail = TRUE)