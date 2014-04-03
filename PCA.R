##############################################################
#PCA Analysis of Cytokines

#Analysis for Roshan George on Senescence and Exhaustion T-Cell differences between
#normal controls and patients awaiting transplant.


#Import data
library(xlsx)
setwd('C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/Studies/RoshanCD8')
tcells<-read.xlsx2('RawData/CKIMP-data.xlsx',1,stringsAsFactors=FALSE)


#Data imported as character so cytokines need to be converted to numbers.
names(tcells)
sapply(tcells[,31:58],class)
as.numeric(tcells[,31:32])
cytokines<-as.data.frame(sapply(tcells[,31:58],as.numeric))


#Now run principal components on the data and print out plots etc.
pca.out=prcomp(~.,data=cytokines, scale=TRUE,na.action=na.omit)
names(pca.out)
print(pca.out$sdev)
pr.var=pca.out$sdev^2
pve=pr.var/sum(pr.var ) #calculate the proportion of variance explained

#Plot the percent of variance explained by each pricipal component and the cumulative variance explained
par(mfcol=c(1,2))
plot(pve , xlab=" Principal Component ", ylab=" Proportion of
Variance Explained ", ylim=c(0,1) ,type='b')
plot(cumsum (pve ), xlab=" Principal Component ", ylab ="
Cumulative Proportion of Variance Explained ", ylim=c(0,1) ,
type='b')
cumsum (pve )


#From the plot it looks like the first three PCs explain the most variance 
#individually but only 67% of the total cumulative variance. Further principal 
#components add a bit each for a gradual increase in the cumulative variance explained.
#Let's look at the first three components since they seem most important. 
#We want to output the variables with the biggest loadings for each component to 
#see what each component is representing.

#look at all loading for first three components
pca.out$rotation[,1:3]
#print 1st PCA in decreasing order
as.data.frame(pca.out$rotation[order(abs(pca.out$rotation[,1]),decreasing=T),1][1:10])

#print 2nd PCA in decreasing order
as.data.frame(pca.out$rotation[order(abs(pca.out$rotation[,2]),decreasing=T),2][1:7])

#print 3rd PCA in decreasing order
as.data.frame(pca.out$rotation[order(abs(pca.out$rotation[,3]),decreasing=T),3][1:6])

#Essentially the PCA analysis is showing us what cytokines tend to 'group' together or show the characteristics for each patient.

