library(googleVis)
time<-rep(1:12,4)
id<-rep(1:4, each=12)
rand<-rnorm(48,0,1)
height<-rep(c(5.8,5.1,5.9,5.0),each=12)+abs(time*rand/100)
weight<-height*25+rnorm(48,0,5)
rand
height
weight
plot(height,weight)

dat<-data.frame(time=time,id=id,height=height,weight=weight)

M<-gvisMotionChart(dat, idvar = "id", timevar = "time",
                xvar="height", yvar="weight")

print(M, file='C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/R/RSampleCode/GooglevisEx/motion2.html')
, colorvar="", sizevar="",
                date.format = "%Y/%m/%d", 
                options = list(), chartid)