#The confusion matrix is calculated at a specific point determined by the cutoff
#on the votes. Depending on your needs, i.e., better precision (reduce false positives) 
#or better sensitivity (reduce false negatives) you may prefer a different cutoff. 

#For this purpose I recommend plotting (i) a ROC curve, (ii) a recall-precision and 
#(iii) a calibrating curve in order to select the cutoff that best fits your purposes. 
#All these can be easily plotted using the 2 following functions from the ROCR R library 
#(available also on CRAN):
#  pred.obj <- prediction(predictions, labels,...) 
#performance(pred.obj, measure, ...) 

#For example:
  rf <- randomForest (x,y,...); 
OOB.votes <- predict (rf,x,type="prob"); 
OOB.pred <- OOB.votes[,2]; 

pred.obj <- prediction (OOB.pred,y); 

RP.perf <- performance(pred.obj, "rec","prec"); 
plot (RP.perf); 

ROC.perf <- performance(pred.obj, "fpr","tpr"); 
plot (ROC.perf); 

plot  (RP.perf@alpha.values[[1]],RP.perf@x.values[[1]]); 
lines (RP.perf@alpha.values[[1]],RP.perf@y.values[[1]]); 
lines (ROC.perf@alpha.values[[1]],ROC.perf@x.values[[1]]); 
