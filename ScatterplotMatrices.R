crime<-read.csv("http://datasets.flowingdata.com/crimeRatesByState-formatted.csv")
pairs(crime)
pairs(crime,panel=panel.smooth)

pairs(~ Fertility + Education + Catholic, data = swiss,
      subset = Education < 20, main = "Swiss data, Education < 20")
#calculate correlations
panel.cor <- function(x, y, digits=2, prefix="", cex.cor, ...)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex.cor <- .8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex.cor * r)
}
pairs(crime,lower.panel=panel.smooth, col.smooth='blue', upper.panel=panel.cor,lwd=2 ,pch='.')
