##
## Notes from Coursera R Class
## by Roger Peng
## Week 1
##

###########
#Basic data selection/subsetting code
###########

#creating two matrices
x<- matrix (1:4,2,2) 
# the first series is the data the second and third number are the dimensions
y<-matrix(rep(10, 4), 2,2) #repeating 10 four times is the data

x*y #is elementwise multiplication (1st row 1st column of x time 1st row 1st column y)
x %*% y #true matrix multiplication

x[1,2] #returns a VECTOR with the data in the 1st row second column
x[1,2,drop=FALSE] #returns a 1x1 MATRIX with only the above info 

#Double brackets can be used to select elements from lists or data frames.
#They return the type of element contained in that spot. Single brackets would
#return a LIST with only one element.
x<-list(foo=1:4, bar=.6)
y<-x[1]
x[[1]]# a vector with four numbers
x[["bar"]] #can also use the name of the object

#To get multiple elements from a list you must use single brackets
x[c(1,2)]
#The [[]] operator can be used to get computed names (single brackets can't)
name<-"foo"
x[[name]]

x[[1]][[3]] #gives third element of the first element in the list
x[[c(1,3)]] #does the same

#removing missing values
x<-c(1,2,NA,4,NA,5)
x[!is.na(x)] #is.na(x) returns the logical vector
y<-c("a","b",NA,"d",NA,NA)
complete.cases(x,y) #returns all lines that have no missing data (in either field)

#One more selection example
x[1:3][3] #selects the first three elements then gets the first element out of that

#########
#Other functions
#########

str(lm) #str gives you information about the 'structure' of an R object
#in the case of functions it gives you the list of arguments
x<-rnorm(100, 2, 4)
str(x)#tells you its numeric vector vector and shows you a couple of example
library(datasets)
head(airquality)#prints first six obs
str(airquality)
s<-split(airquality, airquality$Month) #splits dataframe by month
str(s)