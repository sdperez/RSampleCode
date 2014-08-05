####################################################
#Some Exploration of the data

setwd("C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/EducationalMaterials/DataAnalysis-Coursera/Project2")
load("FinalSets.rda")

corrs<-cor(TrainData[,-c(562,563)])
#casual inspection reveals VERY high correlations between variables


#Create Boxplots
dir.create('./plots')
number.vars <- ncol(TrainData) - 2
digits <- nchar(as.character(number.vars))
pad <- ""; for(i in 1:digits) pad = paste(pad, "0", sep="")
pb <- txtProgressBar(style=3)
for (i in 1:number.vars){
  number=paste(pad, i, sep="");
  number = substring(number, nchar(number)-digits+1)
  #filename = paste("plots/",number,".hist.png", sep="")
  #png(filename)
  #hist(TrainData[,i], main=paste(number,names(TrainData)[i]),
       #xlab=paste("TrainData[,",i,"]",sep=""))
  #dev.off()
  filename = paste("plots/",number,".boxp.png", sep="")
  png(filename)
  boxplot(TrainData[,i] ~ TrainData$activity, main=paste(number,names(TrainData)[i]))
  dev.off()
  setTxtProgressBar(pb, i/number.vars)
}
close(pb)