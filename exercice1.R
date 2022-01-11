#install.packages("expm")
library(expm)

resousSystem <- function(syst) {
  n <- readline(prompt="Enter numer for power ")
  n <- as.integer(n)
  
  
  X0 = c(1,2,3)
  
  # recuperer la matrice A par rbind, la diagonalise 
  matrixe = eigen(syst)
  
  P = round(matrixe$vectors)
  D = diag(round(matrixe$values))
  inv_P = solve(P)
  
  
  print(P)
  print(D)
  print(inv_P)
  
  print(P %*% (D %^% n) %*% inv_P%*% X0)
  
}




a = rbind( 
  c(1,0,2), 
  c(0,-1,0), 
  c(2,0,1))


resousSystem(a)