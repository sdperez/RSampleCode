library(compositions)

A<-read.csv("C:/Documents and Settings/N375726/My Documents/OtherStudies/ESSOM/FinalSamplecd4.csv", header=T)
B<-A[ ,3:18]
C<-acomp(B)
PCA=princomp(C)
screeplot(PCA)
summary(PCA)
PCA$scores #I think this is outputting th e actual principle component vector
