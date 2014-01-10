# Select examples from Steve's BB series on R graphics. 
# Note you will need to install ggplot2 for the ggplot examples to work
library(reshape2)
library(ggplot2)
# TABLE AND XTABS

table(am=mtcars$am,cyl=mtcars$cyl)
xtabs(~am + cyl,mtcars)
xtabs(~am + cyl + gear,mtcars)
summarize(mtcars)

# AGGREGATE

aggregate(cbind(mpg,hp,wt) ~ am,mtcars,mean)
aggregate(cbind(mpg,hp,wt) ~ cyl,mtcars,mean)
aggregate(cbind(mpg,hp,wt) ~ cyl+am,mtcars,mean)

# MELT
my.melt = melt(mtcars,id.vars=c("cyl","am"))
cast(my.melt, cyl ~ variable, mean)
cast(my.melt, cyl ~ variable| am, mean,subset=variable %in% c("hp","wt","carb"))


# STEM PLOTS

x=rnorm(500,0,5)
for (ii in 1:500) {
  if (ii < 200) {
    x[ii] = -(abs(x[ii]))
  }
  else {
    x[ii] = abs(x[ii])
  }
}

stem(x)
sort(mtcars$mpg)
stem(mtcars$mpg)

plot(x,type="h",lwd=4,main="Your First Plot")
colors = ifelse(x >= 0,"black","gray")
plot(x,type="h",lwd=2,main="Your Second Plot",col=colors)
hist(x,breaks=seq(-20,20,2),col="blue",main="Your 1st Histogram")

# BIG SCATTER
pairs(mtcars,cex=0.9,pch=21,bg="red",font.labels=2)

# SMALL SCATTER
pairs(mtcars[,1:3],cex=2,pch=24,bg="purple",font.labels=2,panel=panel.smooth)

# COMPLEX SCATTER
panel.cor <- function(x, y, digits=2, prefix="", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  cex.cor = 1.5
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
pairs(mtcars[1:4],lower.panel=panel.smooth,upper.panel=panel.cor)
