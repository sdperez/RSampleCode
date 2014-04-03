
install.packages('tensorA')
install.packages('energy')
install.packages('C:/Users/sdperez.EMORYUNIVAD/Downloads/compositions_1.30-2.tar.gz',
                 repos = NULL, type="source") #still not working

library(compositions)

A<-read.csv("C:/Documents and Settings/N375726/My Documents/OtherStudies/ESSOM/Rtest.csv", header=T)
B<-A[ ,2:5]
B
C<-acomp(B)
plot(C)
hc <- hclust(dist(C,method="euclidean"))
hc <- hclust(dist(C),method="complete")
hc <- hclust(dist(C,method="euclidean"),method="complete") 
#All three give the same dendogram ie. furthest neighbor
plot(hc)
D<-clr(B)
hc <- hclust(dist(D,method="euclidean")) #Gives same result as using acomp function
plot(hc)

hc <- hclust(dist(C),method="single") #Method called nearest neighbor by SPSS
plot(hc)

hc <- hclust(dist(C),method="aver") #Average distance using UPGMA 'between groups' in SPSS
plot(hc)

