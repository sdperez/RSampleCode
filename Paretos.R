library(qcc)
LCost<-c(2590,5760,790,720,120,170)
OCost<-c(3780,4900,1170,1660,670,1310)
names(LCost)<-c('Floor','Operating Room','Lab/Pathology',"Pharmacology",
                'Radiology','ICU')
names(OCost)<-names(LCost)
par(mfcol=c(1,2))
pareto.chart(LCost,main="LDP Cost by Type")
pareto.chart(OCost,main="ODP Cost by Type")