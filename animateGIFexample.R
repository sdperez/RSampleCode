#'Code creates a moving image (GIF) out of several plots using the 
#'animate package. Briefly, it creates a function that generates a plot but changes
#'one aspect. Then you run a series of plots while changing that paramter and save
#' them in a list. Then use saveGIF to save them into one file
 
setwd('C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/R/RSampleCode')
library(animation)
#Simple plot
data(cars)
plot(cars)
abline(a=0,b=1)
#testing saveGIF code
saveGIF({
  for (i in 1:10) plot(runif(10), ylim = 0:1)
})
#possibly need to fix the location of the 'convert' program
ani.options("convert")
ani.options(convert = 'C:/Program Files/ImageMagick-6.9.1-Q16/convert.exe')

#write function to create multiple plots
trial<-function(i) {
  plot(cars)
  abline(a=0,b=i)
}
#create a list of plots that can be saved to a GIF
animation<-lapply(1:5,trial)

#Use animate library saveGIF to convert to gif
saveGIF(lapply(1:10,trial), movie.name="CarsPlot.gif")
