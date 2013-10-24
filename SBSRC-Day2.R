## 
## Drew Linzer
## dlinzer@emory.edu
## March 30, 2012
## 
## Emory University
## SBSRC Workshop: Statistical Analysis Using R
## 
## SBSRC-Day2.R
## 
## Statistical modeling, programming, and simulation
## 


# 2008 Presidential election data, by county, from NY Times

elec <- dget("http://userwww.service.emory.edu/~dlinzer/NYT-08-election-data.put")

elec[1:10,]

names(elec)#ask for the names of the variables

dim(elec)#remember: row, column



# R's symbolic formula defintion syntax

?formula #take a look at the way you can construct the equations for models (how to code interactions etc)
#y~ a + b  simple model with 2 variables and intercept
#y~ a + b + a:b model with an interaction term
#y~ a*b is a shortcut way of the above model



## Bivariate linear regression

?lm

plot(ObamaPct~PctInPoverty,data=elec)

lm(formula=ObamaPct~PctInPoverty,data=elec) #just the barebones fitting of the model

summary(lm(formula=ObamaPct~PctInPoverty,data=elec)) #this gives the actual information about the model that we are used to

regmod <- lm(formula=ObamaPct~PctInPoverty,data=elec)

is.list(regmod)

names(regmod)

anova(regmod) #anova table

regmod[[1]]

regmod$coefficients

coefficients(regmod)

regmod$residuals

names(summary(regmod))

coef(summary(regmod))#in matrix form

plot(regmod)
# Visualize model result and uncertainty around model estimates

abline(coefficients(regmod),lwd=3,col="red")

yhatCI <- predict.lm(regmod,interval="confidence")
yhatCI[1:10,]

x <- elec$PctInPoverty
lines(sort(x),yhatCI[order(x),3],col="blue",lwd=3)  # 95% CI of y-hat
lines(sort(x),yhatCI[order(x),2],col="blue",lwd=3)


# Can also produce a "prediction" interval for values of y (not y-hat)
ypredCI <- predict.lm(regmod,interval="prediction")
ypredCI[1:10,]         # note a larger range of values of y.

lines(sort(x),ypredCI[order(x),3],col="dodgerblue",lwd=3)  # 95% interval for future y observations
lines(sort(x),ypredCI[order(x),2],col="dodgerblue",lwd=3)


# But, was a linear fit a good idea?

plot(regmod$fitted.values,regmod$residuals)

plot(regmod)#understands you want standard plots (residuals etc)

plot(ObamaPct~PctInPoverty,data=elec)

# Try a non-parametric smoother

lines(lowess(elec$PctInPoverty,elec$ObamaPct),lwd=1,col="blue")

# add a square term (we have enough data)

summary(lm(ObamaPct~PctInPoverty,elec)) # leave off argument names

regmod2 <- lm(ObamaPct~PctInPoverty+I(PctInPoverty^2),elec)

summary(regmod2)

plot(regmod2)




## Multiple regression

# with dummy variables (intercept shifts)

elec$south <- (elec$State=="AL" | elec$State=="AR" | elec$State=="FL" | elec$State=="GA" | elec$State=="KY" | 
                elec$State=="LA" | elec$State=="MS" | elec$State=="NC"|elec$State=="SC" | elec$State=="TN" | 
                elec$State=="TX" | elec$State=="VA" |
                elec$State=="WV") + 0 
#create variable for southern region. trick is adding 0 to a TRUE/FALSE variable it converts it to 1/0

table(elec$State,elec$south)

regsouth <- lm(ObamaPct~PctInPoverty+south,data=elec)

summary(regsouth)

# Display fitted values

b <- regsouth$coefficients
b

plot(ObamaPct~PctInPoverty,data=elec)
abline(b[1]+b[3],b[2],lwd=3,col="red")
abline(b[1],b[2],lwd=3,col="blue")


# with dummy variables and interaction terms (intercept & slope shifts)

regsouth2 <- lm(ObamaPct~PctInPoverty+south+PctInPoverty:south,data=elec)

summary(regsouth2)

regsouth2 <- lm(ObamaPct~PctInPoverty*south,data=elec)

summary(regsouth2)

b <- regsouth2$coefficients
b

plot(ObamaPct~PctInPoverty,data=elec)
abline(b[1]+b[3],b[2]+b[4],lwd=3,col="red") #intercept then slope of line
abline(b[1],b[2],lwd=3,col="blue")


# with other continuous variables, and transformations.
# note: non-arithmetic functions don't require I().
hist(elec$PopPerSqMile)

hist(elec$PopPerSqMile, breaks=300)

