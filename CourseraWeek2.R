##
## Notes from Coursera R Class
## by Roger Peng
## Week 2
##

###########
#Loop functions
#Set of functions that loops over many objects and applies a function to all
###########

  #lapply: applies a function to a LIST of objects. If the object you submit is not a list
  #it will try to coerce it into one. syntax:
  #lapply(X, FUN,....) X=name of the object, FUN=is the function to use, and ... 
  #are other arguments that particular function will need.It always returns a 
  #list of output.;

x<-list(a=1:4,b=rnorm(10),c=rnorm(20,1)) # this creates a list with 3 vectors.
#The first vector are the numbers 1 thorugh 4. the second is 10 sets of random (normal) numbers.
#and the third is a vector of 20 random normals with mean of 1;

x[[2]]
x$c

lapply(x,mean) #lapply applies the function 'mean' to all elements of the list 'x'

#you can also define a function within lapply:
z<- matrix (1:4,2,2) 
y<-matrix(rep(10, 4), 2,2)
l<-list(x,z)

lapply(l,function(elt) elt[,1]) #elt is defined here as selecting the first colum (it disapears after)

#sapply tries to simply lapply so that the result is a vector or a matrix (if that makes sense)
  
sapply(x,mean) #gives a simple vector

#apply calculates a function on the margins of an array. Example: if you want to get the mean
#of the rows you are summarizing over the column dimension. You can also summarize on the rows
#This may also be accomplished using 'rowSums', 'rowMeans', 'colSums', 'colMeans' for means or sums.
#For other functions, or for arrays of higher dimensions use apply:

a<-array(rnorm(2*2*10),c(2,2,10)) #creates 40 random number and puts them in a 2x2x10 array
apply (a, c(1,2),mean) #gets the 'mean' of array 'a' summarized over the 3rd dimension (keeping dimension 1 and 2)
#result is a 2X2 matrix with each cell being the mean of the corresponding cell in each
#of the 10 stratified tables

#tapply calculates a function on a vector after subsetting by a factor 
#(eg get mean of age by gender)
x<-c(rnorm(10), runif(10), rnorm(10,1))# creates 30 random numbers from different distributions
f<-gl(3,10) #creates 3 factor levels and copies 10 times each.
tapply(x,f,mean) #gets mean by factor level.

#For more complicated scenarios you can use the split function inconjuction of lapply or
#other apply functions.
library(datasets)
head(airquality)
#we want the mean of the first three columns for each month
s<-split(airquality, airquality$Month) #split dataset by the variable month (gives a list)
lapply(s,function(x) colMeans(x[, c("Ozone","Solar.R", "Wind")]))#returns a list

sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R", "Wind")]))#returns a 3x5 matrix

sapply(s,function(x) colMeans(x[, c("Ozone","Solar.R", "Wind")], na.rm=TRUE))
#This removes the NAs before the calculation is performed.

###########
#Syntax for looping and logical programming
#"Control Structures"
###########

x<-10

if (x<11) { 
  y<-1
} else if (x<12){ 
  y<-2
}else {Y<-3}# make sure the else directly follows the brackets (in same line)

#another structure
y<- if(x<11) {2} else {3} 

##for loops
x<-c(10,11,12,13)
for (i in 1:4) {
  y[i]<- if(x[i]<11) {2} else {3}
}

for (i in seq_along(x)) {
  y[i]<- if(x[i]<11) {2} else {3}
}# seq_along creates a sequence of integers refering to each item in vector x

##while loops
count<-1
while (count<10){
  print(count)
  count<-count+1
}

z<-5
while (z>=3 && z<=10) { # && is AND
  print(z)
  coin<-rbinom(1,1,.5)
  
  if (coin ==1){ z<-z+1} else {z<- z-1}
}

##repeat loop. only way to stop it is to call 'break'
repeat  { # && is AND
  print(z)
  z<-z+rbinom(1,1,.5)
  if (z>10){ break} 
}

##next statement skips iterations of a loop
for (i in 1:20) {
  if (i<11) {next #skip to next i
  }
  print(i)}


###########
#Writing your own functions
#Syntax
###########
f<- function(<arguments needed>) {
  ##do something, return something
}



#Optimization
