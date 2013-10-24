##########################################################
#Data Munging
#Operations for cleaning and seting datasets for analysis.
#From "Data Analysis" course on Coursera.
#
########################################################
setwd("C:/Users/sdperez.EMORYUNIVAD/Desktop/My Documents/EducationalMaterials/DataAnalysis-Coursera/week2/008dataMungingBasics")
#Let's get some data first
#fileUrl1 <- "https://dl.dropbox.com/u/7710864/data/reviews-apr29.csv"
#fileUrl2 <- "https://dl.dropbox.com/u/7710864/data/solutions-apr29.csv"
#download.file(fileUrl1,destfile="./data/reviews.csv",method="curl")
#download.file(fileUrl2,destfile="./data/solutions.csv",method="curl")
sampleData <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

head(sampleData,2) #look at names and first observations;

tolower(names(sampleData)) #turn all column names into lowercase

splitnames<-strsplit(names(sampleData),"\\.") #splits the names of variables at a dot
#the \\ 'exits' the character because . is a special character in R.

#Now you can select the first element in each of the lists created
#(everything before the . becomes the new name) 
splitnames<-strsplit(names(sampleData),"_")
sapply(splitnames, function(x){x[1]}) 

sub("_", "",names(sampleData)) #substitutes the character'_' for no character "". Only the first instance.
gsub #replaces all the instances.
sub("\\.", "",names(sampleData)) #substitutes the character'.'(notice the \\ escape characters) 