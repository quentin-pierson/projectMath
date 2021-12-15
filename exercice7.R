df <- read.csv("données.csv", header=TRUE, sep=';', row.names="X")
head(df)


names(df)

# Question 1
corre <- cor(df)
head(corre)


# Question 2
zdf <- as.data.frame(as.table(corre))
zdf <-zdf[order(-zdf$Freq),]
zdf


# Question 5
library(corrplot)
corrplot(corre, method="circle")