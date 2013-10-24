## 
## Drew Linzer
## dlinzer@emory.edu
## March 23, 2012
## 
## Emory University
## SBSRC Workshop: Statistical Analysis Using R
## 
## SBSRC-Day1.R
## 
## R syntax, objects, and data handling.
## Descriptive statistics and data visualization.
## 


## R is a fancy calculator.

# Arithmetic

1+2

4*8

6^2

(4*(6-2))/(24-4)

4*6-2/24-4

# Logical operators

3 > 4

3 = 4 # = is an assigment, R is trying to assign the value 4 to 3

3 == 4 #double = is the correct form for comparisons

3 != 4

!(3==4)

(5+3) > (2*3) # 8 is greater than 6

(3<4) & (5>6) #AND

(3<4) | (5>6) #OR

# Functions take "arguments" in parentheses

abs(-4)

round(2.4)

floor(2.4) #round down

ceiling(2.4) #round up

sqrt(16)

log(10)

log10(10)

exp(4)

??round #searches anything to do with the word round not just the function round

# Can assign results to "objects" to save for later

val <- 4*8 #<- assign the value to an object named val

val

vaf <- {32 34 45}

## Data: R comes with lots of data.

data()




## Packages: R isn't complete when you download it.

install.packages("vcd")

library(vcd)

data()

?Baseball

data(Baseball)

Baseball

library(foreign)



## Exporting data

# Set your "working directory" where R will look for files

setwd("C:/Users/sdperez/Desktop")  #set the default computer path you wil be using. Like a SAS library.



# for data in matrix form:

write.csv(Baseball,file="baseball.csv")

?write.csv

write.csv(Baseball,file="baseball.csv",row.names=F)


# for any other sort of R object:

dput(Baseball,file="baseball.put")

?dput


## Importing data

baseball.get <- dget("baseball.put")

baseball.csv <- read.csv("baseball.csv")


## "Types" of R objects.

# Data frames #Data frames are fancy matrices with features like cloumn names etc.

is.data.frame(Baseball) #checking to see if it as dataframe

names(Baseball)

dim(Baseball)

nrow(Baseball)

ncol(Baseball)



# Vectors

Baseball$homer86 # $ tells it to take a subpiece (specific column/variable) of 'Baseball' named homer86.

is.vector(Baseball$homer86)

length(Baseball$homer86)

sort(Baseball$homer86)

max(Baseball$homer86)

min(Baseball$homer86)

max(Baseball$homer86); min(Baseball$homer86) #does both at once

Baseball$hits86/Baseball$atbat86

Baseball$avg86 <- Baseball$hits86/Baseball$atbat86 #add a new variable to dataset Baseball

dim(Baseball)

# Matrices are "unnamed" data frames

cbind(Baseball$atbat86,Baseball$homer86) #column bind. Binds two columns into a matrix

abhr <- cbind(Baseball$atbat86,Baseball$homer86)
abhr[2,1] #return the 2nd row 1st column variable
abhr[]

is.matrix(abhr)




## Use "indexing" [ ] to easily get information out of (and into) data objects

Baseball

# Cal Ripken is the 46th person (row) in the data

Baseball$homer86[46] 
Baseball$homer86[45:47] #:means  45 to 47

#actually change or reassign a value

Baseball$homer86[46]<- 70
Baseball$homer86[Baseball$homer86==0]<-1
Baseball$homer86[Baseball$homer86==1] #simply shows the home runs for those which had 1 homeruns
Baseball$name2[Baseball$homer86==1] #this is better because it shows the names of the people with 1 homerun
Baseball$name2[Baseball$homer86>31 | Baseball$avg86>=.300] #bit more complex

# What was the maximum number of home runs?

sort(Baseball$homer86)[322] 

# Who did it?

which.max(Baseball$homer86)

Baseball$name2[which.max(Baseball$homer86)]

# Another way to sort: rearrange by using a vector to index

order(Baseball$homer86)

Baseball$name2[order(Baseball$homer86,decreasing=T)]

base.sort<- Baseball[order(Baseball$homer86), ]


# Can also index rows and columns in matrices

Baseball[1,] #1st row ALL columns

Baseball[1:10,]

Baseball[Baseball$team86 == "Bal",]

Baseball[Baseball$homer86 > 30,]

Baseball[(Baseball$homer86 > 30) & (Baseball$avg86 > 0.300),]

Baseball[,1:2]

Baseball[(Baseball$homer86 > 30) & (Baseball$avg86 > 0.300),1:2]

# I shouldn't do this...
Baseball$homer86[Baseball$name2=="Ripken"] <- 62

#looking at missing data (NA)

is.na(Baseball$sal87)

table(is.na(Baseball$sal87)) #frequency table of missing and nonmissing
Baseball[is.na(Baseball$sal87),1:2] #names of people with missing salaries in 87
Baseball[!is.na(Baseball$sal87),1:2] #exclamation is like a NOT so it flips true and false


## Other handy matrix/data frame operations

colSums(Baseball[,3:8])

colSums(Baseball[Baseball$league86=="A",3:8])

colSums(Baseball[Baseball$league86=="N",3:8])


dim(Baseball[Baseball$league86=="A",3:8])

dim(Baseball[Baseball$league86=="N",3:8])


colMeans(Baseball[Baseball$league86=="A",3:8])

colMeans(Baseball[Baseball$league86=="N",3:8])

# there are equivalent commands for rows: rowMeans, rowSums







## Oftentimes want to do analyses based on our own vectors, matrices, etc.

# Ways to create vectors

val <- 500

val <- c(val,999)

c(1:9)

seq(from=1,to=9,by=1)

