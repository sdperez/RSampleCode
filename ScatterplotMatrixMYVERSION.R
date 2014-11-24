###################################################
#'My version of a scatterplot matrix
#'The matrix is organized with all 'predictor' variables
#'in rows and a column of scatterplots for each 'outcome'
#' variable.
##########################################################

#In this case we create a 6 by 5 matrix. The first row and first column
#are for titles so here we have 5 predictors and 4 outcome variables 
#to look at.
par(mfcol=c(6,5), oma=c(1,1,4,1), mar=c(.5,.5,.5,.5))
for (i in 1:5){
  for (j in 1:6){
    if (i==1 & j==1) {
      plot(1:5,1:5,type="n", xlab='',ylab='', xaxt='n', yaxt='n')
      text(3,3,'Variable')
    } else if (i==1){
      plot(1:5,1:5,type="n", xlab='',ylab='', xaxt='n', yaxt='n')
      text(3,3,label[input[j-1]]) 
    } else if (j==1) {
      plot(1:5,1:5,type="n", xlab='',ylab='', xaxt='n', yaxt='n')
      text(3,2.5,label[outcome[i-1]]) 
    }
    else {
      plot(df[,outcome[i-1]],df[,input[j-1]], xlab='',ylab='', xaxt='n',
           yaxt='n',pch=19,cex=.4)
      ok <- complete.cases(df[,c(outcome[i-1],input[j-1])])
      lines(lowess(df[ok,outcome[i-1]],df[ok,input[j-1]]),col='blue')
      p<-cor.test(df[,outcome[i-1]],df[,input[j-1]],use='complete.obs',method='pearson')$p.value
      legend("topright",
             legend=format(p,digits=2, trim=T),
             pt.cex=cex*.7, bty='n')
    }
  }
  
}
mtext("Correlations to %Weightloss\n",outer = TRUE)