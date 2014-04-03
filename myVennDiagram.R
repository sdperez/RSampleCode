Venn3.mine <- function(set1, set2, set3,universe, names)
{
  stopifnot( length(names) == 3)
  # Form universe as union of all three sets
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
a<-c(1,2,3,4,5)
b<-c(2,3,5,6,8,9)
c<-c(7,8,9)
u<-seq(1,13)

Venn3.mine(a,b,c,u,c('a','b','c'))