hist(log(elec$PopPerSqMile))
f <- ObamaPct~south*PctInPoverty+log(PopPerSqMile)+UnemploymentRateAug08

reg.kitchensink <- lm(f,data=elec)

summary(reg.kitchensink)





## Generalized linear models

?glm

?family

# Did Obama win a county or not?

elec$obwin <- (elec$ObamaPct > elec$McCainPct) + 0

table(elec$obwin)

f <- obwin~PctInPoverty+south+UnemploymentRateAug08

# Logit

logit.obama <- glm(formula=f,family=binomial(link="logit"),data=elec)

summary(logit.obama)

# Probit

probit.obama <- glm(formula=f,family=binomial(link="probit"),data=elec)

summary(probit.obama)

probit.obama <- glm(formula=f,family=binomial(link="log"),data=elec)

summary(probit.obama)




## Probability distributions

# Normal distribution

# Density function
?dnorm
#calculate probabilities or generate random numbers

x <- seq(-4,4,0.1) #creates a vector with numbers going from -4 to 4 in increments of .1
plot(x,dnorm(x),type="l",lwd=3)   # uses default mean=0, sd=1

# illustrate area under curve within 1sd
abline(v=c(-1,1)) #v is vertical line instead of a slope/intercept line.C() is concactenate
xc <- seq(-1,1,0.1)
ydens <- dnorm(xc,mean=0,sd=1)
polygon(x=c(xc,rev(xc)),y=c(rep(0,length(xc)),rev(ydens)),col="magenta")

# illustrate area under curve above 2sd
abline(v=2)
xc <- seq(2,4,0.1)
ydens <- dnorm(xc,mean=0,sd=1)
polygon(x=c(xc,rev(xc)),y=c(rep(0,length(xc)),rev(ydens)),col="magenta")


# Normal cumulative distribution function
?pnorm          

pnorm(0)            # cumulative probability from negative infinity to 0
pnorm(1.96)         # cumulative probability from negative infinity to 1.96
1-pnorm(1.96)       # cumulative probability from 1.96 to infinity
2*(1-pnorm(1.96))   # probability in "tails" beyond 1.96 SDs from mean (0)


# Quantile function
?qnorm

qnorm(0.5)          # midpoint of standard normal
qnorm(0.025)        # 2.5% in left tail: z=-1.96
qnorm(0.975)        # 2.5% in right tail: z=1.96





## Random number generation

# Normal distribution

?rnorm          

rnorm(10)

rnorm(10,mean=5,sd=2)

hist(rnorm(1000,mean=5,sd=2),breaks=30,xlim=c(-5,15),ylim=c(0,130),col="gray")
hist(rnorm(10000,mean=5,sd=2),breaks=30,xlim=c(-5,15),col="gray")

# t distribution

var.t <- rt(1000,df=5)

hist(var.t,breaks=30)

plot(x,dnorm(x),type="l",lwd=3)
lines(x,dt(x,df=5),lwd=3,col="blue")

qqnorm(var.t)   # also see ?qqplot
abline(0,1)


# Uniform distribution

?runif          

runif(10)

runif(10,min=-100,max=100)


# Binomial distribution

trials <- 20     # number of "trials"
k <- c(0:trials) # number of "successes"
p <- 0.5         # probability of a "success"

# the "theoretical" population distribution
prob <- dbinom(x=k,size=trials,prob=p)

data.frame(successes=c(0:20),probability=round(prob,4))

barplot(prob,xlab="number of successes",names.arg=k)

# random sample
draws <- rbinom(n=500,size=trials,prob=p)
hist(draws,xlim=c(0,trials),col="grey",xlab="number of successes",breaks=seq(-0.5,trials+0.5,1))



# Bernoulli distribution: 0/1 outcomes

draws <- rbinom(n=100,size=1,prob=0.7)

table(draws)




## There are tons of other built-in probability functions...

?rbinom         # Binomial distribution (incl. Bernoulli)
?runif          # Uniform distribution
?rnorm          # Normal distribution
?rt             # Student t distribution
?rf             # F distribution
?rchisq         # Chi-square distribution
?rpois          # Poisson distribution
?rbeta          # Beta distribution
?rgamma         # Gamma distribution
?rmultinom      # Multinomial distribution






## Programming control

# the apply() function: margin=2 by column; margin=1 by row

votes <- elec[,c(4:8)]

votes[1:10,]

colMeans(votes)

?apply
# same operation on multiple objects (rows, columns or even lists)
apply(votes,2,mean)

apply(votes,2,sd)

apply(votes,2,summary)


?lapply     # versions of apply for lists, etc.
?sapply
?mapply


# the if() else() statement

