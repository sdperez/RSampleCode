#######################################################Top
#Effects of Possitve Cross-Matches on Liver Transplants
#Exploratory and univariate analyses
#
#Date:7/8/2013
#Sebastian Perez
######################################################Start
#Directory#############################################
setwd('H:/My Documents/Studies/KnechtleLiverCrossMatch')
#Libraries#########################################################################
library(survival)
#library(KMsurv) not needed


#Explore Data Structure and Fix#####################################################
####Data#####
xmatch.dat<-read.csv("XMDataCSV.csv")
###Fix names####
names(xmatch.dat)
names(xmatch.dat)<-tolower(names(xmatch.dat)) #turn names to lowercase
names(xmatch.dat)<-gsub("\\.","",names(xmatch.dat))
names(xmatch.dat)<-gsub("yn","",names(xmatch.dat))

###Recode missing#####
xmatch.dat[xmatch.dat==""]<-NA #replace all empty cells with NAs
xmatch.dat$cellularrejection<-factor(xmatch.dat$cellularrejection)
xmatch.dat$crossmatch<-factor(xmatch.dat$crossmatch)

#Run Survival Analysis on Cellular Rejection#####################################
###First fix dates and calculate time from transplant to rejection/follow up
xmatch.dat$transplantdate<-as.Date(as.character(xmatch.dat$dateoftransplant),"%m/%d/%Y")
xmatch.dat$rej1date<-as.Date(as.character(xmatch.dat$cellularrejectiondate),"%m/%d/%Y")
xmatch.dat$lastdate<-as.Date(as.character(xmatch.dat$lastfollowupdate),"%m/%d/%Y")

#####Calc the appropriate followup date for cell rejection 
xmatch.dat$Fdate<-pmin(xmatch.dat$rej1date,xmatch.dat$lastdate,na.rm=TRUE)
#####Calc time to rejection or last follow up
xmatch.dat$Ftime<-xmatch.dat$Fdate-xmatch.dat$transplantdate
class(xmatch.dat$Ftime)

#Indicator of rejection
xmatch.dat$cRej<-xmatch.dat$cellularrejection=='y'
head(xmatch.dat$cRej)

###Run Kaplan Meier Analysis
summary(as.numeric(xmatch.dat$Ftime))
xmatch.surv.obj<-Surv(as.numeric(xmatch.dat$Ftime), xmatch.dat$cRej)
rej.fit<-survfit(xmatch.surv.obj~xmatch.dat$crossmatch)
rej.fit$surv
rep(names(rej.fit$strata), rej.fit$strata)



summary(rej.fit)
plot(rej.fit, col=c(2,4))
legend(40, .2, levels(xmatch.dat$crossmatch), lty=1,col=c(2,4))

#Do log rank test
survdiff(xmatch.surv.obj~xmatch.dat$crossmatch)


