#install.packages("corrplot")
#install.packages("factoextra")

library(factoextra)
library(corrplot)

df <- read.csv("données.csv", header=TRUE, sep=';', row.names="X")
head(df)

names(df)

# Question 1
corre <- cor(df)
head(corre)


# Question 2
# Sortir une meilleur matrice 
zdf <- as.data.frame(as.table(corre))
zdf <-zdf[order(-zdf$Freq),]
zdf


# Question 3 
# Sortir la matrice des composants pricniaples et prendre les plus importants
# calculer la part d'inertie en prenant les deux pourcentages des principaux components 

# ACP
res.pca <- prcomp(df, scale = TRUE)
fviz_eig(res.pca)
fviz_pca_ind(res.pca,
             col.ind = "cos2", # Color by the quality of representation
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)

fviz_pca_var(res.pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)



# Question 5
library(corrplot)
corrplot(corre, method="circle")



