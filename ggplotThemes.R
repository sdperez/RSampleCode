#############################
#Use Themes to modify the look of
#ggplot graphs
#############################
#Create Theme for graphs
##Takes a basic grey theme and makes modifications
library(ggplot2)

qplot(mpg,wt,data=mtcars)+theme_grey()#this is the normal theme
qplot(mpg,wt,data=mtcars)+theme_bw() #this is a baseic Black and White

#Here I take the basic B&W theme and make additions/modifcations
mytheme<-theme_bw(base_size=16) +
  theme(axis.text.x=element_text(angle=30), 
        plot.title=element_text(hjust=0, face="italic"),
        panel.grid.major.x=element_blank(),
        panel.border=element_blank())

#Aplly the new theme to a plot
qplot(mpg,wt,data=mtcars, main='Left Justified Title')+mytheme 


#apply the new theme plus another parameter to the plot
qplot(mpg,wt,data=mtcars)+mytheme+theme(panel.grid.minor.x=element_line(colour='red'))

#Change the position of legends
##Regular
qplot(mpg,wt,data=mtcars, main='Left Justified Title',colour=factor(cyl))+mytheme
##None
qplot(mpg,wt,data=mtcars, main='Left Justified Title',colour=factor(cyl))+
  mytheme+theme(legend.position='none')
##bottom
qplot(mpg,wt,data=mtcars, main='Left Justified Title',colour=factor(cyl))+
  mytheme+theme(legend.position='bottom')
##at a relative place inside
qplot(mpg,wt,data=mtcars, main='Left Justified Title',colour=factor(cyl))+
  mytheme+theme(legend.position=c(.7,.7))

