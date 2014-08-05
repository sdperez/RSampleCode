crime<-read.csv("http://datasets.flowingdata.com/crimeRatesByState-formatted.csv")
stars(crime)
row.names(crime)<-crime$state
crime<-crime[,2:7]
stars(crime,flip.labels=F,key.loc=c(15,1.5))
stars(crime,flip.labels=F,key.loc=c(15,1.5),draw.segments=T)
