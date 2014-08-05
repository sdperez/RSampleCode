#########################################
#COLORS:
#Various Ways to create/look at colors
#(ie gradients,scales,palettes etc)
#
#plus ggplot and regular plots to test color schemes
#########################################

# Defaults##################################
colors() #prints all the named colors you can use in R
#' Default colors for basic plots
#' uses a list of 8 colors
par(mfcol=c(2,1))
plot(rep(1,21),col=c(1:21),pch=19,cex=3)
barplot(height=c(1:21),col=c(1:21))

palette() #this prints the default colors used

#Change Default############################
#' You can create your own palette and R
#' uses it as default for the session.
palette(c('red','orange','yellow','darkred','pink','plum',
          'purple','peachpuff'))
plot(rep(1,21),col=c(1:21),pch=19,cex=3)
barplot(height=c(1:21),col=c(1:21))

palette('default') #goes back to the default

#Prebuilt Palettes##############################
#' raqinbow, topo.colors, terrain.colors 
#' functions create a list of colors (of desired 
#' length). They tend to only work well with
#'  7 to 8  colors.
par(mfcol=c(1,1))
plot(rep(1,21),col=topo.colors(8),pch=19,cex=3)

plot(rep(1,21),col=rainbow(8),pch=19,cex=3)
pie(rep(1,12), col=rainbow(12))

plot(rep(1,21),col=terrain.colors(8),pch=19,cex=3)

barplot(height=c(1:21),col=cm.colors(8))#cyan to magenta

##Gray() creates a gray shade (with value between 0 and 1)
gray(.8)

#Color Interpolation############################
#' Various functions let you build scales or gradients
#' of colors.




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
barplot(height=c(1:21),col=c(1:21))
barplot(height=1:21,col=colfunc(21),pch=19,cex=3)
