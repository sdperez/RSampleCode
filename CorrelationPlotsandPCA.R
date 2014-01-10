#############################################
#Correlation Heatmap
#from R-Bloggers
############################################
data(attitude)
library(ggplot2)
library(reshape2)
p<-qplot(x=Var1, y=Var2, data=melt(cor(attitude)),fill=value, geom="tile")
    
##Change the color gradient#####
#set up a coloring scheme using colorRampPalette
red=rgb(1,0,0); green=rgb(0,1,0); blue=rgb(0,0,1); white=rgb(1,1,1)
RtoWrange<-colorRampPalette(c(red, white ) )
WtoGrange<-colorRampPalette(c(white, green) ) 

p + scale_fill_gradient2(low=RtoWrange(100), 
                              mid=WtoGrange(100), high="gray")

##########################################
#Principal Component Analysis and
#Plots of variable loading by PCA
#########################################
pca <- prcomp(attitude, scale=T)
melted<-melt(pca$rotation)
qplot(x=Var1, y=value, facets=~Var2, data=melted, geom="bar",stat="identity")
                              