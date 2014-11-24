#Intro#######################################################
#' GoogleVis Motion Chart of Surgeon Value
#' 
#' See surgeon value (average cost and complication rate)
#' over quarters
#' 
#' Sebastian Perez
#' August 7, 2014
########################################################

#Libraries####
#library(foreign)
library(xlsx)
library(zoo)
library(plyr)
library(googleVis)
#Read Data#####
Dat<-read.xlsx2("ColonData.xls",1,stringsAsFactors=FALSE)
names(Dat)
summary(Dat[,153:160])
summary(as.numeric(Dat$PredCost))
summary(as.numeric(Dat$MODEL1))
summary(as.numeric(Dat$P_0))
summary(as.numeric(Dat$PredCompProb))



Dat$QTR<-as.yearqtr(as.Date(as.numeric(Dat$admit_date), origin="1899-12-30"),
                    format="%YQ%q")

Dat2<-ddply(Dat,c("surgeon_id","QTR"), 
      function(df) c(avg=mean(as.numeric(df$PredCompProb), na.rm=T), 
                     avg2=mean(as.numeric(df$PredCost), na.rm=T)),
      .drop=FALSE)
Dat2$date<-as.Date(Dat2$QTR)

Dat3<-Dat2[complete.cases(Dat2),c(1,3,4,5)]
M<-gvisMotionChart(Dat3, idvar = "surgeon_id", timevar = "date",
                   xvar="avg", yvar="avg2",
                   date.format="%YQ%q", options=list(showSidePanel=F,
                                                  width=800
                                                  ))
plot(M)


