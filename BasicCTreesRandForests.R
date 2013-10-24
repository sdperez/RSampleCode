######################
#Simple code for classification trees and random forests
library ("randomForest")
library("rpart")
data(iris)
tree<-rpart(Species~.,data=iris)#creates a tree using all variables in the iris dataset
plot(tree)
text(tree)#creates plot then labels the nodes

#Run random forests on the data. The results wil be different each time because of the randomness in 
#the analysis
rf1 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)
rf2 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)
rf3 <- randomForest(Species ~ ., iris, ntree=50, norm.votes=FALSE)

getTree(rf1, k=1)
getTree(rf1, k=50)#gets node information about a specific tree in the algorithm
plot(margin(rf1))
print(rf1)
importance(rf1)
varImpPlot(rf1)#a table of the importance of each variable and then a plot of the same results

## Test use of 32-level factor as a predictor:
set.seed(1)
x <- data.frame(x1=gl(32, 5), x2=runif(160), y=rnorm(160))
(rf1 <- randomForest(x[-3], x[[3]], ntree=10))#another way of calling a random forest.
#instead of using an expression name the X's then the Y variable(in this case the third column in x)
plot(rf1)