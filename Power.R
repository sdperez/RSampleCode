library("pwr")
library("Hmisc")
pwr.t.test(n =10 , d = .8 , sig.level =.1 , power = , type = c( "one.sample")) 
  #different types of t-tests
cpower( tref=40 ,n=20, mc=.99, r=30, accrual=0, tmin=100,  alpha=0.1)
  #for cox regression/log-rank test(from Hmisc)
pwr.2p.test(h=.3,power=.80,alternative="two.sided")
  #comparing two proportions with same sample size


# Plot sample size curves for detecting correlations of
# various sizes.

# range of correlations
r <- seq(.1,.5,.01)
nr <- length(r)

# power values
p <- seq(.4,.9,.1)
np <- length(p)

# obtain sample sizes
samsize <- array(numeric(nr*np), dim=c(nr,np))
for (i in 1:np){
  for (j in 1:nr){
    result <- pwr.r.test(n = NULL, r = r[j],
                         sig.level = .05, power = p[i],
                         alternative = "two.sided")
    samsize[j,i] <- ceiling(result$n)
  }
}

# set up graph
xrange <- range(r)
yrange <- round(range(samsize))
colors <- rainbow(length(p))
plot(xrange, yrange, type="n",
     xlab="Correlation Coefficient (r)",
     ylab="Sample Size (n)" )

# add power curves
for (i in 1:np){
  lines(r, samsize[,i], type="l", lwd=2, col=colors[i])
}

# add annotation (grid lines, title, legend) 
abline(v=0, h=seq(0,yrange[2],50), lty=2, col="grey89")
abline(h=0, v=seq(xrange[1],xrange[2],.02), lty=2,
       col="grey89")
title("Sample Size Estimation for Correlation Studies\n
   Sig=0.05 (Two-tailed)")
 legend("topright", title="Power", as.character(p),
        fill=colors)