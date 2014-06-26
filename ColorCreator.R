#########################################
#Various Ways to create colors
#(ie gradients,scales etc)
#
#plus ggplot and regular plots to test color schemes
#########################################

#look up color names available
colors()


##Example 1: Random Color Generator####
library(ggplot2)

#Function to generate random colors
set.seed(12345)
rand_color = function() {
  return(rgb(runif(1), runif(1), runif(1)))
}
#create a vector of random colors
col = sapply(1:18, function(x) rand_color())
#create a number of bars (same size) and plot
df <- data.frame(x=letters[1:18])
p <- qplot(data=df, x, 1, geom="bar", stat="identity", fill=x) 
#Add color
p + scale_fill_manual(values=col)

##Example 2:Using colorRampPalette####
#creates a gradient of colors between two selections
colfunc <- colorRampPalette(c("red","yellow","green","blue"))
colfunc(21)

plot(rep(1,21),col=colfunc(21),pch=19,cex=3)