if (10>5) {
    cat("hello \n")
}
#/n is return

if (10>100) {
    cat("hello \n")
}

x1 <- rnorm(1,mean=1,sd=2)
x2 <- rnorm(1,mean=2,sd=2)

if (x1 > x2) {
    cat("the random draw from the mean = 1 dist was greater \n")
} else {
    cat("the random draw from the mean = 2 dist was greater \n")
}

x1
x2



# for() loop

x <- NULL

for (i in 1:30) {
    cat(i,"\n")
    x <- c(x,i)
}

x


# while() loop

# What happens if you decide to keep having kids until one is a boy?

girls <- NULL
for (i in 1:1000) {  # simulate 1000 lives
    newkid <- rbinom(1,1,0.5)
    kidvec <- newkid
    while (newkid == 0) {   # while your last kid was a girl...
        newkid <- rbinom(1,1,0.5)
        kidvec <- c(kidvec,newkid)
    }
    girls <- c(girls,sum(kidvec==0))
}

table(girls)
mean(girls)



## A simulation illustrating sampling distributions
## for linear regression coefficient estimates

N <- 100
b0 <- 1
b1 <- 3             # could demonstrate NHST by setting b1=0...
sigma <- 6

x <- rnorm(N,mean=0,sd=1)
y <- b0 + b1*x + rnorm(N,mean=0,sd=sigma)
plot(x,y)

reg <- lm(y~x)
summary(reg)
abline(coefficients(reg),lwd=2)


# Now do this 2000 times
windows(10,5)
par(mar=c(4,4,1,1))
layout(matrix(c(1,1,2,3),2,2))

nsim <- 2000
coeffs <- NULL
star <- 0
for (i in 1:nsim) {
    # simulate data-generating process
    x <- rnorm(N,mean=0,sd=1)
    y <- b0 + b1*x + rnorm(N,mean=0,sd=sigma)
    regsim <- lm(y~x)
    coeffs <- rbind(coeffs,regsim$coefficients)

    # visualize what's happening
    plot(x,y,xlim=c(-4,4),ylim=c(-20,20))
    abline(coefficients(regsim),lwd=2)
    hist(coeffs[,1],xlim=c(-2,4),breaks=20,ylim=c(0,350),
        col="gray",xlab="",main="Intercept estimates")
    hist(coeffs[,2],xlim=c(b1-3,b1+3),breaks=20,ylim=c(0,350),
        col="gray",xlab="",main="Slope estimates")
        
    # Keep trap of NHST
    if (abs(coef(summary(regsim))[2,3])>1.96) {
        star <- star+1
    }
}

coeffs

apply(coeffs,2,mean)
apply(coeffs,2,sd)

summary(regsim)

star/nsim



## Writing custom functions

is.even <- function(x) {
    ret <- (x/2 == round(x/2))
    return(ret)
}

is.even(3)

is.even(26)

x <- c(100:110)

is.even(x)


calc.exp <- function(a,b=1) {
    return(a^b)
}

calc.exp(a=2,b=4)

calc.exp(6,2)

calc.exp(6)         # uses default b=1

calc.exp()          # gives error message because no default for a






## Optimization

?optim

square <- function(x) {
    sq <- ((x-5)^2)+(4*x)+3
    return(sq)
}

square(6)

x <- c(-5:10)
plot(x,square(x),type="l")

# optim() is a minimizer by default
res <- optim(par=0,
             fn=square,
             method="BFGS",
             hessian=T)

res



## Maximum likelihood estimation for linear regression model

ols.data <- function(N,b,sigsq) {
    ret <- data.frame(x=rnorm(N),y=NA)
    ret$y <- b[1] + b[2]*ret$x + rnorm(N,mean=0,sd=sqrt(sigsq))
    plot(y~x,ret)
    return(ret)
}

ols.llik <- function(param,dat) {
    xb <- param[1] + param[2]*dat$x
    llik <- -0.5 * log(2*pi*param[3])-((dat$y-xb)^2/(2*param[3]))
    return(sum(llik))
}

N <- 500
b <- c(-5,3)
sigsq <- 9      # fairly large.  Smaller values could produce NaNs in the llik function.

dat <- ols.data(N,b,sigsq)

summary(lm(y~x,dat))

ols.est <- optim(par=c(1,1,1),
                 fn=ols.llik,
                 dat=dat,
                 hessian=TRUE,
                 control=list(fnscale=-1))   # "control" argument makes optim a maximizer

ols.est

# Standard errors using observed information (negative hessian)
library(MASS)
sqrt(diag(ginv(-ols.est$hessian)))

?merge #merging two files
?avplots #partial plots of the data

# end of file.
