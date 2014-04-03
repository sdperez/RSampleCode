# make a venn diagram
library(limma)
#this one takes two sets and the names of the sets.
Venn2<-function(set1,set2,names)
{
  stopifnot(length(names) == 2)
  #Form universe as union of sets
  universe<-sort(unique(c(set1,set2)))
  Counts<-matrix(0,nrow=length(universe),ncol=2)
  colnames(Counts)<-names
  for(i in 1:length(universe))
  {
    Counts[i,1]<- universe[i] %in% set1
    Counts[i,2]<- universe[i] %in% set2
  }
  vennDiagram(vennCounts(Counts));
  tab<-data.frame(universe,Counts,stringsAsFactors=FALSE)
  colnames(tab)<-c("genes",names);
  return(tab);
}

#same as above, except with a title.
Venn2t<-function(set1,set2,names,title)
{
  stopifnot(length(names) == 2)
  #Form universe as union of sets
  universe<-sort(unique(c(set1,set2)))
  Counts<-matrix(0,nrow=length(universe),ncol=2)
  colnames(Counts)<-names
  for(i in 1:length(universe))
  {
    Counts[i,1]<- universe[i] %in% set1
    Counts[i,2]<- universe[i] %in% set2
  }
  par(mar=c(1,1,2,1),oma=c(1,1,2,1))
  vennDiagram(vennCounts(Counts));
  mtext(title,outer=T,line=1);
  tab<-data.frame(universe,Counts,stringsAsFactors=FALSE)
  colnames(tab)<-c("genes",names);
  return(tab);
}

#this one takes 3 sets
require(limma)
Venn3 <- function(set1, set2, set3, names)
{
  stopifnot( length(names) == 3)
  # Form universe as union of all three sets
  universe <- sort( unique( c(set1, set2, set3) ) )
  Counts <- matrix(0, nrow=length(universe), ncol=3)
  colnames(Counts) <- names
  
  for (i in 1:length(universe))
  {
    Counts[i,1] <- universe[i] %in% set1
    Counts[i,2] <- universe[i] %in% set2
    Counts[i,3] <- universe[i] %in% set3
  }
  par(mar=c(1,1,2,1),oma=c(1,1,2,1))
  vennDiagram(vennCounts(Counts));
  tab<-data.frame(universe,Counts,stringsAsFactors=FALSE)
  colnames(tab)<-c("genes",names);
  return(tab);
}

#3 sets, with a title.
Venn3t <- function(set1, set2, set3, names, title)
{
  stopifnot( length(names) == 3)
  # Form universe as union of all three sets
  universe <- sort( unique( c(set1, set2, set3) ) )
  Counts <- matrix(0, nrow=length(universe), ncol=3)
  colnames(Counts) <- names
  
  for (i in 1:length(universe))
  {
    Counts[i,1] <- universe[i] %in% set1
    Counts[i,2] <- universe[i] %in% set2
    Counts[i,3] <- universe[i] %in% set3
  }
  
  par(mar=c(1,1,2,1),oma=c(1,1,2,1))
  vennDiagram( vennCounts(Counts) )
  mtext(title,outer=T,line=1);
  tab<-data.frame(universe,Counts,stringsAsFactors=FALSE)
  colnames(tab)<-c("genes",names);
  return(tab);
}
