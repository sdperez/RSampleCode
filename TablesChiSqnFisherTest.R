#########################################################
#Contingency tables, Chi-squared tests and Fisher's exact
#
#########################################################
#Data
rej<-c(rep(1,3),rep(0,8),rep(0,9))
Group<-c(rep(0,11),rep(1,9))

#Contingency Table
table(rej,Group) #Frequency table
prop.table(table(rej,Group),margin=2) #proprtion table. Margin=2 gives column percents

#Stat tests
chisq.test(rej,Group) #chi squared test (notice warning for small samples)
fisher.test(rej,Group) #Fisher's exact
