#####################################################
#Lattice plotting from Coursera Programing in R class
#
#####################################################

library(lattice)
package? lattice
library(help=lattice)
data(environmental)
?environmental
head(environmental)
e<-environmental

##XYPLOTS###################################
xyplot(ozone~radiation, data=e)
xyplot(ozone~temperature, data=e)

#the equal count creates 4 equal and overlapping groups based on temp ranges
summary(e$temperaturetemp.cut)
temp.cut<-equal.count(e$temperature,4)
temp.cut

#plot radiation vs Ozone splt by temperature ranges
xyplot(ozone~radiation |temp.cut, data=e)
#change the layout so graphs are stacked
xyplot(ozone~radiation |temp.cut, data=e,layout=c(1,4) )

#Add a regression to each panel
xyplot(ozone~radiation |temp.cut, data=e,
       panel=function(x,y,...){ #pnel functions do something to each panel
         panel.xyplot(x,y,...) #this does the regular plot per panel
         fit<-lm(y~x) #creates regression model for each set
         panel.abline(fit) #add fit line to each panel
       })
#change to LOESS line and the as.table changes the order of panels
xyplot(ozone~radiation |temp.cut, data=e,as.table=TRUE,
       panel=function(x,y,...){ #pnel functions do something to each panel
         panel.xyplot(x,y,...) #this does the regular plot per panel
         panel.loess(x,y) #add fit line to each panel
       })

#panel by 2 variables
wind.cut<-equal.count(e$wind,4)
xyplot(ozone~radiation |temp.cut *wind.cut, data=e,as.table=TRUE,
       panel=function(x,y,...){ #pnel functions do something to each panel
         panel.xyplot(x,y,...) #this does the regular plot per panel
         panel.loess(x,y) #add fit line to each panel
       })

#SPLOM plots all 2 variable scatters########################################
splom(~e)

#Histograms#########################################
histogram(~ozone |wind.cut, data=e)