seq(1,9,1)

seq(-100,100,10)

rep(1,10)

vec1 <- c(1:10)
vec2 <- 10*vec1

vec2-vec1
vec2/vec1


rep("hello",10)

paste("hello","there")

paste("hello","there",sep="")


# Ways to create matrices

mat1 <- matrix(c(1:9))

mat1 <- matrix(c(1:9),nrow=3,ncol=3)

mat1 <- matrix(c(1:9),nrow=3,ncol=3,byrow=T)

t(mat1)

mat2 <- matrix(c(1,-2,2,4,5,-3,-1,2,3),nrow=3,ncol=3)

mat1 + mat2

mat1 - mat2

mat1 %*% mat2

library(MASS)

ginv(mat2)

ginv(mat2) %*% mat2

round(ginv(mat2) %*% mat2,3)


# Missing values

mat2[1,1] <- NA

mat1 + mat2


# Turn a matrix into a data frame

df1 <- as.data.frame(mat1)

df1

names(df1) <- c("variable1","variable2","variable3")

df1

df1$variable3


# A new object type: lists

mylist <- list()

mylist

mylist[[1]] <- matrix(c(1:50),nrow=10,ncol=5)

mylist

mylist[[2]] <- "some text"

mylist[[3]] <- c(80:100)

mylist

mylist[[3]]

names(mylist) <- c("matrix","text","vector")

mylist

mylist[[3]]
mylist$vector





## Data analysis: summary statistics

summary(Baseball) #notice that categorical variables (factors in R) are summarized in frequencies. For more info: ?factors

mean(Baseball$homer86)

median(Baseball$homer86)

quantile(Baseball$homer86)

sd(Baseball$homer86)

var(Baseball$homer86)






# Categorical variables: tables

table(Baseball$league86) #like proc freq

table(Baseball$team86,Baseball$league86)

table(Baseball$team86,Baseball$div86,Baseball$league86)


# this three-way table is an object of type "array": a matrix with more than two dimensions

tab <- table(Baseball$team86,Baseball$div86,Baseball$league86) #(rows, columns,strata/array)

is.array(tab)

tab[2,1,1]


newarr <- array(NA,dim=c(3,6,4,2))

newarr


# Please never do this

pie(table(Baseball$team86))






## Data visualization

# boxplots

boxplot(Baseball$homer86)#1.5 IQR

# For two variables, syntax is DV~IV

boxplot(Baseball$homer86~Baseball$league86)# Variable1/homeruns AS A FUNCTION of var2/league

boxplot(homer86~league86, Baseball) #different syntax, same results



# histograms

hist(Baseball$years)

hist(Baseball$atbat86)

hist(Baseball$homer86)

hist(Baseball$homer86,breaks=40)

hist(Baseball$homer86,breaks=40,xlab="Home runs",main="Histogram of Home Runs in 1986")

hist(Baseball$homer86,breaks=40,xlab="Home runs",main="Histogram of Home Runs in 1986",freq=FALSE)

hist(Baseball$homer86,breaks=40,xlab="Home runs",main="Histogram of Home Runs in 1986", col="magenta")

# density plots: "smoothed histograms"

lines(density(Baseball$homer86))

lines(density(Baseball$homer86,from=0),lwd=3,col="red")






# scatterplots

plot(Baseball$atbat86,Baseball$homer86)

plot(homer86~atbat86,data=Baseball)

plot(homer86~atbat86,data=Baseball, xlab="At bats",ylab="Home runs",main="Home runs vs. At bats in 1986")

plot(homer86~atbat86,data=Baseball, xlab="At bats",ylab="Home runs",main="Home runs vs. At bats in 1986",
     cex=1.2,col="red",pch=19)    # try different values of pch argument

# Add to an existing plot
points(homer86~atbat86,data=Baseball[Baseball$league86=="A",],cex=1.2,pch=19,col="blue")

legend(100,40,c("American","National"),pch=19,col=c("blue","red"))

abline(h=30)

abline(v=600)

# http://cloford.com/resources/colours/500col.htm


# Save plots to disk
savePlot("homeruns.pdf",type="pdf")


# other ways to add lines to graphs (will do more of this next week)

?lines
?segments

# trick for plotting labels only

plot(homer86~atbat86,data=Baseball,col="white")

text(Baseball$atbat86,Baseball$homer86,Baseball$name2,cex=0.8)





# scatterplot matrix

# Does it automatically if you give plot a data frame

plot(data.frame(Baseball$atbat86,Baseball$homer86,Baseball$runs86,Baseball$walks86))






# plot window control

?par

par(mfrow=c(2,2))

plot(homer86~atbat86,data=Baseball)

plot(runs86~atbat86,data=Baseball)

plot(walks86~atbat86,data=Baseball)

plot(walks86~atbat86,data=Baseball)

# mar: plot margins, c(bottom, left, top, right)
# las=1: print all axis labels horizontally
par(mar=c(5,5,0.5,0.5),las=1)

par(ask=T)

plot(homer86~atbat86,data=Baseball)

par(ask=F)




## Lots of other rich packages for data visualization


library(lattice)

demo(lattice)

splom(data.frame(Baseball$atbat86,Baseball$homer86,Baseball$runs86,Baseball$walks86))


library(rgl)

example(surface3d)
example(plot3d)
demo(rgl)

plot3d(Baseball$atbat86,Baseball$homer86,Baseball$runs86)


library(rggobi)

ggobi(Baseball)


# More:
# http://cran.r-project.org/web/views/Graphics.html
# http://addictedtor.free.fr/graphiques/thumbs.php
# http://www.statmethods.net/graphs/index.html



# end of file.
