######################################
#Example Graphs

cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)
# Graph cars using a y axis that ranges from 0 to 12
plot(cars, type="o", col="blue",ylim=c(0,12))
lines(trucks, type="o", col="red")

barplot(Top.JTable$Freq,names=Top.JTable$journals,
        #main="Top 20 Journals by Publication",
        axes=TRUE,
        las=2,
        cex.names=.7)